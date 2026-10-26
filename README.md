# Desafio DevOps - Arquitetura de Aplicação .NET Core em AWS

Este repositório contém a infraestrutura como código (IaC via Terraform) e a esteira de CI/CD (Bitbucket Pipelines) para implantar uma aplicação .NET Core em arquitetura híbrida (AWS ECS Fargate e EC2 Linux).

## Estrutura da Solução
* **IaC (`main.tf`):** Provisiona VPC com subnets públicas e privadas, Security Groups, ECR, AWS WAF v2 com regras OWASP Top 10, Application Load Balancer (ALB), ECS Fargate com Target Tracking Auto Scaling e instância EC2 em subnet privada.
* **Aplicação (`AppDevOps/`):** API em .NET Core exposta na porta 5000 com o endpoint `/api/status` retornando `Healthy`.
* **Contêiner (`Dockerfile`):** Build multi-stage otimizado em imagem base ASP.NET Core 8.0.
* **CI/CD (`bitbucket-pipelines.yml`):** Realiza restauração, build, envio da imagem para o AWS ECR e atualização do serviço no ECS Fargate.

## Execução Local (WSL)
1. Build e Execução da API: `cd AppDevOps && dotnet run`
2. Validação da Rota: `curl http://localhost:5000/api/status`
3. Validação do Terraform: `terraform init && terraform validate`
