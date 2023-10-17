$rg="samples"
$location="westus3"
$namespace="SampleSB"
$queuename="orders-queue"

az group create --name $rg --location $location

az servicebus namespace create --resource-group $rg --name $namespace --location $location

az servicebus queue create --resource-group $rg --namespace-name $namespace --name $queuename

# 
$topic = "test-topic"
New-AzServiceBusTopic -Name $topic -NamespaceName $namespace -ResourceGroupName $rg

$subscription = "test-topic-sub"
New-AzServiceBusSubscription -Name $subscription -NamespaceName $namespace -ResourceGroupName $rg -TopicName $topic
