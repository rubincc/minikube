# Minikube Lab

Prepare the Lab to test and learn Kubernetes using [Minikube](https://github.com/kubernetes/minikube).

## Lab configuration

Minikube will be run in a VM on a **vSphere 6.7** infrastructure, (`Expose hardware assisted virtualization to the guest OS` - checked) . The OS will be latest [*Fedora*](https://getfedora.org/) (currently 31).

The lab will be automated with Terraform and Ansible so that it can be available for work as soon as possible.

| **Hostname** | **IP** | **CPU** | RAM | **Storage** |
| --- | --- | --- | --- | --- |
| minikub.hl.local | 192.168.7.94 | 2 | 8 GB | 40 GB |

Unfortunately vSphere 6.7 does not currently support `Fedora 31` so no customization will occur through Terraform (aka vSphere API). All the needed OS configuration should be contained in the template from which the new VM will be clonned. The HW configuration of the VM is still supported.

`Error: error sending customization spec: Customization of the guest operating system 'fedora64Guest' is not supported in this configuration. Microsoft Vista (TM) and Linux guests with Logical Volume Manager are supported only for recent ESX host and VMware Tools versions. Refer to vCenter documentation for supported configurations.`

All the variables are exposed in `terraform.tfvars` file except the `username` and `password` needed to access the *vSphere* infrastructure. These two variables are exported as environment variables from the file `vsphere.env` excluded in `.gitignore`.

    $ cat vsphere.env
    export TF_VAR_vsphere_user="user"
    export TF_VAR_vsphere_password="password"

Of course before running terraform commands the `.env` file must be sourced.

## Links:
[Minikube Home](https://minikube.sigs.k8s.io/)

[Getting Started](https://minikube.sigs.k8s.io/docs/start/)

[Minikube GitHub](https://github.com/kubernetes/minikube)