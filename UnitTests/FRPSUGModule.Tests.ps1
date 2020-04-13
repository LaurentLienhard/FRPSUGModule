Describe 'Testing New-FRPSUGModule function' {
    if ($IsWindows)
    {
        $DestinationPath = $env:TEMP
    }
    else
    {
        $DestinationPath = "/tmp"
    }
    it 'Test' {
        $true | Should Be $True
    }

    it 'DestinationPath should not be null' {
        $DestinationPath | Should not be $null
    }
}