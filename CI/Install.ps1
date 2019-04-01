$ErrorActionPreference = "Stop";

Write-Output "[INSTALL] Start"

if (!(Get-Module -ListAvailable -Name Plaster | Where-Object { $_.Version -eq '1.1.3' })) {
    Write-Output "[INSTALL] Plaster"
    Install-Module -Name Plaster -MinimumVersion 1.1.3 -Scope CurrentUser -Force -Confirm:$false -SkipPublisherCheck
}

if (!(Get-Module -ListAvailable -Name Pester | Where-Object { $_.Version -eq '4.7.3' })) {
    Write-Output "[INSTALL] Pester"
    Install-Module -Name pester -MinimumVersion 4.7.3 -Scope CurrentUser -Force -Confirm:$false -SkipPublisherCheck
}

if (!(Get-Module -ListAvailable -Name PlatyPS | Where-Object { $_.Version -eq '0.13.0' })) {
    Write-Output "[INSTALL] PlatyPS"
    Install-Module -Name PlatyPS -MinimumVersion 0.13.0 -Scope CurrentUser -Force -Confirm:$false
}

if (!(Get-Module -ListAvailable -Name PSDeploy | Where-Object { $_.Version -eq '1.0.1' })) {
    Write-Output "[INSTALL] PSDeploy"
    Install-Module -Name PSDeploy -MinimumVersion 1.0.1 -Scope CurrentUser -Force -Confirm:$false
}

if (!(Get-Module -ListAvailable -Name PSScriptAnalyzer | Where-Object { $_.Version -eq '1.18.0' })) {
    Write-Output "[INSTALL] PSSCriptAnalyser"
    Install-Module -Name PSScriptAnalyzer -MinimumVersion 1.18.0 -Scope CurrentUser -Force -Confirm:$false
}

if (!(Get-Module -ListAvailable -Name BuildHelpers | Where-Object { $_.Version -eq '2.0.8' })) {
    Write-Output "[INSTALL] Plaster"
    Install-Module -Name pester -MinimumVersion 2.0.8 -Scope CurrentUser -Force -Confirm:$false
}

if (!(Get-Module -ListAvailable -Name PSClassUtils | Where-Object { $_.Version -eq '2.6.3' })) {
    Write-Output "[INSTALL] PSClassUtils"
    Install-Module -Name PSClassUtils -MinimumVersion 2.6.3 -Scope CurrentUser -Force -Confirm:$false
    Import-module PSClassUtils
    Install-PackageProvider -Name Chocolatey -force -Scope CurrentUser
    Register-PackageSource -Name Chocolatey -ProviderName Chocolatey -Location http://chocolatey.org/api/v2/ -Force -Trusted
    Find-Package graphviz -Source "http://chocolatey.org/api/v2/" | Install-Package -ForceBootstrap -Force
Start-Sleep -Seconds 2

Install-PackageProvider -Name NuGet -Force -Scope CurrentUser
Install-Module -Name PSGraph -Force -verbose -Scope CurrentUser
}
Write-Output "[INSTALL] End"
