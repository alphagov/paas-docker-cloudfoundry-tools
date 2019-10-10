provider "aws" {
  version = "2.30.0"
}
provider "azurerm" {
  version = "1.32.1"
}
provider "cloudflare" {
version = "~> 1.7.0"
}
provider "cloudstack" {
version = "~> 0.3.0"
}
provider "flexibleengine" {
version = "~> 1.6.0"
}
provider "gitlab" {
version = "~> 1.0.0"
}
provider "grafana" {
version = "~> 1.2.0"
}
provider "http" {
version = "~> 1.1.1"
}
provider "kubernetes" {
version = "~> 1.3.0"
}
provider "local" {
version = "~> 1.3.0"
}
provider "null" {
version = "1.0.0"
}
provider "openstack" {
version = "~> 1.10.0"
}
provider "powerdns" {
version = "~> 1.0.0"
}
provider "template" {
version = "1.0.0"
}

# Orange provider
provider "credhub" {
  version = "~> 0.13.0"
}
provider "cloudfoundry" {
  version = "~> 0.11.2"
}

# Community provider
provider "uaa" {
  version = "~> 0.9.0"
}
