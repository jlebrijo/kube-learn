// Comment for existing domains
//resource "digitalocean_domain" "lebrijo" {
//  name = "lebrijo.com"
//}

# Add a record to the domain
resource "digitalocean_record" "www" {
  domain = "lebrijo.com"
  type   = "A"
  name   = "test"
  ttl    = "40"
  value  = "${digitalocean_loadbalancer.public.ip}"
}
