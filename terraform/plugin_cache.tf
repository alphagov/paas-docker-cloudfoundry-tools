provider "aws" {
  version = "1.6.0"
}
provider "template" {
  version = "1.0.0"
}
provider "null" {
  version = "1.0.0"
}
provider "openstack" {
  version = "~> 1.4.0"
}
provider "cloudflare" {
  version = "~> 1.0.0"
}
provider "local" {
  version = "~> 1.1.0"
}
provider "powerdns" {
  version = "~> 0.1.0"
}
provider "cloudstack" {
  version = "~> 0.1.4"
}
provider "gitlab" {
  version = "~> 1.0.0"
}
provider "grafana" {
  version = "~> 1.0.2"
}
provider "http" {
  version = "~> 1.0.1"
}
provider "kubernetes" {
  version = "~> 1.1.0"
}
provider "flexibleengine" {
  version = "~> 1.0.1"
}

# Orange provider
provider "credhub" {
  version = "~> 0.11.0"
}
provider "cloudfoundry" {
  version = "~> 0.9.1"
}

# Community provider
provider "uaa" {
  version = "~> 0.8.0"
}
provider "helm" {
  version = "~> 0.5.1"
}
