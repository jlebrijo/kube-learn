# Ex.03 Deployments

* `kubectl delete namespace testing` deletes namespace testing
* `kubectl apply -f 00-namespace.yaml` creates namespace again
* `kubectl -n testing apply -f 01-hello-app-deployment.yml` deploys docker image
* `kubectl -n testing get pods` see 3 replicas
* `kubectl -n testing scale --replicas=5 deployment/hello` scales to 5 replicas 
* `kubectl -n testing get pods`  see 5 replicas
* `kubectl -n testing apply -f 02-hello-service-lb.yml` creates a load balancer  
* `kubectl -n testing describe svc hello-lb`  check 5 pods as endpoints connected, and get <EXTERNAL-IP>
* `curl http//<EXTERNAL-IP>` everytime you check this you reach a different pod (Hostname)
* `kubectl -n testing apply -f 03-hello-deployment-v2.yml` just changing image version this is deployed
* `watch kubectl -n testing get pods` check sequential deployment
* `curl http//<EXTERNAL-IP>` check now Version is 2
