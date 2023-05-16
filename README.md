This contains my demo for the MLSA Azure Episodes.

![237cdd68-2bcb-40fd-8c10-7a104d6fbdc5](https://github.com/Mbaoma/SCA-Cloud-School-Application/assets/49791498/1dcf361d-fd5e-4814-b0ff-4d0f06d935a6)


In the demo, I will walk through the following:
- creating a docker image, 
- pushing the image to Azure Container Registry
- deploying the image to Azure Kubernetes serices.

## Steps
-  Test the app locally
```bash
$ python main.py
```

- Create a Docker image
```bash
$ docker login
$ docker build -t hub-username/image-name .
```

- [Push](https://learn.microsoft.com/en-us/azure/aks/tutorial-kubernetes-prepare-acr?tabs=azure-cli) the image to Azure Container Registry
```bash
$ az group create --name myResourceGroup --location eastus
$ az acr create --resource-group myResourceGroup --name <acrName> --sku Basic
$ az acr login --name <acrName>
$ docker tag docker-image:tag <acrLoginServer>/image-name:tag
$ docker images
$ docker push <acrLoginServer>/image-name:tag
```

- Get your image name and tag
```bash
$ az acr repository list --name <ACRname>    
$ az acr repository show-tags --name <ACRname> --repository <repo> --output table
```

### Connect to the AKS CLI
[Guide](https://learn.microsoft.com/en-us/azure/aks/learn/quick-kubernetes-deploy-cli)
```bash
$ az aks install-cli
$ az account set --subscription xxxx-xxx-xx-xx-xxxx
$ az aks get-credentials --resource-group myResourceGroup --name myAKSCluster
$ kubectl get nodes
```

- [Create](https://learn.microsoft.com/en-us/azure/aks/learn/quick-kubernetes-deploy-portal?tabs=azure-cli) a K8s cluster and deployment files.

### Create Deployments
```bash
$ kubectl apply -f aks/demo-ip.yml
$ kubectl apply -f aks/demo-service.yml
```

### Test the application
```bash
$ kubectl get service
```

Navigate to the IP provided under ```External-IP```

<img width="1016" alt="image" src="https://github.com/Mbaoma/SCA-Cloud-School-Application/assets/49791498/2d1e0d48-1c6b-4e8b-9c13-8ec98eb83bad">

### Debugging
```bash
$ kubectl get pods
$ kubectl get logs <pod-name>
$ kubectl describe pod <pod-name>
$ kubectl describe service <service-name>
$ kubectl describe deployment <deployment>
```

### Clean up
```bash
$ az group delete --name myResourceGroup --yes --no-wait
```