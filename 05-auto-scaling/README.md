# Ex.05 Autoscaling nodes and pods (HPA)

DigitalOcean needs to create autoscale cluster with [doctl](https://github.com/digitalocean/doctl#snap-supported-os) tool:
```
doctl k8s cluster create mycluster --region ams3 --node-pool "name=mypool;auto-scale=true;min-nodes=1;max-nodes=10;count=1"
doctl k8s cluster kubeconfig show mycluster >> ~/.kube/config
```

Install [hpa-example](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/#run-expose-php-apache-server) to run a simple count to simulate load: 
* `kubectl apply -f 00-namespace.yaml` creates namespace again
* `kubectl apply -f 01-hpa-app-deployment.yml` creates app
* `kubectl apply -f 02-hpa-service-lb.yml` creates load balancer
* `watch kubectl -n testing get svc` get <EXTERNAL-IP>
* `curl http://<EXTERNAL-IP>` returns "OK!"

Install [metrics-server](https://www.digitalocean.com/docs/kubernetes/how-to/configure-autoscaling/):
* `kubectl apply -f 03-doks-metrics-server.yaml` installs metrics server
* `watch kubectl top nodes` gives you nodes metrics, keep in a console to see upscale nodes

Pods autoscaling:
* `kubectl apply -f 04-hpa-scaler.yml` creates app
* `kubectl -n testing get all` (keeo in a console to see upscale pods) gets <EXTERNAL-IP> autoscaling targets:
  ```bash
    NAME                                             REFERENCE                TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
    horizontalpodautoscaler.autoscaling/hpa-scaler   Deployment/hpa-example   45%/50%   1         10        8          17m
  ```
* `while true; do curl http://<EXTERNAL-IP>; done;` generates http calls to overload cluster over 50% 
* Running 2-6 consoles with the while loop, you will see the upscaling of pods and nodes:
  * 1 loops, raises 5 pods and 2 nodes
  * 2 loops, raises 5 pods and 2 nodes
  * 4 loops, raises 11 pods and 3 nodes
  * 6 loops, raises 20 pods and 5 nodes
* Stopping these loops, you will see the downscaling:
  * 4 loops, downscales to 16 pods and 5 nodes
  * 2 loops, downscales to 8 pods and 4 nodes
  * 1 loop, downscales to 5 pods and 3 nodes
  * 0 loops, downscales to 1 pod and 1 node
  
