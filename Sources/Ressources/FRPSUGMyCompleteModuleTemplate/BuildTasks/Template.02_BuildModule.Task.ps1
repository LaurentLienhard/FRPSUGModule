task BuildModule {
    Write-Verbose "[BUILDMODULE][START]"
    Write-Verbose "[BUILDMODULE][Set Variable]"
    $OutPutPath = Join-Path $env:BHBuildOutput -ChildPath "$env:BHProjectName\"
    Write-Verbose ("Output Path is {0}" -f $OutPutPath)
    $EnumsPath = Join-Path $env:BHProjectPath -ChildPath "\Sources\Enums\"
    $Enums = Get-ChildItem -Path $EnumsPath -Filter *.ps1 | Sort-Object Name
    Write-Verbose ("Enums Path is {0}" -f $EnumsPath)
    $ClassesPath = Join-Path $env:BHProjectPath -ChildPath "\Sources\Classes\"
    $Classes = Get-ChildItem -Path $ClassesPath -Filter *.ps1 | Sort-Object Name
    Write-Verbose ("Class Path is {0}" -f $ClassesPath)
    $PrivateFunctionsPath = Join-Path $env:BHProjectPath -ChildPath "\Sources\Functions\Private\"
    $PrivateFunctions = Get-ChildItem -Path $PrivateFunctionsPath -Filter *.ps1 | Sort-Object Name
    Write-Verbose ("Private Functions Path is {0}" -f $PrivateFunctionsPath)
    $PublicFunctionsPath = Join-Path $env:BHProjectPath -ChildPath "\Sources\Functions\Public\"
    $PublicFunctions = Get-ChildItem -Path $PublicFunctionsPath -Filter *.ps1 | Sort-Object Name
    Write-Verbose ("Public Functions Path is {0}" -f $PublicFunctionsPath)
    $ResourcesPath = Join-Path $env:BHProjectPath -ChildPath "\Sources\Resources\"
    Write-Verbose ("Resources Path is {0}" -f $ResourcesPath)
    $MainPSM1 = Join-Path $OutPutPath -ChildPath ($env:BHProjectName + ".psm1")
    Write-Verbose ("Psm1 file name is {0}" -f $MainPSM1)
    $ModuleManifest = Join-Path $OutPutPath -ChildPath ($env:BHProjectName + ".psd1")
    Write-Verbose ("Module Manifest file name is {0}" -f $ModuleManifest)

    Write-Verbose ("[BUILDMODULE] Creating output path for {0}" -f $env:BHProjectName)
    New-Item -Path $OutPutPath -ItemType Directory -Force | Out-Null

    Write-Verbose ("[BUILDMODULE] Build Module {0}" -f $env:BHProjectName)
    $MainPSM1Contents = @()
    $MainPSM1Contents += $Enums
    $MainPSM1Contents += $Classes
    $MainPSM1Contents += $PrivateFunctions
    $MainPSM1Contents += $PublicFunctions

    Write-Verbose "[BUILDMODULE] Compiling PSM1 file"
    $Date = Get-Date
    "#Generated at $($Date)" | Out-File -FilePath $MainPSM1 -Encoding utf8 -Append

    if (test-path -path (Join-Path $env:BHProjectPath -ChildPath "\Sources\using.ps1"))
    {
        Get-content (Join-Path $env:BHProjectPath -ChildPath "\Sources\using.ps1") | Out-File -FilePath $MainPSM1 -Encoding utf8 -Append
    }

    Foreach ($file in $MainPSM1Contents)
    {
        Get-Content $File.FullName | Out-File -FilePath $MainPSM1 -Encoding utf8 -Append
    }

    if (test-path -path (Join-Path $env:BHProjectPath -ChildPath "\Sources\onload.ps1"))
    {
        Get-content (Join-Path $env:BHProjectPath -ChildPath "\Sources\onload.ps1") | Out-File -FilePath $MainPSM1 -Encoding utf8 -Append
    }

    if (Test-Path -Path $ResourcesPath)
    {
        Write-Output "[BUILDMODULE] Add ressources to Module "
        $ResourcesList = Get-ChildItem -Path $ResourcesPath

        foreach ($resources in $ResourcesList)
        {
            if ($resources.name -ne ".gitkeep")
            {
                $SourcesPath = ""
                $SourcesPath = $ResourcesPath + $resources.Name
                $DestinationPath = $OutPutPath + "Resources\" + $resources.Name
                Copy-Item -Path $SourcesPath -Destination $DestinationPath -Force -Recurse -Confirm:$false
            }
        }
        Write-Output "[BUILDMODULE] All ressources add to Module "
    }
    Write-Verbose "[BUILDMODULE] Compiling PSM1 file ended"

    Write-Verbose "[BUILDMODULE] Compiling Module Manifest file"
    Write-Verbose "[BUILDMODULE] Adding functions to export..."
    $FunctionsToExport = $PublicFunctions.BaseName
    Copy-Item -Path (Get-PSModuleManifest) -Destination $ModuleManifest
    if ($FunctionsToExport -ne $null)
    {
        Update-ModuleManifest -Path $ModuleManifest -FunctionsToExport $FunctionsToExport
    }
    Write-Verbose "[BUILDMODULE] Compiling Module Manifest file ended"
}