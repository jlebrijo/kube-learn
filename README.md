# Exercises to learn Kubernetes

Create cluster in DigitalOcean with one node:
* `doctl k8s cluster create mycluster --region ams3 --node-pool "name=mypool;count=1"` create cluster
* `doctl k8s cluster kubeconfig show mycluster >> ~/.kube/config` copy cluster config
* `kubectl get nodes`: check if nodes are "Ready" Status

Concepts:
* controllers
* workers
* etcd
* nodes
* containers
* namespaces
* pods
* services