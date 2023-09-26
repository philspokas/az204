
location="westus3"
rg="az204-redis-rg"
redisName=az204redis$RANDOM

az group create --name $rg --location $location

az redis create --location $location --resource-group $rg  --name $redisName --sku Basic --vm-size c0

az group delete -n $rg