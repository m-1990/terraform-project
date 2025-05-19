# 🚀 Spin Up a VM on Google Cloud with Terraform

This repository contains all the Terraform code and configuration files used in the [Medium tutorial](https://medium.com/your-article-link) to spin up a virtual machine (VM) on Google Cloud Platform (GCP).

> ✅ Perfect for beginners looking to get hands-on with Terraform and GCP infrastructure.

---

## 🧰 Prerequisites

Before you get started, ensure you have the following installed:

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- A [Google Cloud Platform](https://cloud.google.com/) account
- A text editor like [VS Code](https://code.visualstudio.com/)
- Git (optional)

---

## 📁 Folder Structure

terraform-project/
├── main.tf
├── variables.tf
├── terraform.tfvars
├── .gitignore
└── service-account/
└── your-service-account-key.json


---

## 🔐 Setup & Authentication

1. **Create a Service Account in GCP**
2. **Download the JSON key**
3. **Move it to** `service-account/your-key.json`
4. **Update** `.gitignore` to exclude sensitive files

Environment variable (optional):

```bash
export GOOGLE_CLOUD_KEYFILE_JSON="path/to/your-key.json"

🧱 Terraform Configuration
Define variables in variables.tf

Store values in terraform.tfvars

Setup provider and resources in main.tf

Deployment
Initialize Terraform and apply the configuration:

terraform init
terraform apply

Terraform will prompt you to confirm. Type yes to proceed.

SSH Access (Optional)
Generate a key pair to access your VM:

ssh-keygen -t rsa -f ~/.ssh/my-gcp-key -C "your-username" -N ""

Add the public key path in your main.tf file:

metadata = {
  ssh-keys = "your-username:${file("~/.ssh/my-gcp-key.pub")}"
}

Clean Up
To destroy the VM and related resources:

bash
Copy
Edit
terraform destroy

Learn More
Check out the full tutorial on Medium:
👉 Read the Story

⭐️ Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss.

📄 License
This project is open-source and available under the MIT License.