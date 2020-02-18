$source = Join-Path $env:BHBuildOutput -ChildPath "\$env:BHProjectName"
$LocalPowershellModule = [environment]::getfolderpath("mydocuments") + '\WindowsPowerShell\Modules\' + $env:BHProjectName
$LocalCoreModule = [environment]::getfolderpath("mydocuments") + '\PowerShell\Modules\' + $env:BHProjectName

Deploy Dev {

    By FileSystem {

        FromSource $source
        To $LocalPowershellModule
        Tagged Dev
        WithOptions @{
            Mirror = $true
        }
    }

    By FileSystem {

        FromSource $source
        To $LocalCoreModule
        Tagged Dev
        WithOptions @{
            Mirror = $true
        }
    }

}