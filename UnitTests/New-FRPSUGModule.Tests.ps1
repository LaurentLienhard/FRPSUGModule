Remove-Module FRPSUGModule -Force -ErrorAction SilentlyContinue
Import-Module -Force $PSScriptRoot\..\FRPSUGModule\FRPSUGModule.psm1


InModuleScope FRPSUGModule -ScriptBlock {

    Describe "Testing if Parameter's Function are available: 'New-FRPSUGModule'" {

        it '[Function][Parameter] The DestinationPath parameter should be available.' {

            (Get-Command New-FRPSUGModule).Parameters.keys -contains "DestinationPath" | Should Be $true

        }
    }
}

Describe 'Test Function New-FRPSUGModule' {
    <#
    Context 'Ressources' {
        It '[RESSOURCES] The source directory containing the resources must exist' {
            Test-Path $PSScriptRoot\..\FRPSUGModule\Ressources | Should Be $true
        }
        It '[RESSOURCES] The source directory containing the FRPSUGModule must exist' {
            Test-Path $ModuleTemplatePath | Should Be $true
        }
    } #>

    #if (Test-Path $ModuleTemplatePath) {
    Context 'FRPSUGModuletemplate' {
        $ModuleTemplatePath = $PSScriptRoot + "\..\FRPSUGModule\Ressources\FRPSUGModuletemplate\"
        It '[FRPSUGModuletemplate] The Plaster Manifest file must exist' {
            Test-Path $ModuleTemplatePath\plasterManifest.xml | Should Be $true
        }
        It '[FRPSUGModuletemplate] The FRPSUGModuleTemplate path must contain CI folder with all files' {
            Test-Path $ModuleTemplatePath\CI | Should Be $true
        }
        It '[FRPSUGModuletemplate] The FRPSUGModuleTemplate path must contain Tasks folder with all files' {
            Test-Path $ModuleTemplatePath\Tasks | Should Be $true
        }
        It '[FRPSUGModuletemplate] The FRPSUGModuleTemplate path must contain UnitTests folder with all files' {
            Test-Path $ModuleTemplatePath\UnitTests | Should Be $true
        }
        It '[FRPSUGModuletemplate] The FRPSUGModuleTemplate path must contain Github folder with all files' {
            Test-Path $ModuleTemplatePath\Github | Should Be $true
        }
        It '[FRPSUGModuletemplate] The FRPSUGModuleTemplate path must contain Vscode folder with all files' {
            Test-Path $ModuleTemplatePath\Vscode | Should Be $true
        }
    }
    #}
}

