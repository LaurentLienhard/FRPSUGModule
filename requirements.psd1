@{
    PSDependOptions  = @{
        Target = 'CurrentUser'
    }

    Pester           = @{
        Version    = '5.0.2'
        Parameters = @{
            SkipPublisherCheck = $true
        }
    }
    InvokeBuild      = '5.6.0'
    BuildHelpers     = '2.0.15'
    PlatyPS          = '0.14.0'
    PSDeploy         = '1.0.5'
    PSScriptAnalyzer = '1.19.1'
    Plaster          = '1.1.3'
}
