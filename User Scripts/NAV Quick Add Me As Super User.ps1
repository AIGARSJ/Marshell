<#
    This script will create a new a user record with the current user id and assign super permission set to the new user.
    Set the $NavServiceName and $NavVersion.
#>

# NAV Service Tier Name
$NavServiceName = '';

$NavVersion = (Get-ChildItem -Path "c:\program files\Microsoft Dynamics NAV" -Directory | Select-Object -Last 1).Name
Import-Module "C:\Program Files\Microsoft Dynamics NAV\$NavVersion\Service\NavAdminTool.ps1"

$me = whoami

write-host "Add $($me) as a user" -ForegroundColor Cyan
New-NAVServerUser -ServerInstance $NavServiceName -WindowsAccount $me

write-host "Assign super permission to $($me)" -ForegroundColor Cyan
New-NAVServerUserPermissionSet  -ServerInstance $NavServiceName -WindowsAccount $me -PermissionSetId 'SUPER'
