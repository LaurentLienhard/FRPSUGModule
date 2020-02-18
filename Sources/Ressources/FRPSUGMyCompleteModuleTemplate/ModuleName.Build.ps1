Write-Verbose "[SETBUILDVARIABLE] Import common tasks ..."
Get-ChildItem -Path $env:BHProjectPath\BuildTasks\*.Task.ps1 | ForEach-Object {
    Write-Verbose "[SETBUILDVARIABLE] Importing $($_.FullName)"
    . $_.FullName
}

task Default Clean, BuildModule, UnitTests, GenerateMarkdown, GenerateHelp, Deploy
task Build Clean, BuildModule, UnitTests