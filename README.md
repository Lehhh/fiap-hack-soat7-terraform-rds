# terraform-postgres-aws

This project sets up a PostgreSQL database on AWS using Terraform. It includes the necessary configurations for deploying an EKS cluster and other AWS resources.

## Prerequisites

- AWS account
- Terraform installed
- AWS CLI configured
- GitHub repository with the following secrets:
    - `AWS_ACCESS_KEY_ID`
    - `AWS_SECRET_ACCESS_KEY`

## Variables

The following variables are used in the Terraform configuration:

- `region`: AWS region (default: `us-east-1`)
- `cluster_name`: Name of the EKS cluster (default: `eks-cluster`)
- `db_name`: Name of the PostgreSQL database (default: `tech`)
- `db_user`: Username for the PostgreSQL database (default: `postgres`)
- `db_password`: Password for the PostgreSQL database (default: `Postgres123`)
- `db_port`: Port for the PostgreSQL database (default: `5432`)
- `instance_type`: Instance type for the RDS instance (default: `db.t3.micro`)

## Terraform Configuration

The main Terraform configuration files are located in the `infra` directory:

- `DB.tf`: Defines the PostgreSQL RDS instance.
- `Variables.tf`: Defines the variables used in the Terraform configuration.

## GitHub Actions Workflow

The GitHub Actions workflow is defined in `.github/workflows/terraform-postgres.yml`. It performs the following steps:

1. Checks out the code.
2. Configures AWS credentials.
3. Verifies AWS identity.
4. Sets up Terraform.
5. Accesses the `env/prod` directory.
6. Initializes Terraform.
7. Plans the Terraform deployment.
8. Applies the Terraform configuration (destroys resources if on the `main` branch).

## Usage

1. Clone the repository.
2. Configure the necessary AWS credentials and secrets in your GitHub repository.
3. Modify the variables in `infra/Variables.tf` as needed.
4. Push changes to the `main` branch to trigger the GitHub Actions workflow.

## License

This project is licensed under the MIT License.