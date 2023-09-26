Connect-AzAccount

Get-AzLocation | select Location

Get-AzContext

Set-AzContext -Subscription "Phil-VSE-MPN"
Set-AzContext -Subscription "j-vse-mpn"

$resourceGroup = "storagerg"
$location = "westus3"

New-AzResourceGroup -name $resourceGroup -Location $location

New-AzStorageAccount -ResourceGroupName $resourceGroup -Name "ewusa0624" -Location $location -SkuName Standard_LRS -Kind StorageV2