resource "google_compute_instance_template" "nginxserver" {
  name          			 = "test-webserver"
  machine_type  			 = "n1-standard-1"
  metadata_startup_script    = "apt-get update && apt-get install -y nginx"

  network_interface {
	network = "default"
	access_config {
	}
  }

  disk {
	source_image = "debian-cloud/debian-9"
	auto_delete  = true
	boot         = true
  }
}


resource "google_cloudbuild_trigger" "filename-trigger" {
  trigger_template {
    branch_name = "master"
    repo_name   = "https://github.com/cmagna/data2bots.git"
  }
  
  filename = "cloudbuild.yaml"
}


