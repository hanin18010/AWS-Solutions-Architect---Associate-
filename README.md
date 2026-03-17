# AWS-Solutions-Architect---Associate-
# Scalable Web Application on AWS using ALB and Auto Scaling

## Project Overview

This project demonstrates how to deploy a **scalable and highly available web application on AWS** using EC2 instances, Application Load Balancer, and Auto Scaling Group.

The system automatically distributes traffic and scales instances based on demand.

---

## Architecture

The solution uses the following architecture:

User → Internet → Application Load Balancer → Auto Scaling Group → EC2 Instances → (Optional) Amazon RDS

The Application Load Balancer distributes incoming traffic across multiple EC2 instances, ensuring high availability and fault tolerance.

---

## AWS Services Used

* Amazon EC2
* Application Load Balancer (ALB)
* Auto Scaling Group (ASG)
* Amazon RDS (Optional)
* IAM Roles
* Amazon CloudWatch
* Amazon SNS

---

## Key Features

* High Availability
* Automatic Scaling
* Load Balancing
* Monitoring and Alerts
* Secure IAM Access

---

## Architecture Diagram

architecture-diagram.png

---

## Deployment Steps

1. Create a VPC with public subnets.
2. Launch an EC2 instance and install a web server.
3. Create a Launch Template.
4. Create an Auto Scaling Group.
5. Create an Application Load Balancer.
6. Attach the Target Group to the Auto Scaling Group.
7. Configure Scaling Policies.
8. Monitor instances using CloudWatch.

---

## Example Web Server Setup

Install Nginx on EC2:

```bash
sudo apt update
sudo apt install nginx -y
```

Create a simple web page:

```bash
echo "Hello from Auto Scaling EC2 Instance" > /var/www/html/index.html
```

---

## Auto Scaling Policy Example

Scale Out:
CPU Utilization > 70%

Scale In:
CPU Utilization < 30%

---

## Monitoring

CloudWatch monitors:

* CPU Utilization
* Network Traffic
* Instance Health

SNS sends alerts via email when thresholds are reached.

---

## Future Improvements

* Use Terraform or CloudFormation
* Add CI/CD Pipeline
* Use CloudFront CDN
* Add AWS WAF for security

---

## Screenshots

Add screenshots of:

* EC2 Instances
* Load Balancer
* Auto Scaling Group
* CloudWatch Metrics
