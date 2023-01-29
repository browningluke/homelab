variable "doppler_token" {}

module "pve_ci_swarm" {
  source = "git@github.com:browningluke-tf/terraform-pve-swarm-module.git"

  doppler_token = var.doppler_token

  /* Swarm */
  swarm_name  = "d"
  domain_name = "sol.browningluke.dev"

  /* Network */
  vlan_tag   = "50"
  net_bridge = "vmbr99"

  /* Cloud-init */
  username         = "luke"
  default_password = "cloud1"
  timezone         = "America/Vancouver"
  pubkey_path      = "~/.ssh/ci-9000.pub"

  ci_conf_path = "${path.module}/cloud-init"

  /* Proxmox */
  pve_node = "solis"
  pve_host = "solis.browningluke.dev"

  /* Nodes */
  start_id      = 600
  worker_offset = 10 // This acts as the max number of managers
  node_template = "debian-11-template"

  managers = {
    "0" = {
      cores     = 1
      balloon   = 512
      memory    = 2048
      disk_size = "4G"
    }
  }

  workers = {
    "0" = {
      cores     = 4
      balloon   = 1024
      memory    = 4096
      disk_size = "8G"
    }
  }
}