resource "digitalocean_record" "www" {
  domain = "lebrijo.com"
  type   = "A"
  name   = "test2"
  ttl    = "40"
  value  = "${digitalocean_loadbalancer.public.ip}"
}
