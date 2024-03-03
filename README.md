# Instructions
> [!Note]
> Application Gateway has two versions of the WAF sku: Application Gateway WAF_v1 and Application Gateway WAF_v2. WAF policy associations are only supported for the Application Gateway WAF_v2 sku.

## Environment variables

Name of the resource group i.e clusterk8s
```
resourceGroup=''

```

Region where AKS shall be deployed i.e eastus
```
location=''

```

AKS cluster name i.e cluster12
```
clusterName=''

```

Version of Kubernetes to use for creating the cluster, i.e 1.24.9
```
k8sVersion=''
```

Number of worker nodes in your node pool, default is 3
```
nodeCount=''

```
 Azure Virtual Machine size, default is Standard_DS2_v2
```
vmSize=''

```

Kubernetes network plugin to use. available options: kubenet,Azure or none. Default kubenet
```
networkPlugin=''
```

## Execute the script 

./create_aks.sh
