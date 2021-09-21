# terraform-module-kubernetes-nvidia-device-plugin

Terraform kubernetes NVidio plugin to run nodes with NVidia GPU

This repo is an adaptation of the repository https://github.com/NVIDIA/k8s-device-plugin

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_daemonset.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/daemonset) | resource |
| [random_string.selector](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_annotations"></a> [annotations](#input\_annotations) | Map of annoations to be merged with daemonset | `map` | `{}` | no |
| <a name="input_daemonset_name"></a> [daemonset\_name](#input\_daemonset\_name) | Name of the deamonset | `string` | `"nvidia-driver"` | no |
| <a name="input_image_extra_arguments"></a> [image\_extra\_arguments](#input\_image\_extra\_arguments) | image extra aguments | `list` | `[]` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | image name | `string` | `"nvidia/k8s-device-plugin"` | no |
| <a name="input_image_version"></a> [image\_version](#input\_image\_version) | Version of the nvidia image | `string` | `"1.11"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Map of labels to be merged with daemonset | `map` | `{}` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Kubernates namespace | `string` | `"kube-system"` | no |
| <a name="input_node_selector"></a> [node\_selector](#input\_node\_selector) | Map of key value that will be used to select appropriate nodes | `map` | <pre>{<br>  "kubernetes.io/os": "linux"<br>}</pre> | no |
| <a name="input_toleration"></a> [toleration](#input\_toleration) | List of map of daemonset toleration<br>  * key (optional):  Key is the taint key that the toleration applies to. Empty means match all taint keys. If the key is empty, operator must be Exists; this combination means to match all values and all keys.<br>  * effect (optional): Effect indicates the taint effect to match. Empty means match all taint effects. When specified, allowed values are NoSchedule, PreferNoSchedule and NoExecute.<br>  * operator (optional): Operator represents a key's relationship to the value. Valid operators are Exists and Equal. Defaults to Equal. Exists is equivalent to wildcard for value, so that a pod can tolerate all taints of a particular category.<br>  * toleation\_seconds: TolerationSeconds represents the period of time the toleration (which must be of effect NoExecute, otherwise this field is ignored) tolerates the taint. By default, it is not set, which means tolerate the taint forever (do not evict). Zero and negative values will be treated as 0 (evict immediately) by the system.<br>  * value (optional): Value is the taint value the toleration matches to. If the operator is Exists, the value should be empty, otherwise just a regular string. | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_daemonset"></a> [daemonset](#output\_daemonset) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Versioning
This repository follows [Semantic Versioning 2.0.0](https://semver.org/)

## Git Hooks
This repository uses [pre-commit](https://pre-commit.com/) hooks.
