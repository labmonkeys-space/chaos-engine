variable "vsphere-user" {
  type = string
  default = "administrator@vsphere.local"
}

variable "vsphere-password" {
  type = string
  default = "mypassword"
  sensitive = true
}

variable "ssh-username" {
  type = string
  default = "root"
}

variable "ssh-password" {
  type = string
  default = "mypassword"
  sensitive = true
}

variable "vm-name" {
  type = string
  default = "kafkakafka"
}

variable "vsphere-server" {
  type = string
  default = "vcsa.vsphere.local"
}

variable "datacenter" {
  type = string
  default = "Datacenter"
}

variable "datastore" {
  type = string
  default = "datastore1"
}

variable "folder" {
  type = string
  default = "Packer-Virtual-Machines"
}

variable "cluster" {
  type = string
  default = "Cluster"
}

variable "network" {
  type = string
  default = "VM Network"
}

variable "vm-cpu-num" {
  type = number
  default = 1
}

variable "vm-mem-size" {
  type = number
  default = 1024
}

variable "vm-disk-size" {
  type = number
  default = 10240
}
