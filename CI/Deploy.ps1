$ErrorActionPreference = "Stop";

[parameter(Mandatory = $True)][String]$Deploytype

$ModuleName = "FRPSUGModule"
$Current = $PSScriptRoot
$Root = ((Get-Item $Current).Parent).FullName

Import-Module PSDeploy

$source = $Root + "\CI\Deploy\" + $ModuleName + ".PSDeploy.ps1"

Invoke-PSDeploy -Path $source -tag $DeployType -Force -Verbose
