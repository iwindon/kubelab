# kubecluster

This repository contains Terraform configurations for setting up a Kubernetes cluster using KVM and libvirt. The Terraform files define the infrastructure and configuration needed to create and manage virtual machines for the Kubernetes cluster.

## Terraform Files

### `main.tf`

The `main.tf` file contains the main Terraform configuration for creating the virtual machines and network interfaces. It includes the following resources:

- `libvirt_volume`: Defines the disk volumes for the virtual machines. Each volume is created from the specified RHEL 9.1 ISO image.
- `libvirt_domain`: Defines the virtual machines (domains) for the Kubernetes master and nodes. Each virtual machine is configured with memory, CPU, network interface, and disk volumes. The network interface is set to use the `virbr0` bridge.

### `variables.tf`

The `variables.tf` file defines the input variables used in the Terraform configuration. It includes the following variables:

- `rhel_image_path`: The path to the RHEL 9.1 ISO image on the local machine.

### `cloud_init.cfg`

The `cloud_init.cfg` file contains the cloud-init configuration for setting up the virtual machines. It includes the following configuration:

- Sets the root password to a specified value.
- Configures SSH keys for the root user.

### `output.tf`

The `output.tf` file defines the output values for the Terraform configuration. It includes the following outputs:

- `k8s_master_ip`: The IP address of the Kubernetes master node.
- `k8s_node1_ip`: The IP address of the first Kubernetes node.
- `k8s_node2_ip`: The IP address of the second Kubernetes node.

### `.gitignore`

The `.gitignore` file specifies the files and directories that should be ignored by Git. It includes the following entries:

- `rhel-9.1.iso`: The RHEL 9.1 ISO image file.
- `.terraform.lock.hcl`: The Terraform lock file.
- `terraform.tfstate`: The Terraform state file.
- `terraform.tfstate.backup`: The Terraform state backup file.

## Usage

1. Clone the repository:

   ```sh
   git clone https://github.com/iwindon/kubecluster.git
   cd kubecluster
   terraform init
   terraform apply