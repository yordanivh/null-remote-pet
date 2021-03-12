data "terraform_remote_state" "random_pet" {
  backend = "remote"

  config = {
    organization = "yordanh_free"
    workspaces = {
      name = "random_pet"
    }
  }
}

  resource "null_resource" "example" {
      provisioner "local-exec" {
          command="echo ${data.terraform_remote_state.random_pet.outputs.pet_name}"
      }
  }

resource "null_resource" "example2" {
      provisioner "local-exec" {
          command="az --version"
      }
  }
