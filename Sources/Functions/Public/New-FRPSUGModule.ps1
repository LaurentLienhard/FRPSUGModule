#region <New-FRPSUGModule>
function New-FRPSUGModule {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [ValidateScript( {Test-Path $_})]
        [String]$DestinationPath
    )

    begin {
        $Current = $PSScriptRoot
        $TemplatePath = $Current + "\Ressources\FRPSUGModuleTemplate"
        Write-Verbose "The Template Path use is : $TemplatePath"
    }

    process {
        Invoke-Plaster -TemplatePath $TemplatePath -DestinationPath $DestinationPath
    }

    end {
    }
}
#endregion