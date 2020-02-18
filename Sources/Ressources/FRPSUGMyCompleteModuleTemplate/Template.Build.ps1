[CmdletBinding(DefaultParameterSetName = 'Task')]
param(
    [parameter(ParameterSetName = 'Task', Position = 0)]
    $Task = 'Default',
    [parameter(ParameterSetName = 'Dependencies', Position = 0)]
    [switch]$InstallDependencies
)

Clear-Host

switch ($PSCmdlet.ParameterSetName)
{
    "Dependencies"
    {
        Write-Verbose "[BUILD] Install module dependencies"
        Get-PackageProvider -Name Nuget -ForceBootstrap | Out-Null
        Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
        Install-module -Name PSDepend -Repository PSGallery -Scope CurrentUser
        Import-Module -Name PSDepend -Verbose:$false
        Invoke-PSDepend -Path './requirements.psd1' -Install -Import -Force -WarningAction SilentlyContinue
        Write-Verbose "[BUILD] Install module dependencies done"
    }
    "Task"
    {
        #region <Init Variable>
        Write-Verbose "[SETBUILDVARIABLE][START]"
        Write-Verbose "[SETBUILDVARIABLE] Set Build Environment variable..."
        Set-BuildEnvironment -Force
        Write-Verbose "[SETBUILDVARIABLE][END]"
        #endregion <Init Variable>


        Write-verbose  "[BUILD] Run build task => $($Task)"
        $IBParameters = @{
            Task = $Task
        }

        if ($PSBoundParameters['verbose'])
        {
            $IBParameters.add('verbose', $verbose)
        }

        invoke-build @IBParameters
    }
}
