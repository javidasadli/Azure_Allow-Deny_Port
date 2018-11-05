"xxxxxxx" | ConvertTo-SecureString -AsPlainText -Force | ConvertFrom-SecureString | Out-File "./file"
$User = "myuser@azure.com"
$File = ".\file"
$MyCredential=New-Object -TypeName System.Management.Automation.PSCredential `
-ArgumentList $User, (Get-Content $File | ConvertTo-SecureString)
Login-AzureRmAccount -Environment AzureGermanCloud -Credential $MyCredential
