# Checks to ensure the installer file exists and can be opened by the logged in user.
# An error will be displayed on screen should the file not exist or the appropriate permissions are not available and the script will exit.
function Check-File {
    param($x)
    
    try
    {
        [io.file]::OpenRead($x).close()
    }

    catch [System.Management.Automation.MethodInvocationException]
    {
        Write-Warning "Could not find the file specified. Please specify the correct path to the MSI. `nThe script will now exit."
    }
    catch [System.UnauthorizedAccessException]
    {
        Write-Warning "The username running the script does not have READ access to the installer file $x. `nPlease check the user permissions and try again. `nThe script will now exit."
    }
}

Check-Installer $SourceInstallFile