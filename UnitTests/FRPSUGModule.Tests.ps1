
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

    it 'Basic build file should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/Build.ps1") | Should Exist
    }

    it 'Module build file should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/" + $plasterParams.ModuleName + ".Build.ps1") | Should Exist
    }

    it 'Module psd1 file should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/" + $plasterParams.ModuleName + ".psd1") | Should Exist
    }

    it 'Requirements file should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/requirements.psd1") | Should Exist
    }

    it 'Gitignore file should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/.gitignore") | Should Exist
    }

    it 'Sources path should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/Sources") | Should Exist
    }

    it 'Function path should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/Sources/Functions") | Should Exist
    }

    it 'Private function path should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/Sources/Functions/Private") | Should Exist
    }

    it 'Public function path should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/Sources/Functions/Public") | Should Exist
    }

    it 'Classes path should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/Sources/Classes") | Should Exist
    }

    it 'Enums path should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/Sources/Enums") | Should Exist
    }

    it 'Ressources path should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/Sources/Ressources") | Should Exist
    }

    it 'UnitTest path should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/UnitTests") | Should Exist
    }

    it "Module's pester file should exist" {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/UnitTests/Module.Tests.ps1") | Should Exist
    }

    it 'Vscode path should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/.vscode") | Should Exist
    }

    it 'Launch vscode file should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/.vscode/launch.json") | Should Exist
    }

    it 'PSScriptAnalyzer vscode file should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/.vscode/PSScriptAnalyzerSettings.psd1") | Should Exist
    }

    it 'Settings vscode file should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/.vscode/settings.json") | Should Exist
    }

    it 'Tasks vscode file should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/.vscode/tasks.json") | Should Exist
    }


    it 'Github Actions path should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/.github/workflows") | Should Exist
    }

    it 'Github Actions file should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/.github/workflows/main.yaml") | Should Exist
    }

    it 'Buildtasks path should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/BuildTasks") | Should Exist
    }

    it 'Buildtasks SetBuildVariable files should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/BuildTasks/01_SetBuildVariable.Task.ps1") | Should Exist
    }

    it 'Buildtasks Clean files should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/BuildTasks/02_Clean.Task.ps1") | Should Exist
    }

    it 'Buildtasks BuildModule files should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/BuildTasks/03_BuildModule.Task.ps1") | Should Exist
    }

    it 'Buildtasks BuildManifest files should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/BuildTasks/04_BuildManifest.Task.ps1") | Should Exist
    }

    it 'Buildtasks GenerateMarkdown files should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/BuildTasks/05_GenerateMarkdown.Task.ps1") | Should Exist
    }

    it 'Buildtasks GenerateHelp files should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/BuildTasks/06_GenerateHelp.Task.ps1") | Should Exist
    }

    it 'Buildtasks Analyse files should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/BuildTasks/07_Analyse.Task.ps1") | Should Exist
    }

    it 'Buildtasks ImportModule files should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/BuildTasks/08_ImportModule.Task.ps1") | Should Exist
    }

    it 'Buildtasks UnitTests files should exist' {
        ($DestinationPath + "/" + $plasterParams.ModuleName + "/BuildTasks/09_UnitTests.Task.ps1") | Should Exist
    }
}