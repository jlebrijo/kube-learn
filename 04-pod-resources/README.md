# Ex.04 Pods resources checking

Environment vars:
* `kubectl -n testing apply -f 04-hello-app-deployment.yml` applies deployment with new resources definitions
* `kubectl -n testing get pods` check one pod running to access it
* `kubectl -n testing exec -it <POD-NAME> sh` access to Pod's console
* `env | grep MYSQL` check environment variable exists in it 

Check node status:
* `kubectl get nodes` take <NODE-NAME>
* `kubectl describe node <NODE-NAME>` shows info like this:
    ```bash
    Capacity:
     cpu:                                               1
     memory:                                            2043372Ki
  
    Non-terminated Pods:         (10 in total)
      Namespace                  Name                                     CPU Requests  CPU Limits  Memory Requests  Memory Limits  AGE
      ---------                  ----                                     ------------  ----------  ---------------  -------------  ---
      kube-system                cilium-operator-78d9dd6447-q8265         0 (0%)        0 (0%)      0 (0%)           0 (0%)         51m
      kube-system                cilium-r57rr                             300m (30%)    0 (0%)      300Mi (19%)      0 (0%)         51m
      kube-system                coredns-9d6bf9876-6bdcf                  100m (10%)    0 (0%)      70Mi (4%)        170Mi (10%)    51m
      kube-system                coredns-9d6bf9876-76sqx                  100m (10%)    0 (0%)      70Mi (4%)        170Mi (10%)    51m
      kube-system                csi-do-node-nzqkn                        0 (0%)        0 (0%)      70Mi (4%)        0 (0%)         51m
      kube-system                do-node-agent-qhjqw                      102m (10%)    102m (10%)  80Mi (5%)        100Mi (6%)     51m
      kube-system                kube-proxy-7rtqz                         0 (0%)        0 (0%)      125Mi (7%)       0 (0%)         51m
      kube-system                kubelet-rubber-stamp-76bd547767-wxl45    0 (0%)        0 (0%)      0 (0%)           0 (0%)         51m
      testing                    hello-969f55f95-g5smr                    150m (15%)    300m (30%)  256Mi (16%)      512Mi (32%)    35s
      testing                    hello-969f55f95-m2mtb                    150m (15%)    300m (30%)  256Mi (16%)      512Mi (32%)    35s
    ```
  
Here we can note several things:
* We have 1 CPU in the node, so 100% == 1000m
* CPU requests sum is: 30% + 10 + 10 + 10 + 15 + 15 = 90%
* We find only 2 replicas: third is not allocated because it needs 15% cpu, having only 10% free
* `kubectl -n testing get pods` checks one "Pending" pod
* Limit can never be lower than the request. You will get an error
* You can define requests/limits for namespaces, as you can see in [Best Practices](https://cloud.google.com/blog/products/gcp/kubernetes-best-practices-resource-requests-and-limits)