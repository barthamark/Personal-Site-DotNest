using Lombiq.Hosting.MediaTheme.Bridge.Constants;
using OrchardCore.DisplayManagement.Manifest;

[assembly: Theme(
    Name = "Personal Site Theme",
    Author = "Márk Bartha",
    Version = "0.0.1",
    Website = "https://markbartha.com",
    Description = "My personal developer site built on DotNest (Orchard Core) using the DotNest SDK. Visit https://markbartha.com for blog posts, experiments, and more.",
    Dependencies =
    [
        FeatureNames.MediaThemeBridge
    ]
)]
