rgName="hubtest"
region="westus3"

az group create --name $rgName --location $region

# Create an Event Hubs namespace. Specify a name for the Event Hubs namespace.
namespaceName="hubtest$RANDOM"
az eventhubs namespace create --name $namespaceName --resource-group $rgName -l $region

# Create an event hub. Specify a name for the event hub. 
eventhubName="hub$RANDOM"
az eventhubs eventhub create --name $eventhubName --resource-group $rgName --namespace-name $namespaceName



az eventhubs namespace show -g $rgName -n $namespaceName --query id

namespaceName="hubtest25927" 
hubName=""


namespaceId=$(az eventhubs namespace show -g $rgName -n $namespaceName --query id --out tsv)

# bad request???
az role assignment create --assignee "phil@intellitect.com" \
--role "Azure Event Hubs Data Owner" \
--scope $namespaceId

# az group delete --name $rgName