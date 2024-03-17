# Terraform Workspace

Terraform workspaces are a logical concept where you can manage multiple states of your infrastructure configuration. Put simply, you can run the same infrastructure configuration in different environments such as development and production.

The main benefit of Terraform workspaces is the ability to have more than one state associated with a single Terraform configuration.

If you have not defined any workspace, Terraform always creates a default workspace, and you always work within this default workspace. You can list the number of Terraform workspaces by running the command `terraform workspace show`. Also, you cannot delete the default workspace.

## Step 1: Creating a New Terraform Workspace

To create a Terraform workspace, first ensure that you have installed Terraform. Then, run the following Terraform workspace command:

```bash
terraform workspace new dev 
```

Here are few points to keep in mind -

To create a `workspace` you must type in the keyword workspace after terraform
You must also type in `new` for creating a new workspace
The third and last thing is your `workspace name`, in the above command I have taken the workspace name as `dev`


## Create one more workspace with name test

To get a better understanding of workspace and how it isolates then I would highly recommend creating one more workspace where we run the terraform commands respectively on each workspace without affecting their states

Here is the command for creating another workspace with the name test

```bash
 terraform workspace new test 
```

## step 2: How to List all the Terraform workspaces?

Now in step 1 we have seen how to create a new workspace in terraform. But then how to list all the workspaces which we have created previously.

So to list all the available workspaces use the following terraform command 

```bash
terraform workspace list 
```

## Step 3: How to Show Terraform workspaces?

Now we know how to create a terraform workspace and how to list all the available workspace in terraform.

But is there a way to show active workspace?

Terraform provides a command terraform workspace show which can help you to show the active running workspace in which you are working.

```bash
terraform workspace show
```

## Step 4: How to switch Terraform workspaces?

It might be possible that you have created multiple workspaces to isolate your infrastructure code and you want to switch between the workspaces to apply your infrastructure changes.

So to switch the workspace you should following terraform command 

```bash
terraform workspace select test  
```

The above terraform command will make a switch to test workspace. In your case, you simply need to put your workspace name to make the switch between the workspaces


## step 5:How to use the name of Current Workspace using ${terraform.workspace} Interpolation?

While working with longer terraform infrastructure code it often needed to name or tag your resources based on the environment profile such as dev, test, stage, prod, etc.

With the help of ${terraform.workspace} interpolation sequence you can use the current workspace name to define terraform locals.

For more detailed information, visit [Terraform workspace](https://jhooq.com/terraform-workspaces/).
