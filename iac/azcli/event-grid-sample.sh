  174  az apim create -n $myApiName     --location $myLocation     --publisher-email $myEmail      --resource-group az204-apim-rg     --publisher-name AZ204-APIM-Exercise     --sku-name Consumption
  175  az account
  176  az account show
  177  az account set --subscription a5045d8f-5a9a-4d29-aaee-1f829d64bee0
  178  az account show
  179  az location
  180  az account list-locations
  181  let rNum=$RANDOM*$RANDOM
  182  myLocation="westus3"
  183  myTopicName="az204-egtopic-${rNum}"
  184  mySiteName="az204-egsite-${rNum}"
  185  mySiteURL="https://${mySiteName}.azurewebsites.net"
  186  az group create --name az204-evgrid-rg --location $myLocation
  187  az provider register --namespace Microsoft.EventGrid
  188  az provider show -n Microsoft.EventGrid
  189  az provider show --namespace Microsoft.EventGrid --query "registrationState"
  190  az eventgrid topic create --name $myTopicName     --location $myLocation     --resource-group az204-evgrid-rg
  191  az deployment group create     --resource-group az204-evgrid-rg     --template-uri "https://raw.githubusercontent.com/Azure-Samples/azure-event-grid-viewer/main/azuredeploy.json"     --parameters siteName=$mySiteName hostingPlanName=viewerhost
  192  echo "Your web app URL: ${mySiteURL}"
  193  endpoint="${mySiteURL}/api/updates"
  194  subId=$(az account show --subscription "" | jq -r '.id')
  195  az eventgrid event-subscription create     --source-resource-id "/subscriptions/$subId/resourceGroups/az204-evgrid-rg/providers/Microsoft.EventGrid/topics/$myTopicName"     --name az204ViewerSub     --endpoint $endpoint
  196  endpoint="${mySiteURL}/api/updates"
  197  subId=$(az account show --subscription "" | jq -r '.id')
  198  endpoint="${mySiteURL}/api/updates"
  199  subId=$(az account show --subscription "" | jq -r '.id')
  200  az account show
  201  az account show --subscription
  202  az account show --subscription ""
  203  subid="a5045d8f-5a9a-4d29-aaee-1f829d64bee0"
  204  az eventgrid event-subscription create     --source-resource-id "/subscriptions/$subId/resourceGroups/az204-evgrid-rg/providers/Microsoft.EventGrid/topics/$myTopicName"     --name az204ViewerSub     --endpoint $endpoint
  205  "/subscriptions/$subId/resourceGroups/az204-evgrid-rg/providers/Microsoft.EventGrid/topics/$myTopicName"
  206  subId="a5045d8f-5a9a-4d29-aaee-1f829d64bee0"
  207  "/subscriptions/$subId/resourceGroups/az204-evgrid-rg/providers/Microsoft.EventGrid/topics/$myTopicName"
  208  az eventgrid event-subscription create     --source-resource-id "/subscriptions/$subId/resourceGroups/az204-evgrid-rg/providers/Microsoft.EventGrid/topics/$myTopicName"     --name az204ViewerSub     --endpoint $endpoint
  209  topicEndpoint=$(az eventgrid topic show --name $myTopicName -g az204-evgrid-rg --query "endpoint" --output tsv)
  210  key=$(az eventgrid topic key list --name $myTopicName -g az204-evgrid-rg --query "key1" --output tsv)
  211  event='[ {"id": "'"$RANDOM"'", "eventType": "recordInserted", "subject": "myapp/vehicles/motorcycles", "eventTime": "'`date +%Y-%m-%dT%H:%M:%S%z`'", "data":{ "make": "Contoso", "model": "Monster"},"dataVersion": "1.0"} ]'
  212  curl -X POST -H "aeg-sas-key: $key" -d "$event" $topicEndpoint