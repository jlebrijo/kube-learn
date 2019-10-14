# Ex.02: Load Balancer

Create a LB and point to Wordpress replication-controller

* `kubectl -n testing delete service wordpress`: deletes node-port service
* `kubectl -n testing get svc`: checks no service active
* `kubectl -n testing apply -f 03-wordpress-service-lb.yml`: applies lb service 
* `kubectl -n testing get svc`: checks lb service, to get <EXTERNAL-IP>

Can access wordpress installation on: `http://<EXTERNAL-IP>` 


