sudo yum update -y
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
terraform version
mkdir terraform-project && cd terraform-project
nano main.tclear
nani main.tf
nano main.tf
terraform init
terraform plan
terraform apply
aws s3 ls
cd terraform-project
```bash
cd terraform-project
rm main.tf
```
nano main.tf
terraform init
terraform plan
clear
terraform apply
sudo yum update -y
clear
sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker
sudo docker run hello-world
sudo systemctl enable docker
docker --version
sudo usermod -a -G docker $(whoami)
newgrp docker
clear
mkdir -p challenge-day2/backend && cd challenge-day2/backend
wget https://tcb-public-events.s3.amazonaws.com/mdac/resources/day2/cloudmart-backend.zip
unzip cloudmart-backend.zip
mkdir -p challenge-day2/backend && cd challenge-day2/backend
wget https://tcb-public-events.s3.amazonaws.com/mdac/resources/day2/cloudmart-backend.zip
unzip cloudmart-backend.zip
nano .env
nano.env
nano .env
nano Dockerfile
clear
docker build -t cloudmart-backend .
docker run -d -p 5000:5000 --env-file .env cloudmart-backend
docker build -t cloudmart-backend .
docker run -d -p 5000:5000 --env-file .env cloudmart-backend
cd ..
mkdir frontend && cd frontend
wget https://tcb-public-events.s3.amazonaws.com/mdac/resources/day2/cloudmart-frontend.zip
unzip cloudmart-frontend.zip
clear
nano .env
FROM node:16-alpine as build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
FROM node:16-alpine
WORKDIR /app
RUN npm install -g serve
COPY --from=build /app/dist /app
ENV PORT=5001
ENV NODE_ENV=production
EXPOSE 5001
CMD ["serve", "-s", ".", "-l", "5001"]
nano .env
FROM node:16-alpine as build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
FROM node:16-alpine
WORKDIR /app
RUN npm install -g serve
COPY --from=build /app/dist /app
ENV PORT=5001
ENV NODE_ENV=production
EXPOSE 5001
CMD ["serve", "-s", ".", "-l", "5001"]

nano .env
nano Dockerfile
docker build -t cloudmart-frontend .
docker run -d -p 5001:5001 cloudmart-frontend
docker build -t cloudmart-frontend .
docker run -d -p 5001:5001 cloudmart-frontend
clear
nano main.tf
aws dynamodb list-tables
aws dynamodb scan \
```bash
nano main.tf
```
nano main.tf
cd terraform-project
rm main.tf
nano main.tf
terraform init
terraform plan
terraform apply
yaml
aws configure`

clear
```yaml
aws configure
kubectl apply -f cloudmart-backend.yaml
cd challenge-day2/backend
kubectl apply -f cloudmart-backend.yaml
cd challenge-day2/backend
nano cloudmart-backend.yaml
kubectl apply -f cloudmart-backend.yaml
kubectl get pods
kubectl get deployment
kubectl get service
nano cloudmart-backend.yaml
cd challenge-day2/backend
nano cloudmart-backend.yaml
kubectl apply -f cloudmart-backend.yaml
nano cloudmart-backend.yaml
kubectl apply -f cloudmart-backend.yaml
nano cloudmart-backend.yaml
cd challenge-day2/backend
nano cloudmart-backend.yaml
kubectl apply -f cloudmart-backend.yaml
kubectl get pods
kubectl get deployment
kubectl get service
VITE_API_BASE_URL=http://<a2d06c3454c8b46e699080d6d905bac4-980760305.us-east-1.elb.amazonaws.com>:5000/api
nano .env
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo cp /tmp/eksctl /usr/bin
eksctl version
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.9/2020-11-02/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
kubectl version --short --client
eksctl create cluster   --name cloudmart   --region us-east-1   --nodegroup-name standard-workers   --node-type t3.medium   --nodes 1   --with-oidc   --managed
eksctl create cluster   --name cloudmart   --region us-east-1   --nodegroup-name standard-workers   --node-type t3.medium   --nodes 1   --with-oidc   --managed
kubectl version --short --client
eksctl create cluster   --name cloudmart   --region us-east-1   --nodegroup-name standard-workers   --node-type t3.medium   --nodes 1   --with-oidc   --managed
clear
aws iam attach-user-policy   --user-name ekuser   --policy-arn arn:aws:iam::aws:policy/AmazonEKSClusterPolicy
aws iam attach-user-policy   --user-name ekuser   --policy-arn arn:aws:iam::aws:policy/AmazonEKSServicePolicy
clear
eksctl create cluster   --name cloudmart   --region us-east-1   --nodegroup-name standard-workers   --node-type t3.medium   --nodes 1   --with-oidc   --managed
aws iam attach-user-policy   --user-name ekuser   --policy-arn arn:aws:iam::aws:policy/AmazonEKSServicePolicy
eksctl create cluster   --name cloudmart   --region us-east-1   --nodegroup-name standard-workers   --node-type t3.medium   --nodes 1   --with-oidc   --managed
aws iam attach-user-policy   --user-name ekuser   --policy-arn arn:aws:iam::aws:policy/AmazonEKSServicePolicy
aws iam attach-user-policy --user-name ekuser --policy-arn arn:aws:iam::aws:policy/AmazonEKSServicePolicy
clear
eksctl create cluster   --name cloudmart   --region us-east-1   --nodegroup-name standard-workers   --node-type t3.medium   --nodes 1   --with-oidc   --managed
aws iam attach-user-policy --user-name ekuser --policy-arn arn:aws:iam::aws:policy/AmazonEKSServicePolicy --output json
eksctl create cluster   --name cloudmart   --region us-east-1   --nodegroup-name standard-workers   --node-type t3.medium   --nodes 1   --with-oidc   --managed
aws configure
eksctl create cluster   --name cloudmart   --region us-east-1   --nodegroup-name standard-workers   --node-type t3.medium   --nodes 1   --with-oidc   --managed
aws configure
eksctl create cluster   --name cloudmart   --region us-east-1   --nodegroup-name standard-workers   --node-type t3.medium   --nodes 1   --with-oidc   --managed
clear
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo cp /tmp/eksctl /usr/bin
eksctl version
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.9/2020-11-02/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
kubectl version --short --client
eksctl create cluster   --name cloudmart   --region us-east-1   --nodegroup-name standard-workers   --node-type t3.medium   --nodes 1   --with-oidc   --managed
aws iam attach-user-policy --user-name ekuser --policy-arn arn:aws:iam::aws:policy/AmazonEKSServicePolicy --output json
eksctl create cluster   --name cloudmart   --region us-east-1   --nodegroup-name standard-workers   --node-type t3.medium   --nodes 1   --with-oidc   --managed
aws iam attach-user-policy --user-name ekuser --policy-arn arn:aws:iam::aws:policy/AmazonEKSServicePolicy --output json
eksctl create cluster   --name cloudmart   --region us-east-1   --nodegroup-name standard-workers   --node-type t3.medium   --nodes 1   --with-oidc   --managed
clear

eksctl create cluster   --name cloudmart   --region us-east-1   --nodegroup-name standard-workers   --node-type t3.medium   --nodes 1   --with-oidc   --managed
aws iam attach-user-policy --user-name ekuser --policy-arn arn:aws:iam::aws:policy/AmazonEKSServicePolicy --output json
eksctl create cluster   --name cloudmart   --region us-east-1   --nodegroup-name standard-workers   --node-type t3.medium   --nodes 1   --with-oidc   --managed
clear
aws eks update-kubeconfig --name cloudmart
kubectl get svc
kubectl get nodes
eksctl create iamserviceaccount   --cluster=cloudmart   --name=cloudmart-pod-execution-role   --role-name CloudMartPodExecutionRole   --attach-policy-arn=arn:aws:iam::aws:policy/AdministratorAccess  --region us-east-1   --approve
cd challenge-day2/backend
nano cloudmart-backend.yaml
```yaml
kubectl apply -f cloudmart-backend.yaml
```
clear
kubectl apply -f cloudmart-backend.yaml
nano cloudmart-backend.yaml
kubectl apply -f cloudmart-backend.yaml
cd challenge-day2/backend
nano cloudmart-backend.yaml
kubectl apply -f cloudmart-backend.yaml
cd ../challenge-day2/frontend
nano .env
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/n8t4z4m3
docker build -t cloudmaster-backend .
docker tag cloudmaster-backend:latest public.ecr.aws/n8t4z4m3/cloudmaster-backend:latest
docker push public.ecr.aws/n8t4z4m3/cloudmaster-backend:latest
```yaml
kubectl apply -f cloudmart-backend.yaml
```
```yaml
kubectl apply -f cloudmart-backend.yaml
clear

kubectl apply -f cloudmart-backend.yaml

clear
clear
clear

kubectl apply -f cloudmart-backend.yaml
wwa


q
a
q
clear
cd ../challenge-day2/frontend
```yaml
cd ../challenge-day2/frontend
nano .env
clear
cd ../challenge-day2/frontend
nano .env
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/n8t4z4m3
docker build -t cloudmaster-frontend .
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/n8t4z4m3
docker build -t cloudmaster-frontend .
cd ../challenge-day2/frontend
cd /challenge-day2/frontend
docker build -t cloudmaster-frontend .aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/n8t4z4m3
kubectl get pods
kubectl get deployment
kubectl get service
cd ../challenge-day2/frontend
cd /challenge-day2/frontend
cd ../challenge-day2/backend
aws eks update-kubeconfig --name cloudmart
cd /challenge-day2/frontend
aws configure
aws eks update-kubeconfig --name cloudmart
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/n8t4z4m3
docker build -t cloudmaster-frontend .
docker build -t cloudmaster-frontend
cd ../challenge-day2/frontend
ls ../challenge-day2/
aws eks update-kubeconfig --name cloudmart
kubectl get svc
kubectl get nodes
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/n8t4z4m3
docker build -t cloudmaster-frontend .
docker tag cloudmaster-frontend:latest public.ecr.aws/n8t4z4m3/cloudmaster-frontend:latest
docker push public.ecr.aws/n8t4z4m3/cloudmaster-frontend:latest
aws configure
aws eks update-kubeconfig --name cloudmart
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo cp /tmp/eksctl /usr/bin
eksctl version
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.9/2020-11-02/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
kubectl version --short --client
eksctl create cluster   --name cloudmart   --region us-east-2   --nodegroup-name standard-workers   --node-type t3.medium   --nodes 1   --with-oidc   --managed
aws eks update-kubeconfig --name cloudmart
kubectl get svc
kubectl get nodes
eksctl create iamserviceaccount   --cluster=cloudmart   --name=cloudmart-pod-execution-role   --role-name CloudMartPodExecutionRole   --attach-policy-arn=arn:aws:iam::aws:policy/AdministratorAccess  --region us-east-1   --approve
aws ecr-public get-login-password --region us-east-2 | docker login --username AWS --password-stdin public.ecr.aws/n8t4z4m3
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/n8t4z4m3
docker build -t cloudmaster-frontend .
nano Dockerfile
docker build -t cloudmart-frontend .
docker run -d -p 5001:5001 cloudmart-frontend
docker run -d -p 5000:5001 cloudmart-frontend
docker build -t cloudmart-frontend .
docker run -d -p 5001:5001 cloudmart-frontend
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/n8t4z4m3
docker build -t cloudmaster-frontend .
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/n8t4z4m3
docker build -t cloudmaster-frontend .
npm install
cd terraform-project
rm main.tfcd terraform-project
rm main.tf
nano main.tf
terraform init
terraform plan
terraform apply
sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker
sudo docker run hello-world
sudo systemctl enable docker
docker --version
sudo usermod -a -G docker $(whoami)
newgrp docker
mkdir -p challenge-day2/backend && cd challenge-day2/backend
wget https://tcb-public-events.s3.amazonaws.com/mdac/resources/day2/cloudmart-backend.zip
unzip cloudmart-backend.zip
nano .env
nano Dockerfile
docker build -t cloudmart-backend .
docker run -d -p 5000:5000 --env-file .env cloudmart-backend
nano .env
nano Dockerfile
docker build -t cloudmart-frontend .
docker run -d -p 5001:5001 cloudmart-frontend
nano .env
docker build -t cloudmart-backend .
docker run -d -p 5000:5000 --env-file .env cloudmart-backend
docker run -d -p 5001:5001 --env-file .env cloudmart-backend
lsof -i :5000
docker run -d -p 5000:5000 --env-file .env cloudmart-backend
cd ..
mkdir frontend && cd frontend
wget https://tcb-public-events.s3.amazonaws.com/mdac/resources/day2/cloudmart-frontend.zip
unzip cloudmart-frontend.zip
cd ..
mkdir frontend && cd frontend
wget https://tcb-public-events.s3.amazonaws.com/mdac/resources/day2/cloudmart-frontend.zip
unzip cloudmart-frontend.zip
sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker
sudo docker run hello-world
sudo systemctl enable docker
docker --version
sudo usermod -a -G docker $(whoami)
newgrp docker
mkdir -p challenge-day2/backend && cd challenge-day2/backend
wget https://tcb-public-events.s3.amazonaws.com/mdac/resources/day2/cloudmart-backend.zip
unzip cloudmart-backend.zip
cd /home/ec2-user
mkdir -p challenge-day2/backend
cd challenge-day2/backend
mkdir -p challenge-day2/backend && cd challenge-day2/backend
wget https://tcb-public-events.s3.amazonaws.com/mdac/resources/day2/cloudmart-backend.zip
unzip cloudmart-backend.zip
y
nano .env
nano Dockerfile
docker build -t cloudmart-backend .
docker run -d -p 5000:5000 --env-file .env cloudmart-backend
docker build -t cloudmart-backend .
docker run -d -p 8080:8080 --env-file .env cloudmart-backend
cd ..
mkdir frontend && cd frontend
wget https://tcb-public-events.s3.amazonaws.com/mdac/resources/day2/cloudmart-frontend.zip
unzip cloudmart-frontend.zip
docker build -t cloudmart-frontend .
docker run -d -p 5001:5001 cloudmart-frontend
docker run -d -p 8080:8080 cloudmart-frontend
docker run -d -p 8585:8585 cloudmart-frontend
clear
aws configure
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo cp /tmp/eksctl /usr/bin
eksctl version
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.9/2020-11-02/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
kubectl version --short --client
aws eks update-kubeconfig --name cloudmart
kubectl get svc
kubectl get nodes
eksctl create iamserviceaccount   --cluster=cloudmart   --name=cloudmart-pod-execution-role   --role-name CloudMartPodExecutionRole   --attach-policy-arn=arn:aws:iam::aws:policy/AdministratorAccess  --region us-east-1   --approve
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/n8t4z4m3
docker build -t cloudmaster-frontend .
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/n8t4z4m3
docker build -t cloudmaster-backend .
nano Dockerfile
docker build -t cloudmaster-backend .
```yaml
aws configure
```
aws configure
aws eks update-kubeconfig --name cloudmart
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/n8t4z4m3
docker tag cloudmaster-backend:latest public.ecr.aws/n8t4z4m3/cloudmaster-backend:latest
docker push public.ecr.aws/n8t4z4m3/cloudmaster-backend:latest
cd challenge-day2/backend
clea
clear
cd challenge-day2/backend
nano cloudmart-backend.yaml
kubectl apply -f cloudmart-backend.yaml
clear
kubectl get pods
kubectl get deployment
kubectl get service
cd ../challenge-day2/frontend
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/n8t4z4m3
docker build -t cloudmaster-frontend .
docker tag cloudmaster-frontend:latest public.ecr.aws/n8t4z4m3/cloudmaster-frontend:latest
docker push public.ecr.aws/n8t4z4m3/cloudmaster-frontend:latest
clear
kubectl get service 
cd ../challenge-day2/frontend
nano .env
cd ../challenge-day2/frontend
nano .env
cd
cd ../challenge-day2/frontend
cd ../challenge-day2
cd /challenge-day2
challenge-day2
cd 

cd ../challenge-day2/frontend
cd /challenge-day2/frontend
nano .env
cd ..
mkdir frontend && cd frontend
wget https://tcb-public-events.s3.amazonaws.com/mdac/resources/day2/cloudmart-frontend.zip
unzip cloudmart-frontend.zip
cd /challenge-day2/frontend
cd ..
mkdir frontend && cd frontend
wget https://tcb-public-events.s3.amazonaws.com/mdac/resources/day2/cloudmart-frontend.zip
unzip cloudmart-frontend.zip
mkdir frontend && cd frontend
cd 
cd /challenge-day2
challenge-day2
cd challenge-day2
cd ..

wget https://tcb-public-events.s3.amazonaws.com/mdac/resources/day2/cloudmart-frontend.zip
unzip cloudmart-frontend.zip
y
cd challenge-day2
cd frontend
mkdir frontend && cd frontend
cd challenge-day2/frontend
nano cloudmart-frontend.yaml
kubectl apply -f cloudmart-frontend.yaml
kubectl get pods
kubectl get deployment
kubectl get service
git status
git add -A
git commit -m "app enviada para o repo"
git push
git status
git add -A
git commit -m "app enviada para o repo"
git push
git status
git add -A
git commit -m "app enviada para o repo"
git push
git status
git add -A
git commit -m "app enviada para o repo"
git push
git status
git add -A
git commit -m "app enviada para o repo"
git push
echo "# cloudmart" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/Danilow88/cloudmart.git
git push -u origin main
git status
git add -A
git commit -m "app enviada para o repo"
git push
git commit -m "app enviada para o repo"
sudo rm -rf /tmp/*
git commit -m "app enviada para o repo"
git status
git add -A
git commit -m "app enviada para o repo"
git push
df -h
sudo journalctl --vacuum-size=100M
docker system prune -af
git status
git add -A
git add
git status
git add 
git commit -m "app enviada para o repo"
git push
git status
git add -A
git commit -m "app enviada para o repo"
git push
git status
git add -A
git commit -m "app enviada para o repo"

git status
git add -A
git commit -m "app enviada para o repo"
git push
sudo yum install git-lfs
# Inicializar LFS no repositório
git lfs install
# Rastrear arquivos grandes
git lfs track "bin/kubectl"
git lfs track "*.terraform/providers/registry.terraform.io/hashicorp/aws/5.84.0/linux_amd64/terraform-provider-aws_v5.84.0_x5"
# Adicionar arquivos rastreados
git add .gitattributes
git add bin/kubectl
git add .terraform/providers/registry.terraform.io/hashicorp/aws/5.84.0/linux_amd64/terraform-provider-aws_v5.84.0_x5
# Commitar e push
git commit -m "Add large files with Git LFS"
git push
# Remover arquivos grandes do histórico
git rm --cached bin/kubectl
git rm --cached .terraform/providers/registry.terraform.io/hashicorp/aws/5.84.0/linux_amd64/terraform-provider-aws_v5.84.0_x5
# Adicionar ao .gitignore
echo "bin/kubectl" >> .gitignore
echo ".terraform/providers/registry.terraform.io/hashicorp/aws/5.84.0/linux_amd64/terraform-provider-aws_v5.84.0_x5" >> .gitignore
# Commitar
git add .gitignore
git commit -m "Remove large files from repository"
git push
# Criar um .gitignore específico para providers
echo ".terraform/providers/" >> .gitignore
git add .gitignore
git commit -m "Ignore Terraform provider files"
git push
# Criar um .gitignore específico para providers
echo ".terraform/providers/" >> .gitignore
git add .gitignore
git commit -m "Ignore Terraform provider files"
git push
# Remover arquivos grandes do histórico
git filter-branch --force --index-filter   "git rm -rf --cached --ignore-unmatch terraform-project/.terraform/providers/registry.terraform.io/hashicorp/aws/5.84.0/linux_amd64/terraform-provider-aws_v5.84.0_x5"   --prune-empty --tag-name-filter cat -- --all
# Forçar push

# Forçar push# Antes de commitar, limpe os providers
terraform init -upgrade
rm -rf .terraform/providers
git status
git add -A
git commit -m "app enviada para o repo"
git push
# Remover arquivos grandes do histórico
git filter-branch --force --index-filter   "git rm -rf --cached --ignore-unmatch terraform-project/.terraform/providers/registry.terraform.io/hashicorp/aws/5.84.0/linux_amd64/terraform-provider-aws_v5.84.0_x5"   --prune-empty --tag-name-filter cat -- --all
# Forçar push
git push origin --force
.gitignore
.terraform/
.gitignore
# Instalar Git LFS
sudo yum install git-lfs
# Inicializar LFS no repositório
git lfs install
# Rastrear arquivos grandes
git lfs track "bin/kubectl"
git lfs track "*.terraform/providers/registry.terraform.io/hashicorp/aws/5.84.0/linux_amd64/terraform-provider-aws_v5.84.0_x5"
# Adicionar arquivos rastreados
git add .gitattributes
git add bin/kubectl
git add .terraform/providers/registry.terraform.io/hashicorp/aws/5.84.0/linux_amd64/terraform-provider-aws_v5.84.0_x5
# Commitar e push
git commit -m "Add large files with Git LFS"
git push
# Remover arquivos grandes do histórico
git rm --cached bin/kubectl
git rm --cached .terraform/providers/registry.terraform.io/hashicorp/aws/5.84.0/linux_amd64/terraform-provider-aws_v5.84.0_x5
# Adicionar ao .gitignore
echo "bin/kubectl" >> .gitignore
echo ".terraform/providers/registry.terraform.io/hashicorp/aws/5.84.0/linux_amd64/terraform-provider-aws_v5.84.0_x5" >> .gitignore
# Commitar
git add .gitignore
git commit -m "Remove large files from repository"
git push
# Remover arquivos grandes do histórico
git rm --cached bin/kubectl
git rm --cached .terraform/providers/registry.terraform.io/hashicorp/aws/5.84.0/linux_amd64/terraform-provider-aws_v5.84.0_x5
# Adicionar ao .gitignore
echo "bin/kubectl" >> .gitignore
echo ".terraform/providers/registry.terraform.io/hashicorp/aws/5.84.0/linux_amd64/terraform-provider-aws_v5.84.0_x5" >> .gitignore
# Commitar
git add .gitignore
git commit -m "Remove large files from repository"
git push
# Create/edit .gitignore
cat >> .gitignore << 'EOF'
# Terraform files
**/.terraform/*
**/terraform-provider-aws*

# Kubectl binary
**/kubectl

# Crash log files
crash.log
EOF

# Remove kubectl from git tracking
git rm --cached challenge-day2/backend/challenge-day2/kubectl
# Remove terraform providers
git rm --cached -r terraform-project/*/.terraform/
echo "challenge-day2/backend/challenge-day2/kubectl" >> .gitignore
git add .gitignore
git commit -m "Remove kubectl from tracking and add it to .gitignore"
git add .gitignore
git commit -m "Remove kubectl from tracking and add it to .gitignore"
git push origin main
sudo apt-get install git-lfs
git lfs install
git lfs track "terraform-project/*/.terraform/**/*"
git add .gitattributes
bfg --delete-files terraform-provider-aws_v5.84.0_x5
git filter-branch --force --index-filter "git rm --cached --ignore-unmatch terraform-project/terraform-project/terraform-project/terraform-project/.terraform/providers/registry.terraform.io/hashicorp/aws/5.84.0/linux_amd64/terraform-provider-aws_v5.84.0_x5" --prune-empty --tag-name-filter cat -- --all
git push origin --force --all
git commit -m "Track Terraform provider files with LFS"
git push origin main
git commit -m "Track Terraform provider files with LFS"
git push origin main
git lfs track
git lfs track "terraform-project/*/.terraform/**/*"
git lfs track "challenge-day2/backend/challenge-day2/kubectl"
git add .gitattributes
bfg --delete-files "kubectl"
bfg --delete-files "terraform-provider-aws_v5.84.0_x5"
git clone --mirror
sudo yum update -y
sudo yum install -y java-11-openjdk
clear
wget https://repo1.maven.org/maven2/com/madgag/bfg/1.14.0/bfg-1.14.0.jar -O /home/ec2-user/bfg.jar
wget https://repo1.maven.org/maven2/com/madgag/bfg/1.14.0/bfg-1.14.0.jar -O /home/ec2-user/bfg.jawget https://repo1.maven.org/maven2/com/madgag/bfg/1.14.0/bfg-1.14.0.jar -O /home/ec2-user/bfg.jar
ls -l /home/ec2-user/bfg.jar
git lfs track
git lfs track "terraform-project/*/.terraform/**/*"
git lfs track "challenge-day2/backend/challenge-day2/kubectl"
git lfs track "terraform-project/*/.terraform/**/*"
git lfs track "challenge-day2/backend/challenge-day2/kubectl"
git add .gitattributes
bfg --delete-files "kubectl"
bfg --delete-files "terraform-provider-aws_v5.84.0_x5"
java -jar /home/ec2-user/bfg.jar --delete-files "kubectl"
sudo yum install -y java-11-openjdk
sudo yum install -y java-1.8.0-openjdk
sudo yum install -y java-openjdk
java -version
sudo yum install -y java-11-amazon-corretto
java
java -jar /home/ec2-user/bfg.jar --delete-files "kubectl"
git reflog expire --expire=now --all=now
git gc --prune=now --aggressive
git push origin --force --all
git push origin --force --tags
java -jar /home/ec2-user/bfg.jar --delete-files "terraform-provider-aws_v5.84.0_x5"
java -jar /home/ec2-user/bfg.jar --delete-files "kubectl"
git push origin --force --all
git push origin --force --tags
git status
git add -A
git commit -m "app enviada para o repo"
git push
git add .gitignore
git commit -m "Atualizar o arquivo .gitignore para ignorar arquivos grandes"
git push origin master
git add .gitignore
git commit -m "Atualizar o arquivo .gitignore para ignorar arquivos grandes"
git push origin master
git reset --soft HEAD~1 O --soft
git reset --soft HEAD~1
git reset --soft HEAD~11
git reset --soft HEAD~1
git commit -m "Atualizar o arquivo .gitignore para ignorar arquivos grandes"

"
""
clear
# Create/edit .gitignore
cat >> .gitignore << 'EOF'
# Terraform files
**/.terraform/*
**/terraform-provider-aws*

# Kubectl binary
**/kubectl

# Crash log files
crash.log
EOF

# Remove kubectl from git tracking
git rm --cached challenge-day2/backend/challenge-day2/kubectl
# Remove terraform providers
git rm --cached -r terraform-project/*/.terraform/
git add .gitignore
git commit -m "Update .gitignore for large files"
git filter-branch --force --index-filter   'git rm --cached --ignore-unmatch challenge-day2/backend/challenge-day2/kubectl terraform-project/*/.terraform/providers/registry.terraform.io/hashicorp/aws/5.84.0/linux_amd64/terraform-provider-aws_v5.84.0_x5'   --prune-empty --tag-name-filter cat -- --all
git push origin main --force
sudo yum install git-lfs
git lfs install
sudo curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.rpm.sh | sudo bash
sudo yum install git-lfs
git lfs install
git add .gitattributes
git commit -m "Adicionar suporte ao LFS para arquivos grandes"
git commit -m "Adicionar suporte ao LFS para arquivos grandes" git opush
git commit -m "Adicionar suporte ao LFS para arquivos grandes" git push
git commit -m "Adicionar suporte ao LFS para arquivos grandes" git -a
git status
git add -A
git commit -m "app enviada para o repo"
git push
git -m
git status
git reset --soft
git status
git reset --soft HEAD~12
git status
git lfs install
git status
git add -A
git commit -m "app enviada para o repo"
git push
git reset --soft HEAD~1
git push origin main
git lfs install
git lfs track "*.zip"
git lfs track "*.mp4"
git lfs track
git lfs track -a
git lfs track
git add -A
git commit -m "app enviada para o repo"
git push origin main
git reset --soft HEAD~2
git reset --soft HEAD~1
# 1. Inicialize o Git LFS no repositório (se ainda não fez)
git lfs install
# 2. Rastreie os tipos de arquivos grandes que você deseja gerenciar com LFS
git lfs track "*.zip"                  # Rastreia arquivos .zip
git lfs track "*.mp4"                  # Rastreia arquivos .mp4
git lfs track "*.tar"                  # Rastreia arquivos .tar
git lfs track "terraform-project/terraform-project/terraform-project/terraform-project/.terraform/providers/registry.terraform.io/hashicorp/aws/*"  # Rastreia o arquivo do Terraform
# 3. Remova os arquivos grandes do staging, caso já estejam lá (isso faz com que o LFS os gerencie corretamente)
git rm --cached terraform-project/terraform-project/terraform-project/terraform-project/.terraform/providers/registry.terraform.io/hashicorp/aws/5.84.0/linux_amd64/terraform-provider-aws_v5.84.0_x5
git rm --cached kubectl
# 4. Adicione o arquivo .gitattributes (que o LFS gerou) e os arquivos grandes novamente ao staging
git add .gitattributes
git add terraform-project/terraform-project/terraform-project/terraform-project/.terraform/providers/registry.terraform.io/hashicorp/aws/5.84.0/linux_amd64/terraform-provider-aws_v5.84.0_x5
git add kubectl
# 5. Comite as mudanças
git commit -m "Adicionando arquivos grandes ao Git LFS"
# 6. Se os arquivos já estiverem no histórico do Git e você precisar removê-los, use o BFG Repo-Cleaner (se necessário)
# Se não tiver o BFG, instale ou faça o download de https://rtyley.github.io/bfg-repo-cleaner/
# Caso já tenha o BFG, execute os seguintes comandos:
# Limpar arquivos grandes do histórico do Git (use o caminho e nome correto dos arquivos)
bfg --delete-files 'kubectl' your-repo.git
bfg --strip-blobs-bigger-than 50M your-repo.git
# Após usar o BFG, execute os seguintes comandos para limpar o histórico local
git reflog expire --expire=now --all
git gc --prune=now --aggressive
# 7. Envie as mudanças para o repositório remoto
git push origin main
# 8. Se o repositório remoto já contiver arquivos grandes e o erro persistir, faça o push forçado para atualizar o histórico
# Atenção: O "push --force" sobrescreverá o histórico do repositório remoto, então use com cuidado
git push --force origin main
clear
# 1. Inicialize o Git LFS no repositório (se ainda não fez)
git lfs install
# 2. Rastreie os tipos de arquivos grandes que você deseja gerenciar com LFS
git lfs track "*.zip"                  # Rastreia arquivos .zip
git lfs track "*.mp4"                  # Rastreia arquivos .mp4
git lfs track "*.tar"                  # Rastreia arquivos .tar
git lfs track "terraform-project/terraform-project/terraform-project/terraform-project/.terraform/providers/registry.terraform.io/hashicorp/aws/*"  # Rastreia o arquivo do Terraform
# 3. Remova os arquivos grandes do staging, caso já estejam lá (isso faz com que o LFS os gerencie corretamente)
git rm --cached terraform-project/terraform-project/terraform-project/terraform-project/.terraform/providers/registry.terraform.io/hashicorp/aws/5.84.0/linux_amd64/terraform-provider-aws_v5.84.0_x5
git rm --cached kubectl
# 4. Adicione o arquivo .gitattributes (que o LFS gerou) e os arquivos grandes novamente ao staging
git add .gitattributes
git add terraform-project/terraform-project/terraform-project/terraform-project/.terraform/providers/registry.terraform.io/hashicorp/aws/5.84.0/linux_amd64/terraform-provider-aws_v5.84.0_x5
git add kubectl
# 5. Comite as mudanças
git commit -m "Adicionando arquivos grandes ao Git LFS"
# 6. Se os arquivos já estiverem no histórico do Git e você precisar removê-los, use o BFG Repo-Cleaner (se necessário)
# Se não tiver o BFG, instale ou faça o download de https://rtyley.github.io/bfg-repo-cleaner/
# Caso já tenha o BFG, execute os seguintes comandos:
# Limpar arquivos grandes do histórico do Git (use o caminho e nome correto dos arquivos)
bfg --delete-files 'kubectl' your-repo.git
bfg --strip-blobs-bigger-than 50M your-repo.git
# Após usar o BFG, execute os seguintes comandos para limpar o histórico local
git reflog expire --expire=now --all
git gc --prune=now --aggressive
# 7. Envie as mudanças para o repositório remoto
git push origin main
# 8. Se o repositório remoto já contiver arquivos grandes e o erro persistir, faça o push forçado para atualizar o histórico
# Atenção: O "push --force" sobrescreverá o histórico do repositório remoto, então use com cuidado
git push --force origin main
git reset --soft HEAD~1
# 1. Inicialize o Git LFS no repositório (se ainda não fez)
git lfs install
# 2. Rastreie os tipos de arquivos grandes que você deseja gerenciar com LFS
git lfs track "*.zip"                  # Rastreia arquivos .zip
git lfs track "*.mp4"                  # Rastreia arquivos .mp4
git lfs track "*.tar"                  # Rastreia arquivos .tar
git lfs track "terraform-project/terraform-project/terraform-project/terraform-project/.terraform/providers/registry.terraform.io/hashicorp/aws/*"  # Rastreia o arquivo do Terraform
# 3. Remova os arquivos grandes do staging, caso já estejam lá (isso faz com que o LFS os gerencie corretamente)
git rm --cached terraform-project/terraform-project/terraform-project/terraform-project/.terraform/providers/registry.terraform.io/hashicorp/aws/5.84.0/linux_amd64/terraform-provider-aws_v5.84.0_x5
git rm --cached kubectl
# 4. Adicione o arquivo .gitattributes (que o LFS gerou) e os arquivos grandes novamente ao staging
git add .gitattributes
git add terraform-project/terraform-project/terraform-project/terraform-project/.terraform/providers/registry.terraform.io/hashicorp/aws/5.84.0/linux_amd64/terraform-provider-aws_v5.84.0_x5
git add kubectl
# 5. Comite as mudanças
git commit -m "Adicionando arquivos grandes ao Git LFS"
# 6. Se os arquivos já estiverem no histórico do Git e você precisar removê-los, use o BFG Repo-Cleaner (se necessário)
# Se não tiver o BFG, instale ou faça o download de https://rtyley.github.io/bfg-repo-cleaner/
# Caso já tenha o BFG, execute os seguintes comandos:
# Limpar arquivos grandes do histórico do Git (use o caminho e nome correto dos arquivos)
bfg --delete-files 'kubectl' your-repo.git
bfg --strip-blobs-bigger-than 50M your-repo.git
# Após usar o BFG, execute os seguintes comandos para limpar o histórico local
git reflog expire --expire=now --all
git gc --prune=now --aggressive
# 7. Envie as mudanças para o repositório remoto
git push origin main
# 8. Se o repositório remoto já contiver arquivos grandes e o erro persistir, faça o push forçado para atualizar o histórico
# Atenção: O "push --force" sobrescreverá o histórico do repositório remoto, então use com cuidado
git push --force origin main
<<<<<<< HEAD
=======

git commit -m "replaced image uri with CONTAINER_IMAGE"
git push
git add -A
git commit -m "alternado para Main Products"
git push
kubectl
clear
kubectl
git reset --soft HEAD~1
git add -A
git commit -m "replaced image uri with CONTAINER_IMAGE"
git push
git add -A
git commit -m "replaced image uri with CONTAINER_IMAGE"
git push
git add -A
git push
>>>>>>> 1330a79 (Minha mensagem de commit)
git add -A
git commit -m "replaced image uri with CONTAINER_IMAGE"
git push
nano cloudmart-frontend.yaml
cd frontend
nano cloudmart-frontend.yaml
cd
cd challengeday2
cd challengeday-2
cd challenge
cc
cd
cd challenge-day2
challenge-day2
cd
cd challenge-day2/frontend
nano cloudmart-frontend.yaml
git add -A
git commit -m "replaced image uri with CONTAINER_IMAGE"
git push
git pull
git reset --soft HEAD~3
git reset --soft HEAD~1
git reset --soft HEAD~5
git reset --soft HEAD~1

nano cloudmart-frontend.yaml
git -a
cat cloudmart-frontent.yml
cat cloudmart-frontent.yaml
cat cloudmart-frontend.yaml
clear
git -a
git ADD -a
git add -A
git commit -m "replaced image uri with CONTAINER_IMAGE"
git push
git status
git reset --soft HEAD~4
git reset --soft HEAD~2
git reset --soft HEAD~1
git pull origin main
git checkout main
git pull origin main
git add .
git commit -m "Minha mensagem de commit"
git pull origin main

git config pull.rebase fals
git stash
git pull origin main
git stash pop
git add .
git commit -m "Resolvendo conflitos após stash"
git push origin main
git checkout -- .bash_history challenge-day2/frontend/cloudmart-frontend.yaml
git pull origin main
git pull --rebase)
git pull --rebase
git add/rm <conflicted_files>git rebase --continue
git add/rm <conflicted_files>

git rebase --continue
git add challenge-day2/frontend/cloudmart-frontend.yaml
cd
git add challenge-day2/frontend/cloudmart-frontend.yaml
git commit
git add/rm cloudmart-frontend.yaml

git add/rm
git checkout main
 git fetch origin
git merge feature-branch
git status
.bash_history
git add cloudmart-fronend.yaml
git add chalange-day2/frontend/cloudmart-fronend.yaml
git add .bash_history
git rebase --continue
git status
git push origin main
nano cloudmart-frontend.yaml
cd ‎challenge-day2/frontend
cd ‎challenge-day2/frontend/
cd
cd ‎challenge-day2/frontend/
cd ‎challenge-day2/frontend
cd ‎challenge-day2
cd
cd frontend
nano cloudmart-frontend.yaml
cd
nano cd ‎challenge-day2/frontend/cloudmart-frontend.yaml
cd ‎challenge-day2/frontend

cd challenge-day2/backend/challenge-day2
cd challenge-day2/backend
cd challenge-day2
cd backend
cd
cd fronted
cd ../frontend
cd /frontend
cd frontend
nano ‎challenge-day2/frontend/cloudmart-frontend.yaml
