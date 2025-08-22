# Stage Environment Terraform Configuration

This directory contains the Terraform configuration for the **stage** environment.

## Terraform Init Example

To initialize the Terraform backend for the **stage** environment, use the following command:



### Explanation of the `terraform init` Command:
When running this command, you are initializing the Terraform working directory and configuring the backend to store the Terraform state remotely in an Amazon S3 bucket with DynamoDB state locking.

#### Backend Configurations:
- **`bucket=vitalreg-infra-backend-state`**: This specifies the Amazon S3 bucket where the Terraform state file will be stored.
- **`key=stage-terraform-tfstate`**: This specifies the path (or key) in the S3 bucket for the state file. In this case, the file is named `stage-terraform-tfstate`.
- **`region=us-east-1`**: This specifies the AWS region where the S3 bucket is located. In this example, it is in the `us-east-1` region.

### Why Remote State is Important:
Using a remote backend like S3 ensures that:
1. The Terraform state is stored in a centralized and persistent location.
2. Collaboration is easier, as all team members can share the same state file.
3. Changes to the state are properly locked (using DynamoDB locking) to prevent concurrency issues during `plan` and `apply` operations.

#### Prerequisites:
Ensure that:
1. The S3 bucket **`vitalreg-infra-backend-state`** exists in the `us-east-1` region.
2. You have configured the appropriate permissions for your AWS credentials to access the bucket and manage state.

### Notes:
- If you change the `key` value in the command, Terraform will treat it as a separate environment and will not find any previous state. Use the specified key value to coordinate state for the **stage** environment.
- Check the `backend.tf` or equivalent file in this directory to confirm or customize backend configurations.

For more details about Terraform remote state and backends, refer to the [Terraform Documentation on Backends](https://developer.hashicorp.com/terraform/docs/language/settings/backends/configuration).

---

## How to Use This Configuration

1. **Initialize the Environment** (Run the `terraform init` command mentioned above).
2. **Validate the Configuration**:
   ```bash
   terraform validate
   ```
3. **Plan the Changes**:
   ```bash
   terraform plan -var-file="terraform.tfvars"
   ```
4. **Apply the Changes**:
   ```bash
   terraform apply -var-file="terraform.tfvars"
   ```

---

## Directory Structure
