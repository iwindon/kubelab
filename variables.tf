variable "rhel_image_path" {
  description = "Path to the RHEL 9 ISO image on the RHEL server"
  type        = string
  # change the below to either a VM template or ISO that you wish to deploy
  default     = "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2"  # Local path to the ISO on the RHEL server
}