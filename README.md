# Terraform AWS LAMP stack with Checkly
An example Linux Apache MySQL PHP (LAMP) stack with some Checkly checks, created using Terraform.

Once you have applied your Terraform changes, you will have a Webserver up and running. It will have PHP, mySQL and Apache webserver running. In your Checkly account, you will have a number of checks in place that will alert you if your webserver is offline or if 3rd party providers Sendgrid or Stripe are experiencing any issues that may impact on the functionality of your web application.

To get up and running you will need:

* A Checkly account
* A Checkly API key
* Terraform v1.3.7

Create a file called terraform.tfvars (or rename the terraform.tfvars.example file provided). Add in your chosen VPC and Subnet ID as well as your Checkly and Stipe API keys.

Once you are ready, run the following Terraform commands to create your infrastructure and Checkly checks:

```
terraform init
terraform apply
```

### Estimated cost
Cost estimate taken from Infracost

```
Project: gordonmurray/terraform_aws_lamp_stack_checkly

 Name                                                 Monthly Qty  Unit   Monthly Cost

 aws_instance.webserver
 ├─ Instance usage (Linux/UNIX, on-demand, t4g.nano)          730  hours         $3.36
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                      10  GB            $1.10

 OVERALL TOTAL                                                                   $4.46
──────────────────────────────────
6 cloud resources were detected:
∙ 1 was estimated, it includes usage-based costs, see https://infracost.io/usage-file
∙ 5 were free:
  ∙ 3 x aws_security_group_rule
  ∙ 1 x aws_key_pair
  ∙ 1 x aws_security_group
```