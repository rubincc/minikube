variable "vsphere_user" {
  type        = string
  description = "The user that access the vsphere API."
}

variable "vsphere_password" {
  type        = string
  description = "The user's password for accessing the vsphere API."
}

variable "vsphere_server" {
  type        = string
  description = "The server that serves the vsphere API."
}

variable "vsphere_datacenter" {
  type        = string
  description = "The name of the datacenter"
}

variable "vsphere_datastore" {
  type        = string
  description = "The name of the datastore"
}

variable "vsphere_compute_cluster" {
  type        = string
  description = "The name of the vsphere cluster"
}

variable "vsphere_network" {
  type        = string
  description = "The network port group for the new VM"
}

variable "vsphere_vm_template" {
  type        = string
  description = "The template to clone the VM from"
}

variable "vsphere_vm_name" {
  type        = string
  description = "The name of the new VM"
}

variable "vm_num_cpus" {
  type        = number
  description = "The number of CPUs for the new VM"
}

variable "vm_memory" {
  type        = number
  description = "The amount on RAM memory in MB for the new VM"
}

variable "vm_host_name" {
  type        = string
  description = "The hostname of the new VM"
}

variable "vm_domain_name" {
  type        = string
  description = "The domain name of the new VM"
}

variable "vm_ipv4_address" {
  type        = string
  description = "The IPv4 address of the new VM"
}

variable "vm_ipv4_netmask" {
  type        = string
  description = "The netmask for the new VM"
}

variable "vm_ipv4_gateway" {
  type        = string
  description = "The gateway for the new VM"
}

variable "vm_dns_servers" {
  type        = list
  description = "DNS servers"
}

variable "vm_dns_search_domain" {
  type        = string
  description = "DNS search domain."
}

variable "res_pool_name" {
  type        = string
  description = "The name of the new resource pool to be created."
}