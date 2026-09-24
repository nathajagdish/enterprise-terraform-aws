# Enterprise AWS Infrastructure — Terraform

## Overview
Deploys a production-ready AWS VPC with public/private subnets, bastion host, and application server using Terraform.

## Architecture
- **VPC:** 10.0.0.0/16
- **Public Subnets:** 10.0.1.0/24, 10.0.2.0/24
- **Private Subnets:** 10.0.11.0/24, 10.0.12.0/24
- **Region:** ap-southeast-2 (Sydney)

## Components
- VPC + Internet Gateway
- 2 Public Subnets + 2 Private Subnets
- Public & Private Route Tables
- Bastion Security Group (SSH from anywhere)
- Private Security Group (SSH from bastion only)
- Bastion Host (t3.micro)
- Application Server (t3.micro, private)

## Prerequisites
- AWS free tier account
- Terraform 1.6+
- AWS CLI configured

## Deployment
```bash
terraform init
terraform plan
terraform apply -auto-approve
