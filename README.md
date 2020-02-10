# Minikube Lab

Prepare the Lab to test and learn Kubernetes using [Minikube](https://github.com/kubernetes/minikube).

## Lab configuration

### Prerequisites

- *a vSphere 6.7 test infrastructure*
- *Terraform - installed on the control machine*
- *Ansible - installed on the control machine*

Minikube will be run in a VM on a **vSphere 6.7** infrastructure, (`Expose hardware assisted virtualization to the guest OS` - checked) . The OS will be latest [*Fedora*](https://getfedora.org/) (currently 31).

The lab will be automated with Terraform and Ansible so that it can be available for work as soon as possible.

| **Hostname** | **IP** | **CPU** | RAM | **Storage** |
| --- | --- | --- | --- | --- |
| minikub.hl.local | 192.168.7.94 | 2 | 8 GB | 40 GB |

Unfortunately vSphere 6.7 does not currently support `Fedora 31` so no customization will occur through Terraform (aka vSphere API). All the needed OS configuration should be contained in the template from which the new VM will be cloned. The HW configuration of the VM is still supported.

`Error: error sending customization spec: Customization of the guest operating system 'fedora64Guest' is not supported in this configuration. Microsoft Vista (TM) and Linux guests with Logical Volume Manager are supported only for recent ESX host and VMware Tools versions. Refer to vCenter documentation for supported configurations.`

All the variables are exposed in `terraform.tfvars` file except the `username` and `password` needed to access the *vSphere* infrastructure. These two variables are exported as environment variables from the file `vsphere.env` excluded in `.gitignore`.

    $ cat vsphere.env
    export TF_VAR_vsphere_user="user"
    export TF_VAR_vsphere_password="password"

Of course before running terraform commands the `.env` file must be sourced.

Although the VM used for templating had `nested hardware virtualization` enabled the resulted VM after cloning operation had not. It seems that vSphere provider keeps that boolean parameter  `false` by default. See [nested_hv_enabled](https://www.terraform.io/docs/providers/vsphere/r/virtual_machine.html#nested_hv_enabled). Without this **Minikube** will not run inside a VM. The Minikube VM will use the KVM driver.

The user that will start Minikube should be added to the local group `libvirt` to stop asking the password at each 3 seconds until the cluster is started. Also, for the better, set Minikube memory permanently with this:

    # minikube config set memory 4096

## Links:
[Minikube Home](https://minikube.sigs.k8s.io/)

[Getting Started](https://minikube.sigs.k8s.io/docs/start/)

[Minikube GitHub](https://github.com/kubernetes/minikube)