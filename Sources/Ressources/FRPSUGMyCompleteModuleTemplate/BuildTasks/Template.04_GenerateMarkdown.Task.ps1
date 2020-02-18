task GenerateMarkdown {
    Write-Verbose "[GENERATEMARKDOWN][START]"
    $OutPutPath = Join-Path $env:BHBuildOutput -ChildPath "$env:BHProjectName\"
    Write-Verbose ("Output Path is {0}" -f $OutPutPath)
    $ModuleManifest = Join-Path $OutPutPath -ChildPath ($env:BHProjectName + ".psd1")
    Write-Verbose ("Module Manifest file name is {0}" -f $ModuleManifest)
    $DocsPath = Join-Path $env:BHProjectPath -ChildPath "\Docs\"
    Write-Verbose ("Docs file name is {0}" -f $DocsPath)

    $module = Import-Module -FullyQualifiedName $ModuleManifest -Force -PassThru

    try
    {
        if ($module.ExportedFunctions.Count -eq 0)
        {
            Write-Verbose "[GENERATEMARKDOWN] No functions have been exported for this module. Skipping Markdown generation..."
            return
        }

        $params = @{
            AlphabeticParamsOrder = $true
            ErrorAction           = 'SilentlyContinue'
            Locale                = 'en-US'
            Module                = $env:BHProjectName
            OutputFolder          = "$DocsPath\en-US"
            WithModulePage        = $true
        }

        # ErrorAction is set to SilentlyContinue so this
        # command will not overwrite an existing Markdown file.
        Write-Verbose "[GENERATEMARKDOWN] Creating new Markdown help for $($env:BHProjectName)..."
        $null = New-MarkdownHelp @params
    }
    finally
    {
        Remove-Module -Name $env:BHProjectName -Force
    }

    Write-Verbose "[GENERATEMARKDOWN][END]"
}