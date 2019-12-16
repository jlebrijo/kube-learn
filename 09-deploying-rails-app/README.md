# Ex.09 Deploying a Rails App

Deploy an example Rails App into a Kubernetes cluster.

Provision infrastructure:
* Add DO valid token to `terraform.tfvars`
* `terraform init; terraform apply`

Create kube elements:
* `mv kubeconfig.yaml ~/.kube/config`
* `kubectl apply -f 01-postgresql.yml` creates database in a volume and service
* `kubectl apply -f 02-rails-env.yml` creates rails env variables
* `kubectl apply -f 03-rails-app.yml` creates rails app
* `watch kubectl get all` check all is created

Initialize database with a job:
* `kubectl apply -f 04-db-setup-job.yml` db setup with a job
* `kubectl logs job/setup` check everything went right
* `kubectl delete job/setup` removes job

Redeployments:
* `docker build -t jlebrijo/spike .` build image with changes.
* `docker push jlebrijo/spike` publish image.
* `kubectl apply -f 05-migration-job.yml` runs migration.
* `kubectl wait --for=condition=complete --timeout=600s job/migrate` wait completion before to continue.
* `kubectl logs job/migrate` check everything went right.
* `kubectl delete job/migrate` removes job.
* `kubectl rollout restart deployment/rails` redeploy rails deployment.
