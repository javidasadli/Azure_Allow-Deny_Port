How to use "conf" File.


The format of the adding or removing port from BirkleHR.


Use the format below to add new port Allow/Deny:

    "Add" "Allow/Deny" "PortNumber" "RulePriority"
    Sample: Add Allow 8089 380


Use the format below to remove port:

    "Remove" "RuleName"
    Sample: Remove Port_8081
        
 
Refer to "rules" to check the latest rules.      


Protocol Name      Access Priority Direction ProvisioningState
-------- ----      ------ -------- --------- -----------------
TCP      HTTP      Allow  300      Inbound   Succeeded        
TCP      HTTPS     Allow  310      Inbound   Succeeded        
TCP      SSH       Allow  320      Inbound   Succeeded        



