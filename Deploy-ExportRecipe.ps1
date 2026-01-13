[CmdletBinding()]
param(
    [string]$RecipePath = ".\\src\\Themes\\PersonalSite.Theme\\Recipes\\PersonalSite.Export.recipe.json",
    [string]$BuildPath = ".\\build",
    [string]$Url = "https://markbarthasite.dotnest.net/OrchardCore.Deployment.Remote/ImportRemoteInstance/Import",
    [string]$Name = "Deploy",
    [string]$Key,
    [switch]$SendInvalidPayload,
    [switch]$KeepPackage
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Get-EnvFileValue {
    param(
        [string]$Path,
        [string]$Name
    )

    if (-not (Test-Path -Path $Path)) {
        return $null
    }

    foreach ($line in Get-Content -Path $Path) {
        $trimmed = $line.Trim()
        if (-not $trimmed -or $trimmed.StartsWith("#")) {
            continue
        }

        if ($trimmed -match "^\s*([^=]+?)\s*=\s*(.*)\s*$") {
            $key = $matches[1].Trim()
            $value = $matches[2]
            if ($key -eq $Name) {
                return $value.Trim('"', "'")
            }
        }
    }

    return $null
}

function Resolve-RepoPath {
    param([string]$Path)

    if ([System.IO.Path]::IsPathRooted($Path)) {
        return $Path
    }

    return [System.IO.Path]::GetFullPath((Join-Path -Path $PSScriptRoot -ChildPath $Path))
}

if (-not $Key) {
    $Key = $env:MEDIA_THEME_DEPLOY_KEY
}

if (-not $Key) {
    $envFilePath = Join-Path -Path $PSScriptRoot -ChildPath ".env"
    $Key = Get-EnvFileValue -Path $envFilePath -Name "MEDIA_THEME_DEPLOY_KEY"
}

if (-not $Key) {
    throw "Missing deployment key. Provide -Key, set MEDIA_THEME_DEPLOY_KEY, or define it in .env."
}

$RecipePath = Resolve-RepoPath -Path $RecipePath
if (-not $SendInvalidPayload -and -not (Test-Path -Path $RecipePath)) {
    throw "Recipe file not found at $RecipePath."
}

$BuildPath = Resolve-RepoPath -Path $BuildPath
if (-not (Test-Path -Path $BuildPath)) {
    New-Item -Path $BuildPath -ItemType Directory | Out-Null
}

Add-Type -AssemblyName System.Net.Http
Add-Type -AssemblyName System.IO.Compression.FileSystem

$httpClient = [System.Net.Http.HttpClient]::new()
$requestContent = $null
$fileStream = $null
$response = $null
$responseContent = $null
$deploymentDirectory = $null
$zipFilePath = $null

try {
    $timestamp = Get-Date -Format "yyyyMMddHHmmss"
    $deploymentDirectory = Join-Path -Path $BuildPath -ChildPath ("ExportRecipeDeployment_{0}" -f $timestamp)
    if (Test-Path -Path $deploymentDirectory) {
        $deploymentDirectory = Join-Path -Path $BuildPath -ChildPath ("ExportRecipeDeployment_{0}_{1}" -f $timestamp, [System.Guid]::NewGuid().ToString("N"))
    }
    New-Item -Path $deploymentDirectory -ItemType Directory | Out-Null

    $recipeDestinationPath = Join-Path -Path $deploymentDirectory -ChildPath "Recipe.json"
    if ($SendInvalidPayload) {
        Set-Content -Path $recipeDestinationPath -Value "not-json" -Encoding ASCII
    }
    else {
        Copy-Item -Path $RecipePath -Destination $recipeDestinationPath -Force
    }

    $zipFilePath = "$deploymentDirectory.zip"
    [System.IO.Compression.ZipFile]::CreateFromDirectory($deploymentDirectory, $zipFilePath)

    $payloadFileName = [System.IO.Path]::GetFileName($zipFilePath)
    $fileStream = [System.IO.FileStream]::new(
        $zipFilePath,
        [System.IO.FileMode]::Open,
        [System.IO.FileAccess]::Read,
        [System.IO.FileShare]::ReadWrite,
        1,
        [System.IO.FileOptions]::Asynchronous -bor [System.IO.FileOptions]::SequentialScan)

    $requestContent = [System.Net.Http.MultipartFormDataContent]::new()
    $streamContent = [System.Net.Http.StreamContent]::new($fileStream)
    $requestContent.Add($streamContent, "Content", $payloadFileName)
    $requestContent.Add([System.Net.Http.StringContent]::new($Name), "ClientName")
    $requestContent.Add([System.Net.Http.StringContent]::new($Key), "ApiKey")

    $response = $httpClient.PostAsync($Url, $requestContent).GetAwaiter().GetResult()
    $responseContent = $response.Content.ReadAsStringAsync().GetAwaiter().GetResult()

    if (-not $response.IsSuccessStatusCode) {
        $details = $response.ReasonPhrase
        if ($responseContent) {
            $details = "$details`n$responseContent"
        }

        throw "Remote deployment to $Url failed with HTTP $($response.StatusCode). $details"
    }

    if ($responseContent) {
        $trimmedContent = $responseContent.Trim()
        if ($trimmedContent) {
            $parsedJson = $null
            try {
                $parsedJson = $trimmedContent | ConvertFrom-Json -ErrorAction Stop
            }
            catch {
            }

            if ($null -ne $parsedJson) {
                if ($null -ne $parsedJson.Succeeded -and -not $parsedJson.Succeeded) {
                    throw "Remote deployment reported failure: $trimmedContent"
                }

                if ($null -ne $parsedJson.Success -and -not $parsedJson.Success) {
                    throw "Remote deployment reported failure: $trimmedContent"
                }

                if ($null -ne $parsedJson.IsSuccess -and -not $parsedJson.IsSuccess) {
                    throw "Remote deployment reported failure: $trimmedContent"
                }
            }

            Write-Host "Remote deployment response: $trimmedContent"
            return
        }
    }

    Write-Host "Remote deployment to $Url succeeded."
}
finally {
    if ($null -ne $response) {
        $response.Dispose()
    }

    if ($null -ne $requestContent) {
        $requestContent.Dispose()
    }

    if ($null -ne $fileStream) {
        $fileStream.Dispose()
    }

    if ($null -ne $httpClient) {
        $httpClient.Dispose()
    }

    if (-not $KeepPackage -and $zipFilePath -and (Test-Path -Path $zipFilePath)) {
        Remove-Item -Path $zipFilePath -Force
    }

    if ($deploymentDirectory -and (Test-Path -Path $deploymentDirectory)) {
        Remove-Item -Path $deploymentDirectory -Recurse -Force
    }
}
