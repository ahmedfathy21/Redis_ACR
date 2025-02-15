# Redis Deployment _ ACR 
- This Docker file just Build an redis-image

##  Steps to build Image & create , deploy the container in ACR 
- Clone the Github repo 
```
 git clone https://github.com/ahmedfathy21/Redis_ACR.git &
 cd redis
```
- build the image & tag it 
```
Dokcer build -t <Image_name>  .
Docker tag  <Image_name>  <Tag_name>
```
- Login to azure
```
az login
```
- Create Resource Group
```
az group create --name <RG_Name>  --location eastus
```
- Create ACR >> Azure container registry 
```
az acr create --resource-group <RG_Name> \
  --name <ACR_Name> \
  --sku Basic
```
- Login to ACR
```
az acr login --name  <ACR_Name>
```
- push image to ACR
```
docker push <Tag>
```
- Deploy to Azure Container Instaces 
```
az container create \
  --resource-group <RG_Name> \
  --name <Container_name> \
  --image <Tag_Image> \
  --cpu 1 --memory 1.5 \
  --ports 6379 \
  --registry-login-server <Registry_Name>.azurecr.io \
  --registry-username <ACR_USERNAME> \
  --registry-password <ACR_PASSWORD>
  --os-Type <Linux / Windows> #Depends on needs 
```
- Get ACR credentials >> The output ![alt text](image.png) >> User the value as the ACR_PASSWORD
```
az acr credential show --name <Registry_Name>
``` 
- Verify Deployment
```
az container show --name <Container_Name> --resource-group <MY_RG>
```

 