task Clean {
    Write-Verbose "[CLEAN][START]"
    Write-Verbose "[CLEAN] Unload Module..."
    if (Get-Module $env:BHProjectName)
    {
        Remove-Module $env:BHProjectName
    }

    Write-Verbose "[CLEAN] test if output build directory already exist..."
    if (Test-Path -Path $env:BHBuildOutput)
    {
        Write-Verbose "[CLEAN] Pre-build module find => Suppress"
        Remove-Item -Path ($env:BHBuildOutput) -Recurse -Force
    }
    else
    {
        Write-Verbose "[CLEAN] Nothing to do..."
    }
    Write-Verbose "[CLEAN][END]"
}