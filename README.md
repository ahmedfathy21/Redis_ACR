# Redis Deployment _ ACR 
![Screenshot from 2025-02-15 12-48-01](https://github.com/user-attachments/assets/5432ac90-2d7b-4655-829d-82598a55e12e)

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
- Get ACR credentials >> The output  ![image](https://github.com/user-attachments/assets/abfa3197-b124-4f7a-b50c-d6975653ba68)

 >> User the value as the ACR_PASSWORD
```
az acr credential show --name <Registry_Name>
``` 
- Verify Deployment

```
az container show --name <Container_Name> --resource-group <MY_RG>
```


### Differences Between ACI & ACR

| Feature    | ACI (Azure Container Instances) | ACR (Azure Container Registry) |
|------------|---------------------------------|--------------------------------|
| Purpose    | Runs containerized applications | Manages container images       |
| Usage      | Deploys and manages containers  | Stores and manages Docker container images |
| Scope      | Container runtime environment   | Container registry level       |
| Integration| Integrated with Azure services  | Integrated with Azure services |
| Management | Managed through Azure CLI and portal | Managed through Azure CLI and portal |

#### Install & Start up the Redis Locally 
- Install Dependances
```
sudo apt update
sudo apt install redis-tools
```
- Run the Container Locally
```
docker run -d -p 6379:6379 myredisregistry.azurecr.io/redis-azure:7.0.12
```
- Running redis With redis-cli
```
redis-cli -h localhost -p 6379
```
![Screenshot from 2025-02-16 01-30-15](https://github.com/user-attachments/assets/d3e0fad2-4110-4e6c-9041-2c814247a905)

#### Interact with redis Using redis library 
- install redis library
```
python3 -m pip install redis
```
![Screenshot from 2025-02-16 01-52-41](https://github.com/user-attachments/assets/685c9d66-b05a-43da-a8ad-49e2c790d91a)
- Run the Python Script
```
python3 RedisScript.py
```

