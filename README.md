# Spin Up a VM on Google Cloud with Terraform

This repository contains all the Terraform code and configuration files used in the [Medium tutorial](https://medium.com/your-article-link) to spin up a virtual machine (VM) on Google Cloud Platform (GCP).

> Perfect for beginners looking to get hands-on with Terraform and GCP infrastructure.

---

## Prerequisites

Before you get started, ensure you have the following installed:

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- A [Google Cloud Platform](https://cloud.google.com/) account
- A text editor like [VS Code](https://code.visualstudio.com/)
- Git (optional)

---

## Folder Structure

terraform-project/
├── main.tf
├── variables.tf
├── terraform.tfvars
├── .gitignore
└── service-account/
└── your-service-account-key.json


---

## Setup & Authentication  

To allow Terraform to interact with GCP, you need to set up authentication using a Service Account.

Service account: It is a special type of account which is not associated with any particular user. It is used by applications, scripts, tools (Terraform, Ansible etc) or CICD tools to authenticate to google cloud services.  


1. **Create a Service Account in GCP**
2. **Download the JSON key**
3. **Move it to** `service-account/your-key.json`
4. **Update** `.gitignore` to exclude sensitive files

**Environment variable (optional):**

` export GOOGLE_CLOUD_KEYFILE_JSON="path/to/your-key.json" `

**Terraform Configuration**  

- Define variables in ` variables.tf `

-  Store values in ` terraform.tfvars `

- Setup provider and resources in ` main.tf`

--- 

## Deployment
Initialize Terraform and apply the configuration:

` terraform init `  

` terraform apply `

Terraform will prompt you to confirm. Type **yes** to proceed.

**SSH Access (Optional)**  

Generate a key pair to access your VM:

` ssh-keygen -t rsa -f ~/.ssh/my-gcp-key -C "your-username" -N "" `

Add the public key path in your **main.tf** file:

`metadata = {
  ssh-keys = "your-username:${file("~/.ssh/my-gcp-key.pub")}"
}`

---

### Clean Up
To destroy the VM and related resources:


`terraform destroy`

--- 

**Learn More**
Check out the full tutorial on Medium:  

https://medium.com/@maham1530/spin-up-a-virtual-machine-on-google-cloud-with-terraform-a-complete-guide-e34d5d658b13

**Contributing**  

Pull requests are welcome. For major changes, please open an issue first to discuss.

**License**  

This project is open-source and available under the MIT License.