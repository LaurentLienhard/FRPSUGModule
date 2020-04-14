Import-Module FRPSUGModule -Force

InModuleScope FRPSUGModule {
    Describe 'Testing New-FRPSUGModule function' {
        if ($IsWindows)
        {
            $DestinationPath = $env:TEMP
        }
        else
        {
            $DestinationPath = "/tmp"
        }


        $plasterParams = @{
            ModuleName        = 'MyTestModule'
            ModuleDescription = 'Module For Pester Test'
            AuthorName        = 'Author Name'
            AuthorEmail       = "Author.Name@gmail.com"
            ModuleVersion     = '0.0.1'
            Company           = 'Company Name'
            ModuleFolders     = @("functions", "Classes", "Enums", "Ressources")
            UnitTests         = "Yes"
            Editor            = "VSCode"
            CICD              = "GitHubActions"
        }

        New-FRPSUGModule -TemplateName FRPSUGModuleTemplate -DestinationPath $DestinationPath -Params $plasterParams

        it 'Test' {
            $true | Should Be $True
        }
        it 'DestinationPath should not be null' {
            $DestinationPath | Should not be $null
        }
    }
}