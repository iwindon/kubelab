terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }

  required_version = ">= 0.13"
}

provider "libvirt" {
  uri = "qemu+ssh://root@saturn.home.therootuser.com/system"
}

resource "null_resource" "set_env" {
  provisioner "local-exec" {
    command = "setx LIBVIRT_DEFAULT_URI qemu+ssh://root@saturn.home.therootuser.com/system && setx LIBVIRT_SSH_KNOWN_HOSTS %USERPROFILE%\\.ssh\\known_hosts"
  }
}