provider "terraform" {version = "~> 1.0.2"}
provider "openstack" {version = "~> 1.1.0"}
provider "cloudflare" {version = "~> 0.1.0"}
provider "local" { version = "~> 1.0.0"}
provider "powerdns" {version = "~> 0.1.0"}

# Orange provider
provider "credhub" {}
provider "cloudfoundry" {}