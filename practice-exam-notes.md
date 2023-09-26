# Exam Notes

1. az 
https://learn.microsoft.com/training/modules/run-docker-with-azure-container-instances/5-use-data-volumes

2. az 
https://learn.microsoft.com/training/modules/build-and-store-container-images/

3. registry key for loading certs
app service

4.  az webapp deploy

5. az webapp cors
https://learn.microsoft.com/training/modules/control-azure-services-with-cli/
additional, not az-204, learning module
6. web app AAR affinity
7. function conumption plan
8. function pattern (premium, fan-out/fan-in)
9. timer function code segment
https://learn.microsoft.com/en-us/training/modules/execute-azure-function-with-triggers/3-timer-trigger
https://learn.microsoft.com/azure/azure-functions/functions-bindings-timer?tabs=in-process&pivots=programming-language-csharp#ncrontab-expressions
know CRON expressions!
0 */5 * * * *
*	Selects every value in a field	An asterisk "*" in the day of the week field means every day.
,	Separates items in a list	A comma "1,3" in the day of the week field means just Mondays (day 1) and Wednesdays (day 3).
-	Specifies a range	A hyphen "10-12" in the hour field means a range that includes the hours 10, 11, and 12.
/	Specifies an increment	A slash "*/10" in the minutes field means an increment of every 10 minutes.

10. ACI container group
11. ACI container group. use ARM when many resources, YAML does not support additional resources
12. ACR deployment w/ namespace
container layers
13. app cert
purchased cert auto renews
14. Cosmos DB
max throughput, min latency
eventual
https://learn.microsoft.com/training/modules/explore-azure-cosmos-db/5-choose-cosmos-db-consistency-level
https://learn.microsoft.com/azure/cosmos-db/consistency-levels
15. Cosmos DB partition key
16. Cosmos DB change feed consumer ***
lease container
https://learn.microsoft.com/training/modules/consume-azure-cosmos-db-sql-api-change-feed-use-sdk/2-understand-features-sdk
https://learn.microsoft.com/azure/cosmos-db/nosql/change-feed-functions
17. blob storage
PUT metadata headers up to 8K
https://learn.microsoft.com/training/paths/develop-solutions-that-use-blob-storage/
https://learn.microsoft.com/rest/api/storageservices/setting-and-retrieving-properties-and-metadata-for-blob-resources
18. blob contennt "transient fault"
blob download code snippet
https://learn.microsoft.com/training/modules/azure-storage-fundamentals/
https://learn.microsoft.com/en-us/dotnet/api/azure.storage.blobs.specialized.blobbaseclient.downloadcontent?view=azure-dotnet
19. archive blob
https://learn.microsoft.com/azure/storage/blobs/archive-rehydrate-overview
20. sotrage lifecycle policy
https://learn.microsoft.com/en-us/training/modules/manage-azure-blob-storage-lifecycle/3-blob-storage-lifecycle-policies
https://learn.microsoft.com/azure/storage/blobs/lifecycle-management-overview
21. rehydrate blobs
https://learn.microsoft.com/training/modules/manage-azure-blob-storage-lifecycle/5-rehydrate-blob-data
22. static website
https://learn.microsoft.com/azure/storage/blobs/storage-blob-static-website
https://learn.microsoft.com/azure/storage/blobs/storage-blob-static-website-how-to?tabs=azure-cli
23. http properties of blob storage container
https://learn.microsoft.com/training/modules/work-azure-blob-storage/5-set-retrieve-properties-metadata-rest
24. redis modules
only supported by Enterprise tier
 https://learn.microsoft.com/training/modules/develop-for-azure-cache-for-redis/
25. Redis cache key duration code snippet
https://learn.microsoft.com/dotnet/api/overview/azure/redis-cache?view=azure-dotnet

# take 2
9. az container create

15. Microsoft Defender for Cloud pricing plans
Securing Functions
About the function app, not Defender
https://learn.microsoft.com/training/paths/implement-azure-functions/
https://learn.microsoft.com/azure/defender-for-cloud/defender-for-app-service-introduction
https://learn.microsoft.com/azure/azure-functions/security-concepts?tabs=v4

19. container restart policy
https://learn.microsoft.com/training/modules/create-run-container-images-azure-container-instances/4-run-containerized-tasks-restart-policies

25. Event hubs streaming data
https://learn.microsoft.com/training/modules/intro-to-event-hubs/
https://learn.microsoft.com/azure/event-hubs/event-hubs-capture-enable-through-portal


27. Service Bus queue
multicast request/reply
https://learn.microsoft.com/training/modules/discover-azure-message-queue/5-messages-payloads-serialization


28. Queue
https://learn.microsoft.com/training/modules/discover-azure-message-queue/8-queue-storage-code-examples

30. Optimize query results
bad question???

You plan to use Microsoft Graph to retrieve a list of users in an Azure Active Directory (Azure AD) tenant.
You need to optimize query results.
Which two query options should you use? Each correct answer presents part of the solution.
Select all answers that apply.

$filter
This answer is correct.
$count
$select
This answer is incorrect.
$expand
This answer is correct.
https://learn.microsoft.com/training/modules/microsoft-graph/3-microsoft-graph-api


# Added Learning Stuff
https://learn.microsoft.com/en-us/training/modules/run-docker-with-azure-container-instances/

# session
ETag and Last Modified on storage
ETag: optimistic concurency

Cconfigure some API policies with Base

EventHub Consumer Group

size of queue storage
