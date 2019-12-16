# Exercises to learn Kubernetes

Prerequisites: kubectl and doctl.

Basic cluster creation in DigitalOcean with one node:
* `doctl k8s cluster create mycluster --region ams3 --node-pool "name=mypool;count=1"` create cluster
* `doctl k8s cluster kubeconfig show mycluster >> ~/.kube/config` copy cluster config
* `kubectl get nodes`: check if nodes are "Ready" Status

Concepts:
* nodes: is a worker machine. Each node contains the services necessary to run pods and is managed 
  by the master components.
* namespaces: subclusters within a kube cluster
* labels: are key/value pairs that are attached to objects, such as pods.
  They are used to classify horizontally resources like with labels like apps or tier
* ReplicationController: maintain a stable set of replica Pods running at any given time.
* Deployments: declarative updates for pods
* pods: a group of one or more containers with shared specs on how to run them.
* services: exposes an applicaion running on a set of pods
  * load balancer: svc type to share requestes among several pods
  * node port: publish one port to another, external or internal to cluster
* Job: create one pod to run some tasks and ensure comlpetion.

  