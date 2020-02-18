Describe 'Module' {
    Context 'Manifest' {
        $script:manifest = $null
        $OutPutPath = Join-Path $env:BHBuildOutput -ChildPath "$env:BHProjectName\"
        Write-Verbose ("Output Path is {0}" -f $OutPutPath)
        $ModuleManifest = Join-Path $OutPutPath -ChildPath ($env:BHProjectName + ".psd1")
        Write-Verbose ("Module Manifest file name is {0}" -f $ModuleManifest)

        It 'has a valid manifest' {
            {
                $script:manifest = Test-ModuleManifest -Path  $ModuleManifest -ErrorAction Stop -WarningAction SilentlyContinue
            } | Should Not throw
        }

        It 'has a valid name in the manifest' {
            $script:manifest.Name | Should Be $env:BHProjectName
        }

        It 'has a valid root module' {
            $RootModule = "./" + $env:BHProjectName + ".psm1"
            $script:manifest.RootModule | Should Be ($RootModule)
        }

        It 'has a valid version in the manifest' {
            $script:manifest.Version -as [Version] | Should Not BeNullOrEmpty
        }

        It 'has a valid description' {
            $script:manifest.Description | Should Not BeNullOrEmpty
        }

        It 'has a valid author' {
            $script:manifest.Author | Should Not BeNullOrEmpty
        }

        It 'has a valid guid' {
            {
                [guid]::Parse($script:manifest.Guid)
            } | Should Not throw
        }

        It 'has a valid copyright' {
            $script:manifest.CopyRight | Should Not BeNullOrEmpty
        }
    }
}