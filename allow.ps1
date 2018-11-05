$ErrorActionPreference = 'Stop'
$User = "support@birklehrms.onmicrosoft.de"
$File = ".\file"
$MyCredential=New-Object -TypeName System.Management.Automation.PSCredential `
-ArgumentList $User, (Get-Content $File | ConvertTo-SecureString)
Login-AzureRmAccount -Environment AzureGermanCloud -Credential $MyCredential
$line = (Get-Content .\conf)
$act = ($line.Split(" "))[0]
$RGname='BirkleHR'
$nsgname="birkleHR-nsg"
if ($act -eq 'Add') {  
    $action = ($line.Split(" "))[1]
    $port = ($line.Split(" "))[2]
    $rulename="$action"+"$port"
    $priority = ($line.Split(" "))[3]
    $nsg=Get-AzureRmNetworkSecurityGroup -Name $nsgname -ResourceGroupName $RGname
    $nsg | Add-AzureRmNetworkSecurityRuleConfig -Name $rulename -Access $action `
        -Protocol * -Direction Inbound -Priority "$priority" -SourceAddressPrefix "*" -SourcePortRange * `
        -DestinationAddressPrefix * -DestinationPortRange "$port"
    $nsg | Set-AzureRmNetworkSecurityGroup
    Get-AzureRmNetworkSecurityRuleConfig -NetworkSecurityGroup $nsg | Out-File rules
}
else {
    $rulename=(Get-Content .\conf)
    $nsg=Get-AzureRmNetworkSecurityGroup -Name $nsgname -ResourceGroupName $RGname
    Remove-AzureRmNetworkSecurityRuleConfig -Name $rulename -NetworkSecurityGroup $nsg
    Get-AzureRmNetworkSecurityRuleConfig -NetworkSecurityGroup $nsg | Out-File rules
}