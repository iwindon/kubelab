# kubecluster

This repository contains Terraform configurations for setting up a Kubernetes cluster using KVM and libvirt. The Terraform files define the infrastructure and configuration needed to create and manage virtual machines for the Kubernetes cluster.

Note:  At this time it only deploys the base servers, Kubernetes needs to be installed afterward still.

## Terraform Files

### `main.tf`

The `main.tf` file contains the main Terraform configuration for creating the virtual machines and network interfaces. It includes the following resources:

- `libvirt_volume`: Defines the disk volumes for the virtual machines. Each volume is created from the specified CentOS 8 ISO image.
- `libvirt_cloudinit_disk`: Creates a CloudInit ISO image for initializing the virtual machines.
- `libvirt_domain`: Defines the virtual machines (domains) for the Kubernetes master and nodes. Each virtual machine is configured with memory, CPU, network interface, and disk volumes. The network interface is set to use the `virbr0` bridge.

### `variables.tf`

The `variables.tf` file defines the input variables used in the Terraform configuration. It includes the following variables:

- `rhel_image_path`: The path to the CentOS 8 ISO image on the local machine.

### `cloud_init.cfg`

The `cloud_init.cfg` file contains the cloud-init configuration for setting up the virtual machines. It includes the following configuration:

- Sets the root password to a specified value.

### `output.tf`

The `output.tf` file defines the output values for the Terraform configuration. It includes the following outputs:

- `k8s_master_ip`: The IP address of the Kubernetes master node.
- `k8s_node1_ip`: The IP address of the first Kubernetes node.
- `k8s_node2_ip`: The IP address of the second Kubernetes node.

## Usage

1. Clone the repository:

   ```sh
   git clone https://github.com/iwindon/kubecluster.git
   dnf install genisoimage
   dnf install terraform
   cd kubecluster