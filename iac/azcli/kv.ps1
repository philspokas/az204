$myKeyVault="az204vault-20230110"
$myLocation = "westus2"
$rg = "test"
az account set --subscription "J-VSE-MPN"     

az keyvault create --name $myKeyVault --resource-group $rg --location $myLocation

# sometimes the resource provider needs to be registered in a subscription before using it

