# Monitor an App Service app with web server logs
# set -e # exit if error
# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
location="westus3"
resourceGroup="test"
tag="monitor-with-logs.sh"
appServicePlan="test-appsvc-$randomIdentifier"
webapp="test-appsvc-$randomIdentifier"

# Create a resource group.
echo "Creating $resourceGroup in "$location"..."
az group create --name $resourceGroup --location "$location" --tag $tag

# Create an App Service Plan
echo "Creating $appServicePlan"
az appservice plan create --name $appServicePlan --resource-group $resourceGroup

# Create a Web App and save the URL
# note! url is *not* correcturl
echo "Creating $webapp"
url=$(az webapp create --name $webapp --resource-group $resourceGroup --plan $appServicePlan --query defaultHostName | sed -e 's/^"//' -e 's/"$//')

# Enable all logging options for the Web App
az webapp log config --name $webapp --resource-group $resourceGroup --application-logging azureblobstorage --detailed-error-messages true --failed-request-tracing true --web-server-logging filesystem

# Create a Web Server Log
curl -s -L $url/404

# Download the log files for review
az webapp log download --name $webapp --resource-group $resourceGroup