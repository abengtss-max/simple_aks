# name of the resource group i.e smoclusterk8s
resourceGroup='smoclusterk8s'

# Region where AKS shall be deployed i.e eastus
location='eastus'

# AKS cluster name i.e smocluster12
clusterName='smocluster12'

# Version of Kubernetes to use for creating the cluster, i.e 1.24.9
k8sVersion='1.24.9'

# Number of worker nodes in your node pool, default is 3
nodeCount='3'

# Azure Virtual Machine size, default is Standard_DS2_v2
vmSize='Standard_DS2_v2'

# Kubernetes network plugin to use. available options: kubenet,Azure or none. Default kubenet
networkPlugin='kubenet'

# Check if resource group exist before creating
if [ $(az group exists --name $resourceGroup) = false ]; then 
   az group create --name $resourceGroup --location "$location" 
else
   echo '***Resource group:' $resourceGroup 'already exists***'
fi

# Create the AKS cluster
az aks create -g $resourceGroup -n $clusterName --kubernetes-version $k8sVersion --node-count $nodeCount  --node-vm-size $vmSize --network-plugin $networkPlugin

# Check if AKS is running
if [ $(az aks show --name $clusterName --resource-group $resourceGroup --query provisioningState -o tsv) = Succeeded ]; then 
   echo '***AKS cluster:' $clusterName 'has been succesfully deployed***'
   az aks get-credentials --name $clusterName --resource-group $resourceGroup
   echo '****Credentials succesfully fetched for:' $clusterName 'you can now run kubectl command to interact with you AKS cluster***'
   kubectl get nodes

else
   echo 'Oops something went wrong'
fi

