$PublicFunctions = @(Get-ChildItem -Path $PSScriptRoot\Sources\Functions\Public\*.ps1  -ErrorAction SilentlyContinue | Select-object -Expand FullName)
$PrivateFunctions = @(Get-ChildItem -Path $PSScriptRoot\Sources\Functions\Private\*.ps1 -ErrorAction SilentlyContinue | Select-Object -Expand FullName)
$Classes = @(Get-ChildItem -Path $PSScriptRoot\Sources\Classes\*.ps1 -ErrorAction SilentlyContinue | Select-Object -Expand FullName)
$Enums = @(Get-ChildItem -Path $PSScriptRoot\Sources\Enums\*.ps1 -ErrorAction SilentlyContinue | Select-Object -Expand FullName)

#Dot source the files
Foreach ($import in @($PublicFunctions + $PrivateFunctions + $Classes + $Enums)) {
    TRY {
        . $import
    } CATCH {
        Write-Error -Message "Failed to import function $($import): $_"
    }
}