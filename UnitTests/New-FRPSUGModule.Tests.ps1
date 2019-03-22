Import-Module -Force $PSScriptRoot\..\FRPSUGModule\FRPSUGModule.psm1


InModuleScope FRPSUGModule -ScriptBlock {

    Describe "Testing if Parameter's Function are available: 'New-FRPSUGModule'" {

        it '[Function][Parameter] The DestinationPath parameter should be available.' {

            (Get-Command New-FRPSUGModule).Parameters.keys -contains "DestinationPath" | Should Be $true

        }
    }
}

Describe 'Test Function New-FRPSUGModule' {
    Context 'Object User ' {
    }
}


