
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

    if (Test-Path -Path ($DestinationPath + "/" + $plasterParams.ModuleName))
    {
        Remove-Item -Path ($DestinationPath + "/" + $plasterParams.ModuleName) -Force -Confirm:$false -Recurse
    }

    New-FRPSUGModule -TemplateName FRPSUGModuleTemplate -DestinationPath $DestinationPath -Params $plasterParams

    it 'DestinationPath should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName) | Should Exist
    }

    it 'basic files should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/Build.ps1") | Should Exist
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/" + $plasterParams.ModuleName + ".Build.ps1") | Should Exist
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/" + $plasterParams.ModuleName + ".psd1") | Should Exist
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/requirements.psd1") | Should Exist
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/.gitignore") | Should Exist
    }

    it 'Sources path and subfolders should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/Sources") | Should Exist
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/Sources/Functions") | Should Exist
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/Sources/Functions/Private") | Should Exist
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/Sources/Functions/Public") | Should Exist
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/Sources/Classes") | Should Exist
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/Sources/Enums") | Should Exist
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/Sources/Ressources") | Should Exist
    }

    it 'UnitTest path should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/UnitTests") | Should Exist
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/UnitTests/Module.Tests.ps1") | Should Exist
    }

    it 'Vscode path and files should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/.vscode") | Should Exist
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/.vscode/launch.json") | Should Exist
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/.vscode/PSScriptAnalyzerSettings.psd1") | Should Exist
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/.vscode/settings.json") | Should Exist
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/.vscode/tasks.json") | Should Exist
    }

    it 'Github Actions path and file should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/.github/workflows") | Should Exist
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/.github/workflows/main.yaml") | Should Exist
    }

    it 'Buildtasks path and files should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/BuildTasks") | Should Exist
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/BuildTasks/01_SetBuildVariable.Task.ps1") | Should Exist
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/BuildTasks/02_Clean.Task.ps1") | Should Exist
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/BuildTasks/03_BuildModule.Task.ps1") | Should Exist
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/BuildTasks/04_BuildManifest.Task.ps1") | Should Exist
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/BuildTasks/05_GenerateMarkdown.Task.ps1") | Should Exist
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/BuildTasks/06_GenerateHelp.Task.ps1") | Should Exist
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/BuildTasks/07_Analyse.Task.ps1") | Should Exist
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/BuildTasks/08_ImportModule.Task.ps1") | Should Exist
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/BuildTasks/09_UnitTests.Task.ps1") | Should Exist
    }
}