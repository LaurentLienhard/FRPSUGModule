#region <New-FRPSUGModule>
function New-FRPSUGModule
{
    <#
    .SYNOPSIS
        Creating a new module structure
    .DESCRIPTION
        This function allows, using a Plaster model, to generate a new module structure
        Information for the creation of the module (name, version ...) will be requested by the template Plaster
        This function requires having the Plaster module installed
    .PARAMETER DestinationPath
        The directory path in which the new module will be created
    .EXAMPLE
        PS C:\> New-FRPSUGModule -DestinationPath $env:TEMP
        This command will create a new module in the Temp directory of the user
    .LINK
        https://github.com/LaurentLienhard/FRPSUGModule/blob/master/Docs/EN-US/New-FRPSUGModule.md
    .NOTES
        General notes
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Position = 0, Mandatory = $true)]
        [ValidateSet("FRPSUGModuleTemplate")]
        [string]$TemplateName,
        [Parameter(Position = 2, Mandatory = $true)]
        [ValidateScript( { Test-Path $_ })]
        [String]$DestinationPath,
        [Parameter(Position = 3)]
        [System.Collections.Hashtable]$Params
    )

    begin
    {
        $Current = $PSScriptRoot
        $TemplatePath = $Current + "\Ressources\" + $TemplateName
        Write-Verbose "The Template Path use is : $TemplatePath"
    }

    process
    {
        if ($PSBoundParameters['Params'])
        {
            $Params.Add('TemplatePath', $TemplatePath)
            $Params.Add('DestinationPath', $DestinationPath)
        }
        else
        {
            $Params = @{
                TemplatePath    = $TemplatePath
                DestinationPath = $DestinationPath
            }
        }
        Invoke-Plaster @Params
    }

    end
    {
    }
}
#endregion