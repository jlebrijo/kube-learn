# Ex.07 Persistent volumes

Install Mysql/Wordpress over a DO volume.

Create infrastructure:
* Add DO valid token to `terraform.tfvars`
* `terraform init; terraform apply`

Create kube elements:
* `mv kubeconfig.yaml ~/.kube/config`
* `kubectl apply -f .`
* `watch kubectl get all` check all is created

You can visit: `http://test.lebrijo.com`
