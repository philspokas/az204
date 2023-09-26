$rg = "test"
$location = "westus3"
$name = "testacr$(Get-Random)"

$registry = New-AzContainerRegistry -ResourceGroupName $rg -Name $name -EnableAdminUser -Sku Basic

Connect-AzContainerRegistry -Name $registry.Name

docker pull mcr.microsoft.com/hello-world

docker tag mcr.microsoft.com/hello-world "$($registry.LoginServer)/hello-world:v1"

docker push "$($registry.LoginServer)/hello-world:v1"

docker run  "$($registry.LoginServer)/hello-world:v1"

docker tag testapp:v2 "$($registry.LoginServer)/testapp:v2"
