data "terraform_remote_state" "random_pet" {
  backend = "remote"

  config = {
    organization = "yordanh_free"
    workspaces = {
      name = "random_pet"
    }
  }

  resource "null_reseource" {
      provisioner "local-exec" {
          command= "echo data.terraform_remote_state.random_pet.output.pet_name"
      }
  } 