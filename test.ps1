Import-Module FRPSUGModule -Force
$plasterParams = @{
    ModuleName        = 'MyTestModule'
    ModuleDescription = 'Module For Pester Test'
    AuthorName        = 'Author Name'
    AuthorEmail       = 'Author.Name@gmail.com'
    ModuleVersion     = '0.0.1'
    Company           = 'Company Name'
    ModuleFolders     = @("functions", "Classes", "Enums", "Ressources")
    UnitTests         = 'Yes'
    Editor            = 'VSCode'
    CICD              = 'GitHubActions'
}

<# $plasterParams = New-Object System.Collections.Hashtable
$plasterParams['ModuleName'] = 'MyTestModule'
$plasterParams['ModuleDescription'] = 'Module For Pester Test'
$plasterParams['AuthorName'] = 'Author.Name@gmail.com'
$plasterParams['ModuleVersion'] = '0.0.1'
$plasterParams['Company'] = 'Company Name'
$plasterParams['ModuleFolders'] = @("functions", "Classes", "Enums", "Ressources")
$plasterParams['UnitTests'] = 'Yes'
$plasterParams['Editor'] = 'VSCode'
$plasterParams['CICD'] = 'GitHubActions' #>

New-FRPSUGModule -TemplateName FRPSUGModuleTemplate -DestinationPath $env:TEMP -Params $plasterParams