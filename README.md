# MERN_Application_Terraform
Deploying a MERN Application on GCP using Terraform and Ansible.
## Objective:
Gain practical experience in deploying a MERN stack application on AWS using infrastructure automation with Terraform and configuration management with Ansible.
## Prerequisites:
Fork the MERN Application from https://github.com/UnpredictablePrashant/TravelMemory
### Part 1: Infrastructure Setup with Terraform

1. GCP Setup and Terraform Initialization:

   - Configure GCP CLI SDK and authenticate with your GCP account.
   
      https://cloud.google.com/sdk/docs/initializing

   - Initialize a new Terraform project targeting GCP.

2. VPC and Network Configuration:

   - Create an GCP VPC with two subnets: one public and one private.

![Screenshot (151)](https://github.com/TeamKanyarasi/MERN_Application_Terraform/assets/139607786/f36de8f9-3089-4968-9348-23755c2321e9)

![Screenshot (153)](https://github.com/TeamKanyarasi/MERN_Application_Terraform/assets/139607786/6b493804-3be7-4ce3-b6ff-42b3ffd2ec38)

   - Set up an Internet Gateway and a NAT Gateway.

![Screenshot (154)](https://github.com/TeamKanyarasi/MERN_Application_Terraform/assets/139607786/5c802980-7c9b-422b-ab22-a70a67d7db74)

   - Configure route tables for both subnets.

![Screenshot (152)](https://github.com/TeamKanyarasi/MERN_Application_Terraform/assets/139607786/54a73e9f-c723-4e53-aefb-43c710911a54)

3. EC2 Instance Provisioning:

   - Launch two EC2 instances: one in the public subnet (for the web server) and another in the private subnet (for the database).

![Screenshot (150)](https://github.com/TeamKanyarasi/MERN_Application_Terraform/assets/139607786/448809c5-63b9-4c94-a593-2cac731a6248)

   - Ensure both instances are accessible via SSH (public instance only accessible from your IP).

4. Security Groups and IAM Roles:

   - Create necessary security groups for web and database servers.

   - Set up IAM roles for EC2 instances with required permissions.

5. Resource Output:

   - Output the public IP of the web server EC2 instance.
  
![Screenshot (155)](https://github.com/TeamKanyarasi/MERN_Application_Terraform/assets/139607786/8cb8bbad-da52-4d85-b3fe-3ced1c0d3ccf)

![Screenshot (156)](https://github.com/TeamKanyarasi/MERN_Application_Terraform/assets/139607786/3c145138-36f5-40fc-ad62-f54ab3d4753a)

### Part 2: Configuration and Deployment with Ansible

1. Ansible Configuration:

   - Configure Ansible to communicate with the AWS EC2 instances.

2. Web Server Setup:

   - Write an Ansible playbook to install Node.js and NPM on the web server.

   - Clone the MERN application repository and install dependencies.

3. Database Server Setup:

   - Install and configure MongoDB on the database server using Ansible.

   - Secure the MongoDB instance and create necessary users and databases.

4. Application Deployment:

   - Configure environment variables and start the Node.js application.

   - Ensure the React frontend communicates with the Express backend.

5. Security Hardening:

   - Harden the security by configuring firewalls and security groups.

   - Implement additional security measures as needed (e.g., SSH key pairs, disabling root login).
