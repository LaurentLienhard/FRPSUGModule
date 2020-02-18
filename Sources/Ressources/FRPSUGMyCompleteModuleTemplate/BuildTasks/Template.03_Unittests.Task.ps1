task UnitTests {
    Write-Verbose "[UNITTESTS][START]"
    $params = @{
        Script       = Join-Path $env:BHProjectPath -ChildPath "\UnitTests\"
        OutputFile   = Join-Path $env:BHProjectPath -ChildPath "\UnitTests\UnitTestsResult.xml"
        OutputFormat = 'NUnitXml'
        PassThru     = $true
        Show         = 'Failed', 'Fails', 'Summary'
    }

    $results = Invoke-Pester @params
    if ($results.FailedCount -gt 0)
    {
        Write-Error -Message "Failed [$($results.FailedCount)] Pester tests."
    }
    Write-Verbose "[UNITTESTS][END]"
}