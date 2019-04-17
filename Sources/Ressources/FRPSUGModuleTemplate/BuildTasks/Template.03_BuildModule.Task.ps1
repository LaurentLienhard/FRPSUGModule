task BuildModule {
    Write-Verbose "[BUILDMODULE][START]"
    Write-Verbose "[BUILD] Creating output path for $($env:BHProjectName)"
    New-Item -Path $script:OutputModulePath -ItemType Directory -Force | Out-Null

    Write-Verbose "[BUILD] Loading all sources files"

    $MainPSM1Contents = @()
    $MainPSM1Contents += $script:PublicEnums
    $MainPSM1Contents += $script:PublicClasses
    $MainPSM1Contents += $script:PrivateFunctions
    $MainPSM1Contents += $script:PublicFunctions

    Write-Verbose "[BUILDMODULE] building main psm1"
    $Date = Get-Date
    "#Generated at $($Date) by $($script:Author)" | Out-File -FilePath $Script:ModuleBuildPsm1 -Encoding utf8 -Append
    Foreach ($file in $MainPSM1Contents) {
        Get-Content $File.FullName | Out-File -FilePath $Script:ModuleBuildPsm1 -Encoding utf8 -Append
    }

    Write-Verbose "[BUILDMODULE][END]"
}