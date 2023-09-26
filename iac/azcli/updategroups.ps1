az group list

az group delete -n HomesteadHackathon2022 --no-wait -y    


Install-Module ImportExcel

$GroupsSheet = "C:\Users\PhilSpokas\IntelliTect\IntelliTect - Microsoft Partner\Microsoft Partner Azure Sponsorhip Resource Groups.xlsx"

$groups = Import-Excel $GroupsSheet

$groups | ? { $_.Disposition -eq "keep" } | % { az group update --resource-group $_.Name --tags note=$($_.Notes) owner=$($_.Owner) }

$subID = "797aef0e-cb86-419c-aa51-3ec064d3bf34"

$groups | ? { $_.Owner -ne "admin" }

# does not work ???
az role assignment create --role "Owner" --scope /subscriptions/$subId/resourceGroups/cloud-shell-storage-westus --assignee "phil@intellitect.com" --resource-group { cloud-shell-storage-westus }
