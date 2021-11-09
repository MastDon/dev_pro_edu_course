terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}


provider "cloudflare" {
  email   = var.cf_mail
  api_key = var.cf_apikey
}



resource "cloudflare_record" "CNAME" {
  zone_id = var.zone_id
  name    = "CNAME"
  value   = data.aws_lb.lb_dns_name.dns_name
  type    = "CNAME"
  proxied = true

}

resource "cloudflare_record" "WWW" {
  zone_id = var.zone_id
  name    = "WWW"
  value   = data.aws_lb.lb_dns_name.dns_name
  type    = "CNAME"
  proxied = true

}