provider "aws" {
  version = "1.41.0"
}
provider "azurerm" {
  version = "1.17.0"
}
provider "cloudflare" {
version = "~> 1.7.0"
}
provider "cloudstack" {
version = "~> 0.1.5"
}
provider "flexibleengine" {
version = "~> 1.2"
}
provider "gitlab" {
version = "~> 1.0.0"
}
provider "grafana" {
version = "~> 1.2.0"
}
provider "http" {
version = "~> 1.0.1"
}
provider "kubernetes" {
version = "~> 1.3.0"
}
provider "local" {
version = "~> 1.1.0"
}
provider "null" {
version = "1.0.0"
}
provider "openstack" {
version = "~> 1.10.0"
}
provider "powerdns" {
version = "~> 0.1.0"
}
provider "template" {
version = "1.0.0"
}

# Orange provider
provider "credhub" {
  version = "~> 0.12.1"
}
provider "cloudfoundry" {
  version = "~> 0.11.2"
}

# Community provider
provider "uaa" {
  version = "~> 0.9.0"
}
