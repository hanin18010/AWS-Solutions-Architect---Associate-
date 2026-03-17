# Deployment Steps - Scalable Web Application on AWS

## Overview

This document explains the step-by-step deployment of a scalable web application using:

* EC2
* Application Load Balancer (ALB)
* Auto Scaling Group (ASG)
* CloudWatch & SNS

---

## Step 1: Create VPC

1. Go to AWS Console → VPC

2. Create a new VPC:

   * CIDR block: `10.0.0.0/16`

3. Create 2 Public Subnets:

   * Subnet 1: `10.0.1.0/24`
   * Subnet 2: `10.0.2.0/24`

4. Create and attach an Internet Gateway

5. Update Route Table:

   * Add route: `0.0.0.0/0 → Internet Gateway`

---

## Step 2: Create Security Group

Create a Security Group with the following rules:

### Inbound Rules:

* HTTP (80) → Anywhere (0.0.0.0/0)
* SSH (22) → Your IP

---

## Step 3: Create Launch Template

1. Go to EC2 → Launch Templates → Create Launch Template

2. Configure:

   * AMI: Ubuntu
   * Instance Type: t2.micro
   * Key Pair: Select your key
   * Security Group: Select the created SG

3. Add User Data Script:

```bash
#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
echo "<h1>Welcome to Scalable AWS Web App</h1>" > /var/www/html/index.html
systemctl start nginx
systemctl enable nginx
```

---

## Step 4: Create Target Group

1. Go to EC2 → Target Groups → Create Target Group

2. Configuration:

   * Target type: Instances
   * Protocol: HTTP
   * Port: 80

3. Health Check:

   * Path: `/`

---

## Step 5: Create Application Load Balancer

1. Go to EC2 → Load Balancers → Create Load Balancer

2. Choose:

   * Type: Application Load Balancer
   * Scheme: Internet-facing

3. Configure:

   * Select 2 Public Subnets
   * Attach Security Group (allow HTTP)

4. Listener:

   * HTTP (Port 80)
   * Forward to Target Group

---

## Step 6: Create Auto Scaling Group

1. Go to EC2 → Auto Scaling Groups → Create

2. Choose Launch Template created earlier

3. Configure:

   * Select VPC and Public Subnets
   * Attach to Target Group

4. Set Capacity:

   * Desired: 2
   * Min: 2
   * Max: 4

---

## Step 7: Configure Scaling Policy

1. Add Scaling Policy:

   * Type: Target Tracking

2. Metric:

   * CPU Utilization

3. Configuration:

   * Target value: 70%

---

## Step 8: Test the Application

1. Copy the DNS of the Load Balancer
2. Open it in your browser

You should see:

```
Welcome to Scalable AWS Web App
```

---

## Step 9: Setup CloudWatch Alarm

1. Go to CloudWatch → Alarms → Create Alarm

2. Choose metric:

   * EC2 → CPU Utilization

3. Set condition:

   * Threshold: > 80%

---

## Step 10: Setup SNS Notification

1. Create SNS Topic
2. Subscribe your Email
3. Attach SNS to CloudWatch Alarm

---

## Step 11: Validation

* Increase traffic to trigger Auto Scaling
* Verify new EC2 instances are launched
* Check Load Balancer distributes traffic

---

## Final Result

* Highly available application
* Automatic scaling based on demand
* Load-balanced traffic across instances
* Monitoring and alerting enabled

---

## Optional Improvements

* Add Amazon RDS database
* Use HTTPS with ACM
* Add CloudFront CDN
* Implement CI/CD pipeline
