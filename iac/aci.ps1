
$rg = "containers2"
$image_name = "testacr979458854.azurecr.io/weather101:v1"

az container create --resource-group $rg --name weatherapp2 --image $image_name --dns-name-label weather-demo --ports 8080
