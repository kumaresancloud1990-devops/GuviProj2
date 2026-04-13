# 🚀 Trend Application Deployment using CI/CD (DevOps Project)

## 📌 Project Overview

This project demonstrates a complete **CI/CD pipeline** to deploy a React application into a production-ready Kubernetes environment using modern DevOps tools.

The pipeline automates:

* Build
* Dockerization
* Image push
* Deployment to Kubernetes (EKS)

---

## 🛠️ Tech Stack

* Frontend: React
* CI/CD: Jenkins
* Containerization: Docker
* Container Registry: DockerHub
* Infrastructure: Terraform
* Orchestration: Kubernetes (AWS EKS)
* Monitoring: Prometheus + Grafana
* Version Control: GitHub

---

## 📂 Repository

GitHub Repo:
https://github.com/kumaresancloud1990-devops/GuviProj2

---

## ⚙️ Project Architecture

GitHub → Jenkins → Docker → DockerHub → AWS EKS → Kubernetes → Grafana Monitoring

---

## 🔄 CI/CD Pipeline Flow

1. Developer pushes code to GitHub
2. GitHub Webhook triggers Jenkins pipeline
3. Jenkins:

   * Clones repository
   * Builds Docker image
   * Pushes image to DockerHub
   * Deploys to Kubernetes (EKS)
4. Application exposed via LoadBalancer
5. Monitoring via Grafana dashboard

---

## 🐳 Docker Setup

### Build Image

```bash
docker build -t kumaresankarana/trend-app .
```

### Run Container

```bash
docker run -d -p 3000:3000 kumaresankarana/trend-app
```

---

## ☁️ Terraform Setup

### Initialize Terraform

```bash
terraform init
```

### Apply Infrastructure

```bash
terraform apply
```

Resources Created:

* VPC
* Subnets
* EC2 (Jenkins)
* IAM Roles
* Security Groups

---

## ☸️ Kubernetes Deployment

### Apply Deployment

```bash
kubectl apply -f deployment.yaml
```

### Apply Service

```bash
kubectl apply -f service.yaml
```

---

## 🔗 Access Application

```bash
kubectl get svc
```

Open:

```
http://<EXTERNAL-IP>
```

---

## 🔄 Jenkins Pipeline

### Pipeline Stages:

* Clone
* Build Docker Image
* Push to DockerHub
* Deploy to Kubernetes

---

## 🔔 GitHub Webhook

Configured webhook to trigger Jenkins automatically on every commit.

---

## 📊 Monitoring Setup

Monitoring implemented using:

* Prometheus
* Grafana

### Access Grafana

```bash
kubectl get svc monitoring-grafana
```

Open:

```
http://<EXTERNAL-IP>
```

---

## 🔐 Grafana Credentials

```bash
kubectl get secret monitoring-grafana -o jsonpath="{.data.admin-password}" | base64 --decode
```

---

## 📸 Screenshots (Add Here)

* Jenkins Pipeline Success
* DockerHub Image
* EKS Nodes
* Application Output
* Grafana Dashboard

---

## 🧠 Key Learnings

* End-to-end CI/CD pipeline implementation
* Kubernetes deployment automation
* AWS EKS cluster setup
* Docker image lifecycle management
* Monitoring using Prometheus & Grafana

---

## 👨‍💻 Author

Kumaresan Vijayakumar
.
