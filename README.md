This contains my demo for the MLSA Azure Episodes.

![237cdd68-2bcb-40fd-8c10-7a104d6fbdc5](https://github.com/Mbaoma/SCA-Cloud-School-Application/assets/49791498/1dcf361d-fd5e-4814-b0ff-4d0f06d935a6)


In the demo, I will walk through the following:
- creating a docker image, 
- pushing the image to Azure Container Registry
- deploying the image to Azure Kubernetes serices.

## Steps
- [Push](https://learn.microsoft.com/en-us/azure/app-service/tutorial-custom-container?tabs=azure-portal&pivots=container-linux) the image to Azure Container Registry

- [Create](https://learn.microsoft.com/en-us/azure/aks/learn/quick-kubernetes-deploy-portal?tabs=azure-cli) a K8s cluster and deployment files.

### Connect to the AKS CLI
[Guide](https://learn.microsoft.com/en-us/azure/aks/learn/quick-kubernetes-deploy-cli)
```bash
$ az aks install-cli
$ az aks get-credentials --resource-group myResourceGroup --name myAKSCluster
$ kubectl get nodes
```

### Create Deployments
```bash
$ kubectl apply -f demo-ip.yml
$ kubectl apply -f demo-service.yml
```

### Test the application
```bash
$ kubectl get service
```