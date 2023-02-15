resource "google_compute_instance" "private-vm" {
  name         = "private-vm"
  machine_type = "e2-medium"
  zone         = var.zone

  service_account {
    email  = var.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform" ]
  }
  boot_disk {
    initialize_params {
      image = var.image
      size  = 50
    }
  }
   
#   #  depends_on = [
#   #   google_container_cluster.private_cluster
#   #  , google_container_node_pool.private-cluster_node_pool
#   # ]
#   variable "storage_account_depends_on" {
#   # the value doesn't matter; we're just using this variable
#   # to propagate dependencies.
#   type    = any
#   default = []
# }
# depends_on = [var.storage_account_depends_on]


   metadata_startup_script = <<-EOF
                                    sudo apt install -y apt-transport-https ca-certificates gnupg
                                    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
                                    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.gpg
                                    sudo apt-get update && sudo apt-get install -y google-cloud-cli
                                    sudo apt-get install kubectl -y
                                    sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin -y
                                    sudo git clone https://github.com/mahmoud-24/ITI-Graduation-Project-Infrastructure /home/mahmoud/test
                                    sudo apt-get install -y ansible
                                    sudo ansible-playbook /home/mahmoud/test/ansible.yaml
                                 EOF

  
  network_interface {
    network    = var.vpc-id
    subnetwork = var.subnet-id
  }
}