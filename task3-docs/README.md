
# Windows Server VM Migration to AWS EC2

## Overview
This document provides step-by-step instructions to migrate a Windows Server VM hosting an ASP.NET application from a local VirtualBox environment to an AWS EC2 instance.

---

## **Step 1: Create an IAM User in AWS**
- Log in to the **AWS Console** and navigate to **IAM (Identity & Access Management)**.
- Create a new **IAM User** with full access permissions.
- Generate **Access Key ID** and **Secret Access Key**.
- Store the credentials securely.

---

## **Step 2: Create an S3 Bucket**
- Navigate to **S3 Service** in the AWS Console.
- Create a new **S3 bucket** to store the files during migration.
- Enable appropriate permissions for access.

---

## **Step 3: Configure AWS CLI on Source VM (VirtualBox)**
- Install **AWS CLI v2** on the VirtualBox VM.
- Open PowerShell and configure AWS credentials:
  ```sh
  aws configure

  Enter Access Key ID, Secret Access Key, and AWS Region.

  Step 4: Transfer Application Files to S3
- Upload configuration and application files to S3:
   aws s3 cp C:\inetpub\wwwroot\MyApp s3://my-migration-bucket/MyApp --recursive
-Verify that the files are uploaded via the AWS S3 Console.

Step 5: Connect to AWS EC2 Instance

Navigate to the AWS EC2 Console and locate the deployed instance.
Select the instance, and download the RDP file.
Decrypt the administrator password using the .pem key stored in AWS secret manager.
Use Remote Desktop (RDP) to connect to the EC2 instance.

Step 6: Configure AWS CLI on AWS EC2
Install AWS CLI v2 on the EC2 instance.
Open PowerShell and configure AWS credentials:

   aws configure

Transfer files from S3 to the EC2 instance:

  aws s3 cp s3://my-migration-bucket/MyApp C:\inetpub\wwwroot\MyApp --recursive

Step 7: Install IIS on AWS EC2

Open PowerShell and install IIS:
Install-WindowsFeature -name Web-Server -IncludeManagementTools

Install ASP.NET 4.5 support:
Install-WindowsFeature -name Web-Asp-Net45

Restart IIS:
iisreset


Step 8: Install .NET Core Hosting Bundle & SDK
Download and install the .NET Core Hosting Bundle from Microsoft’s .NET website.
Install additional ASP.NET dependencies if required.
📌 Note: Steps 7 and 8 can be automated using a PowerShell script.

Step 9: Configure IIS to Host the .NET Application
Open IIS Manager (inetmgr).
Right-click Sites → Add Website.
Enter:
Site Name: MyApp
Physical Path: C:\inetpub\wwwroot\MyApp
Binding: http, Port 80
Click OK and Start the Site.
Step 10: Verify Application Deployment
Open a browser on the EC2 instance.
Access the site using:
http://localhost

Ensure the application loads correctly.


