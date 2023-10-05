# warning: very scratchy!

$rg = "containers2"
$location = "westus3"
# $name = "testacr$(Get-Random)"
$acr_name = "testacr979458854"

function CreateRegistry() {
    New-AzResourceGroup $rg -Location $location

    $registry = New-AzContainerRegistry -ResourceGroupName $rg -Name $name -EnableAdminUser -Sku Basic

    Connect-AzContainerRegistry -Name $registry.Name
}

docker pull mcr.microsoft.com/hello-world

docker tag mcr.microsoft.com/hello-world "$($registry.LoginServer)/hello-world:v1"

docker push "$($registry.LoginServer)/hello-world:v1"

docker run  "$($registry.LoginServer)/hello-world:v1"


## docker tag testapp:v2 "$($registry.LoginServer)/testapp:v2"

docker tag weather101 "$($registry.LoginServer)/weather101:v1"
docker push "$($registry.LoginServer)/weather101:v1"


$image_name = "testacr979458854.azurecr.io/weather101:v1"

az container create --resource-group $rg --name weatherapp2 --image $image_name --dns-name-label weather-demo --ports 8080

Invoke-RestMethod -URI "http://weather-demo.westus3.azurecontainer.io:8080/weatherforecast"

# az container create --resource-group $rg `
#     --name $aci_container_name `
#     --image $image_name `
#     --registry-login-server $registry_login_server `
#     --registry-username $akv_pull_usernamevalue `
#     --registry-password $akv_pullpasswordvalue `
#     --dns-name-label $dns_name_label `
#     --ports 5000 `
#     --output table

