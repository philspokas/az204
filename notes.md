https://docs.microsoft.com/en-us/learn/modules/create-serverless-logic-with-azure-functions/5-add-logic-to-the-function-app?pivots=javascript

Subscription for test stuff:
https://portal.azure.com/#@IntelliTect.com/resource/subscriptions/a5045d8f-5a9a-4d29-aaee-1f829d64bee0/overview

Cosmos DB test:
https://portal.azure.com/#@IntelliTect.com/resource/subscriptions/a5045d8f-5a9a-4d29-aaee-1f829d64bee0/resourceGroups/test/providers/Microsoft.DocumentDB/databaseAccounts/test-pcs-001/dataExplorer

https://madeofstrings.com/2018/03/14/azure-event-grid-viewer-with-asp-net-core-and-signalr/

https://az204-egsite-846926325.azurewebsites.net/


Next up:
- [x] https://learn.microsoft.com/en-us/training/modules/azure-event-hubs/1-introduction
- [x] Cosmos DB learn
- [] doing event hubs stuff https://learn.microsoft.com/en-us/azure/event-hubs/event-hubs-dotnet-standard-getstarted-send?tabs=passwordless%2Croles-azure-cli
- [] EventHub Consumer Group
- [-] Cosmos DB samples
- Web app to sign in users and call graph api https://learn.microsoft.com/en-us/azure/active-directory/develop/quickstart-web-app-aspnet-core-sign-in

notes:
https://learn.microsoft.com/en-us/training/modules/azure-event-hubs/6-event-hubs-programming-guide

https://learn.microsoft.com/en-us/training/modules/implement-azure-key-vault/2-key-vault-overview
https://learn.microsoft.com/en-us/training/modules/implement-azure-key-vault/5-set-retrieve-secret-azure-key-vault

# Cosmos DB stuff
Items document
{
    "id": "1",
    "category": "personal",
    "name": "groceries",
    "description": "Pick up apples and strawberries.",
    "isComplete": false
}

# more notes
real world redis
real world DNS

message bus filtering samples


# Whiz 1
38: 

2 register app
4 configure app
7 configure secrets
5 configure permission
3 control access
1 store token cache

config permissions

4

Function trigger dirction is always "in"

# Whiz 2

Notification Hubs???
x app insights

# Whiz 3
app insight data volume pricing: http://docs.microsoft.com/en-us/azure/azure-monitor/app/pricing#managing-your-data-volume

redis cache: 
https://docs.microsoft.com/en-us/azure/azure-cache-for-redis/cache-web-app-cache-aside-leaderboard
https://docs.microsoft.com/en-us/azure/architecture/patterns/cache-aside

cdn:
https://docs.microsoft.com/en-us/azure/cdn/cdn-query-string

vm:
https://docs.microsoft.com/en-us/azure/virtual-machines/windows/quick-create-cli

az command *can* copy blobs: https://docs.microsoft.com/en-us/cli/azure/storage/blob/copy?view=azure-cli-latest

az pwsh *can* copy blobs


Review cosmosdb 
- consistency levels: https://docs.microsoft.com/en-us/azure/cosmos-db/consistency-levels
- sql query https://docs.microsoft.com/en-us/azure/cosmos-db/sql-query-object-array

Storage
- developing for storage: https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-dotnet
- lease https://docs.microsoft.com/en-us/rest/api/storageservices/lease-blob
- blob storage tiers: https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-storage-tiers

Event Grid
- event type filtering https://docs.microsoft.com/en-us/azure/event-grid/event-filtering
- 

Service Bus
- queue vs. topic api calls: https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-dotnet-get-started-with-queues
- sample code: https://github.com/jignesht24/AzureExamples/blob/master/AzureServiceBus-Queue/BasicExample/BasicReceiverQueueExample/Program.cs

#whiz 4

app auth: https://docs.microsoft.com/en-us/azure/api-management/api-management-howto-protect-backend-with-aad


cosmos db:
- stored procs syntax https://docs.microsoft.com/en-us/rest/api/cosmos-db/stored-procedures
- indexing properties: https://docs.microsoft.com/en-us/azure/cosmos-db/how-to-manage-indexing-policy

service bus:
- enqueue time: https://docs.microsoft.com/en-us/azure/service-bus-messaging/message-sequencing
- perf: https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-performance-improvements

container mount stuff
- secrets: https://docs.microsoft.com/en-us/azure/container-instances/container-instances-volume-secret


event grid:
- filtering: https://docs.microsoft.com/en-us/azure/event-grid/event-filtering
- review config (jic): https://docs.microsoft.com/en-us/azure/event-grid/monitor-virtual-machine-changes-event-grid-logic-app
- compare services: https://docs.microsoft.com/en-us/azure/event-grid/compare-messaging-services

azure functions:
- custom handlers: https://docs.microsoft.com/en-us/azure/azure-functions/functions-custom-handlers

vm:
- rdp for linux: https://docs.microsoft.com/en-us/azure/virtual-machines/linux/use-remote-desktop

front door:
- compression types gzip and *brotl* supported: https://docs.microsoft.com/en-us/azure/frontdoor/front-door-caching

storage:
- metadata stuff: https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-properties-metadata


storage queues:
- do *not* provide duplicate detection

# whiz Final

event grid 
- filtering https://learn.microsoft.com/en-us/azure/event-grid/event-filtering#subject-filtering

api managmenet
- policies https://learn.microsoft.com/en-us/azure/api-management/api-management-advanced-policies

app service
- docker container logging https://docs.microsoft.com/en-us/cli/azure/webapp/log?view=azure-cli-latest#az-webapp-log-config

app insight
- progressing through the app is funnel https://docs.microsoft.com/en-us/azure/azure-monitor/app/usage-funnels