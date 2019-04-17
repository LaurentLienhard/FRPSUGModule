Import-Module -FullyQualifiedName ($env:BHBuildOutput + "\" + $env:BHProjectName + "\" + $env:BHProjectName + ".psd1") -PassThru


InModuleScope FRPSUGModule -ScriptBlock {

    Describe "Testing if Parameter's Function are available: 'New-FRPSUGModule'" {

        it '[Function][Parameter] The DestinationPath parameter should be available.' {

            (Get-Command New-FRPSUGModule).Parameters.keys -contains "DestinationPath" | Should Be $true

        }
    }
}

Describe 'Test Function New-FRPSUGModule' {
    Context 'FRPSUGModuletemplate' {
        $ModuleTemplatePath = $env:BHBuildOutput + "\" + $env:BHProjectName + "\Ressources\FRPSUGModuletemplate\"
        It '[FRPSUGModuletemplate] The Plaster Manifest file must exist' {
            Test-Path $ModuleTemplatePath\plasterManifest.xml | Should Be $true
        }
        It '[FRPSUGModuletemplate] The FRPSUGModuleTemplate path must contain BuildTasks folder with all files' {
            Test-Path $ModuleTemplatePath\BuildTasks | Should Be $true
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
}


