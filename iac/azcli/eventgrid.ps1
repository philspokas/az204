# 
# 1. Create a storage account
# 2. Provision a website to act as an event endpoint
# 3. Add and evengrid subscription to the storage account
#    subscription is validated when it is created, see https://learn.microsoft.com/en-us/azure/event-grid/webhook-event-delivery




# https://learn.microsoft.com/en-us/training/modules/azure-event-grid/8-event-grid-custom-events

# $rNum=Get-Random -Max 10000

$location="westus3"
$egtopic="ewu-egtopic-396"
$sitename="ewu-egsite-396"
$egsiteURL="https://$mySiteName.azurewebsites.net"

$rg = "ewu-samples"

# az group delete --name $rg --no-wait
# az group create --name $rg --location $location 
az group show --resource-group $rg

# register provider
az provider register --namespace Microsoft.EventGrid
# check if provider has been registered
az provider show --namespace Microsoft.EventGrid --query "registrationState"

# setup a storage account to 
az storage account list | ConvertFrom-Json | select name, resourceGroup

az storage account create --name ewu396jokes  --location $location --resource-group $rg --sku Standard_LRS

az deployment group create --resource-group $rg --template-uri "https://raw.githubusercontent.com/Azure-Samples/azure-event-grid-viewer/master/azuredeploy.json" --parameters siteName=$sitename hostingPlanName=viewerhost

# subscribe to storage
$endpoint="https://$sitename.azurewebsites.net/api/updates"
az eventgrid event-subscription create --source-resource-id $storageid --name ewu396-eg-sub --endpoint $endpoint


# upload some files to a container

$storage = "ewu396jokes"
$container = "jokescontainer"
az storage container create --name $container --account-name ewu396jokes
az storage blob upload --file joke1.json --container-name $container --name .\joke1.json --account-name $storage
az storage blob upload --file joke2.json --container-name $container --name .\joke2.json --account-name $storage

# Second one
$storage = "ewu396jokes2"
$container = "morejokes"

az storage account create --name $storage  --location $location --resource-group $rg --sku Standard_LRS
$storageid = $(az storage account show --name $storage --resource-group $rg --query id --output tsv)
$storageid
az eventgrid event-subscription create --source-resource-id $storageid --name ewu396-eg-sub2 --endpoint $endpoint

az storage container create --name $container --account-name $storage
az storage blob upload --file joke3.json --container-name $container --name .\joke3.json --account-name $storage
az storage blob upload --file joke4.json --container-name $container --name .\joke4.json --account-name $storage

# Add subscriptions for the fn endpoint
$fnendpoint = "https://jokefunction396.azurewebsites.net/runtime/webhooks/EventGrid?functionName=ProcessJokeEG&code=KvrCyhdcEX1SQiAwcs6GG73tSo_-XX6_6LZySQoeXfmEAzFuzC_uzw=="
az eventgrid event-subscription create --source-resource-id $storageid --name ewu396-eg-sub2 --endpoint $fnendpoint


$rg = "ewu-samples"
$fnendpoint = "https://ewu396-eg-test.azurewebsites.net/runtime/webhooks/EventGrid?functionName=TestBlobEventGridTrigger&code=k4f4oSvSEO0V1Hlynto62ZRcq8bdnG5G-7Ud0XzsVeBdAzFuh1t1hg=="
$storage = "ewu396jokes"
$container = "jokescontainer"
$storageid = $(az storage account show --name $storage --resource-group $rg --query id --output tsv)

az eventgrid resource event-subscription create --source-resource-id $storageid --name eg-fn-sub1 --endpoint $fnendpoint

az eventgrid resource event-subscription create -g $rg --provider-namespace Microsoft.Storage --resource-type storageAccounts --resource-name ewu396jokes --name eg-func-sub 
--included-event-types Microsoft.Storage.BlobCreated 
--subject-begins-with /blobServices/default/containers/images/blobs/ 
--endpoint https://mystoragetriggeredfunction.azurewebsites.net/runtime/webhooks/eventgrid?functionName=imageresizefunc&code=<key>
