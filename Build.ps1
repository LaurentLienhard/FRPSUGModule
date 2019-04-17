[CmdletBinding()]
param(
    [parameter(Position = 0)]
    $Task = 'Default'
)

Clear-Host
$Script:ModuleInstallScope = 'CurrentUser'

Write-Verbose "[BUILD][START]"

Write-Verbose "[BUILD] Installing module dependencies..."

Get-PackageProvider -Name 'NuGet' -ForceBootstrap | Out-Null

$Script:Modules = @(
    'BuildHelpers',
    'InvokeBuild',
    'Plaster',
    'Pester',
    'PlatyPS',
    'PSDeploy',
    'PSScriptAnalyzer'
)

foreach ($Module in $Script:Modules) {
    if (!(Get-Module -ListAvailable -Name $Module)) {
        Write-Verbose "[BUILD][INSTALL] $($Module)"
        Install-Module -Name $Module -Scope $Script:ModuleInstallScope -Force -Confirm:$false -SkipPublisherCheck
    } else {
        Write-Verbose "[BUILD][INSTALL] $($Module) already installed"
    }
}

Write-Verbose "[BUILD] Build Environement variable..."
if (!(Get-ChildItem Env:BH*)) {
    Write-Verbose "[BUILD] Set Build Environement variable..."
    Set-BuildEnvironment
} else {
    Write-Verbose "[BUILD] Build Environement variable already set.."
}

$Script:ModuleBuildFilePath = $env:BHModulePath + "\" + $env:BHProjectName + ".Build.ps1"


Write-Verbose "[BUILD] Invoking build action [$($Task)]"
$Error.Clear()
Invoke-Build -Task $Task -File $Script:ModuleBuildFilePath -Result 'Result'
if ($Result.Error) {
    $Error[-1].ScriptStackTrace | Out-String
    Write-Verbose "[BUILD][END] With Error"
    exit 1
}

Write-Verbose "[BUILD][END] with no error"
exit 0
