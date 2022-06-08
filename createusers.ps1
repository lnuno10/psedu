
# import Active Directory Module
Import-Module ActiveDirectory

# Read in Secure Temporary Password (Note: Complexity)
$AccountPassword = Read-Host -AsSecureString -Prompt "Enter Temporary Password for New Users"

# Important User Data
$csv = Import-Csv -Path C:\Users\lmiranda\Documents\adusers.csv

# Loop through Users
foreach ($User in $csv) {

    # Store User Attributes for Splatting
    $UserInfo = @{	
        Name = $user.Name
        DisplayName = $User.Name
        GivenName = $User.GivenName
        Surname = $User.Surname

        SamAccountName = $User.SamAccountName
        Path = $user.Path

        Title = $User.Title
        Department = $User.Department
        Company = $User.Company
        EmailAddress = $User.EmailAddress

        AccountPassword = $AccountPassword
        ChangePasswordAtLogon = $true
        Enabled = $true
    }

    # Create New Users
    New-ADUser @UserInfo
}