$source = ""
$destination_dev = ""

$ModuleName = "FRPSUGModule"
$Current = $PSScriptRoot
$Root = ((Get-Item $Current).Parent).FullName + "\..\"

$source = $Root + $ModuleName
$destination_dev = [environment]::getfolderpath("mydocuments") + '\WindowsPowerShell\Modules\' + $ModuleName

Deploy Dev {

    By FileSystem {

        FromSource $source
        To $destination_dev
        Tagged Dev
        WithOptions @{
            Mirror = $true
        }
    }
}
