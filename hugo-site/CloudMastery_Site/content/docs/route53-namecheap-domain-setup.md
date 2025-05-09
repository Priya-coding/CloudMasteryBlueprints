---
title: "Custom Domain Setup with Route 53 and Namecheap"
link title: "Custom Domain Setup with Route 53 and Namecheap"
weight: 2
menu:
  main:
    parent: "Documents"
    weight: 2
description: "Step-by-step guide to map a Namecheap domain to an AWS EC2 instance using Route 53 for free."
draft: false
---
# 🌐 Custom Domain Setup: Route 53 + Namecheap

This guide documents how we configured our custom domain `cloudmom-stack.site`, purchased from Namecheap, to route to an EC2 instance running a Docker-based Hugo site — all using **AWS Route 53** and **Terraform**, at **zero cost on AWS**.

---

## Goal

> Route `cloudmom-stack.site` → AWS EC2 Elastic IP using Route 53 DNS records.

---

## Prerequisites

- AWS Free Tier account
- Domain registered via [Namecheap](https://namecheap.com)
- Elastic IP associated with a running EC2 instance
- Terraform installed and initialized
- Hugo + NGINX Docker container deployed on EC2

---

## Step 1: Allocate an Elastic IP (Free)

> AWS Console → EC2 → **Elastic IPs → Allocate Elastic IP**

- Choose **Amazon’s pool of IPv4 addresses**
- Click **Allocate**
- Then click **Actions → Associate Elastic IP** → attach to your running EC2 instance

Elastic IP is free as long as it's attached to a running EC2 instance.

---

## Step 2: Create Route 53 Hosted Zone via Terraform

File: `infrastructure/terraform/modules/route53/main.tf`

```hcl
resource "aws_route53_zone" "main" {
  name = var.domain_name
}

resource "aws_route53_record" "root" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "A"
  ttl     = 300
  records = [var.ec2_elastic_ip]
}