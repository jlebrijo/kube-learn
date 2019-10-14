# Ex.01: Install wordpress

Create cluster in DigitalOcean
Download config file and copy to `~/.kube/config`

* `kubectl get nodes`: node list
* `kubectl apply -f kube/00-namespace.yaml`: apply config to cluster 
* `kubectl get namespaces`: check namespaces
* `kubectl -n testing apply -f kube/01-wordpress-service.yml`: creates service in a namespace 
* `kubectl -n testing get svc`: check services
* `kubectl -n testing apply -f kube/02-wordpress-rc.yml`: creates replication controller 
* `kubectl -n testing get pods`: check pods
* `kubectl get nodes -o wide`: check nodes info including <EXTERNAL-IP>

Check worpress installation at: `http://<EXTERNAL-IP>:30000`

