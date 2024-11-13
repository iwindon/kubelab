variable "rhel_image_path" {
  description = "Path to the RHEL 9 ISO image on the RHEL server"
  type        = string
  # change the below to either a VM template or ISO that you wish to deploy
  default     = "https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.4.2105-20210603.0.x86_64.qcow2"  # Local path to the ISO on the RHEL server
}