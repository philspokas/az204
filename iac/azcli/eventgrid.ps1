

# https://learn.microsoft.com/en-us/training/modules/azure-event-grid/8-event-grid-custom-events

$rNum=Get-Random -Max 10000
$myLocation="westus3"
$myTopicName="az204-egtopic-$rNum"
$mySiteName="az204-egsite-$rNum"
$mySiteURL="https://$mySiteName.azurewebsites.net"


az group delete --name az204-evgrid-rg --no-wait
az group list


