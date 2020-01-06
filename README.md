# null-remote-pet
The repository will create a null resource by using a different terraform backend

# What is this code for 
This code is meant to be used as an example. 
It can use the state of another terraform workspace and use it for its own perpose.
By using `data "terraform_remote_state" "random_pet"` we can take the information of the other workspace' state and use it in  this code with `${data.terraform_remote_state.random_pet.outputs.pet_name}`
You can find the code for the other workspace [here](https://github.com/yordanivh/random_pet/blob/master/main.tf).

# Why use this code

This code can give you an example of how to use the information in one workspace state in another.
It will provide you with a hands on experience on using this technique

# How to use this code

 * You need to have a working account in terraform cloud
    - you can create one [here](https://app.terraform.io/).
    - you also need to have an organization created there.More infromation [here](https://www.terraform.io/docs/cloud/users-teams-organizations/organizations.html)
    - you need to have a working connection with a VCS from you organization.More information on how to do that [here](https://www.terraform.io/docs/cloud/vcs/index.html)
 
 * Fork these two repositories
 ```
 https://github.com/yordanivh/null-remote-pet
 https://github.com/yordanivh/random_pet
 ```
 
* Create two workspaces in terraform cloud connecting the two corresponding repos from your own VCS.
    - more information on how to created and manage workspaces [here](https://www.terraform.io/docs/cloud/getting-started/workspaces.html)
    - you have to change part of the code in null-remote-pet, here is an example:
    ```hcl
    data "terraform_remote_state" "random_pet" {
     backend = "remote"

     config = {
      organization = "*YOUR ORGANIZATION*"
      workspaces = {
        name = "*YOUR WORKSPACE"
        }
      }
    }
    ```
    
* After this is set up, in the random_pet workspace queue plan will create a plan of action.

* Confirm and apply to get the random_pet id information.

* Now go the the null-remote-pet workspace and perform the same steps. You will notice that the random_pet name used in the local-exec command will be the same as the randomly generated one in the previous workspace. This is because of the `data "terraform_remote_state" "random_pet"` block where the state of the first workspace is called in the second one.
 



