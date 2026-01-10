[CmdletBinding()]
param(
    [string]$ThemePath = ".\\src\\Themes\\PersonalSite.Theme\\",
    [string]$BuildPath = ".\\build",
    [bool]$Confirm = $true,
    [string]$Url = "https://markbarthasite.dotnest.net/OrchardCore.Deployment.Remote/ImportRemoteInstance/Import",
    [string]$Name = "Deploy",
    [string]$Key,
    [switch]$SkipRestore
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

$ThemePath = Resolve-RepoPath -Path $ThemePath
$BuildPath = Resolve-RepoPath -Path $BuildPath

$confirmValue = if ($Confirm) { "True" } else { "False" }
$arguments = @(
    "tool", "run", "media-theme-deploy",
    "-p", $ThemePath,
    "-d", $BuildPath,
    "-c", $confirmValue,
    "-u", $Url,
    "-n", $Name,
    "-k", $Key
)

Push-Location -Path $PSScriptRoot
try {
    if (-not $SkipRestore) {
        & dotnet restore
        & dotnet tool restore
    }

    & dotnet @arguments
}
finally {
    Pop-Location
}
