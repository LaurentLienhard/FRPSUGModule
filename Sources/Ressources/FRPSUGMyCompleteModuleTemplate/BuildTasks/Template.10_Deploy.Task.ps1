task Deploy {
    Write-Verbose "[DEPLOY][START]"
    $PSDeployParam = @{
        Path    = join-path $env:BHProjectPath -ChildPath "\<%= $PLASTER_PARAM_ModuleName %>.PSDeploy.ps1"
        Tags    = "DEV"
        Force   = $true
        Verbose = $false
    }


    Invoke-PSDeploy @PSDeployParam
    Write-Verbose "[DEPLOY][END]"
}