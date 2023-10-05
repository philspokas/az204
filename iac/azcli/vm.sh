# Create Azure VM
myResourceGroup="wvm"

az group create --resource-group $myResoureGroup --location westus3

az vm create --resource-group wvm \ 
    --name myVM --image win2016datacenter \ 
    --generate-ssh-keys \ 
    --assign-identity \ 
    --role contributor \
    --scope mySubscription \
    --admin-username azureuser \ 
    --admin-password myPassword12

# existing VM
az vm identity assign -g wvm -n myVm

# user assigned
# privs: Virtual Machine Contributor and Managed Identity Operator
# create
az identity create -g wvm -n myUserAssignedIdentity

# assign to VM during create
# az vm create \
# --resource-group <RESOURCE GROUP> \
# --name <VM NAME> \
# --image UbuntuLTS \
# --admin-username <USER NAME> \
# --admin-password <PASSWORD> \
# --assign-identity <USER ASSIGNED IDENTITY NAME> \
# --role <ROLE> \
# --scope <SUBSCRIPTION>

# assign existing
# az vm identity assign \
#     -g <RESOURCE GROUP> \
#     -n <VM NAME> \
#     --identities <USER ASSIGNED IDENTITY>

    