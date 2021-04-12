# NVidia device kubernetes plugin

Terraform kubernetes NVidio plugin to run nodes with NVidia GPU

This repo is an adaptation of the repository https://github.com/NVIDIA/k8s-device-plugin

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| kubernetes | >= 1.10.0 |
| random | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| kubernetes | >= 1.10.0 |
| random | >= 2.0 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [kubernetes_daemonset](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/daemonset) |
| [random_string](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| annotations | Map of annoations to be merged with daemonset | `map` | `{}` | no |
| daemonset\_name | Name of the deamonset | `string` | `"nvidia-driver"` | no |
| image\_extra\_arguments | image extra aguments | `list` | `[]` | no |
| image\_name | image name | `string` | `"nvidia/k8s-device-plugin"` | no |
| image\_version | Version of the nvidia image | `string` | `"1.11"` | no |
| labels | Map of labels to be merged with daemonset | `map` | `{}` | no |
| namespace | Kubernates namespace | `string` | `"kube-system"` | no |
| node\_selector | Map of key value that will be used to select appropriate nodes | `map` | <pre>{<br>  "kubernetes.io/os": "linux"<br>}</pre> | no |
| toleration | List of map of daemonset toleration<br>  * key (optional):  Key is the taint key that the toleration applies to. Empty means match all taint keys. If the key is empty, operator must be Exists; this combination means to match all values and all keys.<br>  * effect (optional): Effect indicates the taint effect to match. Empty means match all taint effects. When specified, allowed values are NoSchedule, PreferNoSchedule and NoExecute.<br>  * operator (optional): Operator represents a key's relationship to the value. Valid operators are Exists and Equal. Defaults to Equal. Exists is equivalent to wildcard for value, so that a pod can tolerate all taints of a particular category.<br>  * toleation\_seconds: TolerationSeconds represents the period of time the toleration (which must be of effect NoExecute, otherwise this field is ignored) tolerates the taint. By default, it is not set, which means tolerate the taint forever (do not evict). Zero and negative values will be treated as 0 (evict immediately) by the system.<br>  * value (optional): Value is the taint value the toleration matches to. If the operator is Exists, the value should be empty, otherwise just a regular string. | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| daemonset | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Versioning
This repository follows [Semantic Versioning 2.0.0](https://semver.org/)

## Git Hooks
This repository uses [pre-commit](https://pre-commit.com/) hooks.
