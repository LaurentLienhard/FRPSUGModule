#region <New-FRPSUGModule>
function New-FRPSUGModule {
    [CmdletBinding()]
    param (
        [String]$DestinationPath
    )

    begin {
        $Current = $PSScriptRoot
        $Root = ((Get-Item $Current).Parent).FullName
        $TemplatePath = $Current + "\Ressources\FRPSUGModuleTemplate"
    }

    process {
        Invoke-Plaster -TemplatePath $TemplatePath -DestinationPath $DestinationPath
    }

    end {
    }
}
#endregion