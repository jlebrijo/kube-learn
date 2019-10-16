# Ex.06 Infraestructure with Terraform

[Install `terraform` command]():
* [Download appropiate version](https://www.terraform.io/downloads.html)
* `unzip ~/Downloads/<ZIP_FILE>`
* `sudo mv terraform /usr/local/bin/`
* `terraform -v` check command

Initialize provider:
* `mv terraform.example.tfvars terrafomrm.tfvars` and provide valid tokens
* `terraform init` downloads provider plugins

Create infrastructure:
* `terraform plan` loads all tf files
* `terraform apply -auto-approve` creates infrastructure
* `terraform destroy -auto-approve` destroys infra
