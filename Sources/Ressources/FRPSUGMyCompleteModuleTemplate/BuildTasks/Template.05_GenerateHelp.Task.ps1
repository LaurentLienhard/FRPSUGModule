task GenerateHelp {
    Write-Verbose "[GENERATEHELP][START]"
    $OutPutPath = Join-Path $env:BHBuildOutput -ChildPath "$env:BHProjectName\"
    Write-Verbose ("Output Path is {0}" -f $OutPutPath)
    $DocsPath = Join-Path $env:BHProjectPath -ChildPath "\Docs\"
    Write-Verbose ("Docs file name is {0}" -f $DocsPath)

    if (-not(Get-ChildItem -Path $DocsPath -Filter '*.md' -Recurse -ErrorAction 'Ignore'))
    {
        Write-Verbose "[GENERATEHELP] No Markdown help files to process. Skipping help file generation..."
        return
    }

    $params = @{
        Force      = $true
        OutputPath = "$OutPutPath\en-US"
        Path       = "$DocsPath\en-US"
    }

    # Generate the module's primary MAML help file.
    Write-Verbose "[GENERATEHELP] Creating new External help for $($env:BHProjectName)..."
    $null = New-ExternalHelp @params

    Write-Verbose "[GENERATEHELP][END]"
}