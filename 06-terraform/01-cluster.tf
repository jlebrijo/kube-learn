resource "digitalocean_kubernetes_cluster" "mycluster" {
  name    = "mycluster"
  region  = "ams3"
  // Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.15.4-do.0"

  node_pool {
    name       = "mypool"
    size       = "s-1vcpu-2gb"
    auto_scale = "true"
    node_count = 1
    min_nodes  = 1
    max_nodes  = 10
  }
}