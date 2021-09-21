variable "image_version" {
  description = "Version of the nvidia image"
  default     = "1.18"
}

variable "daemonset_name" {
  description = "Name of the deamonset"
  default     = "nvidia-driver"
}

variable "namespace" {
  description = "Kubernates namespace"
  default     = "kube-system"
}

variable "annotations" {
  description = "Map of annoations to be merged with daemonset"
  default     = {}
}

variable "labels" {
  description = "Map of labels to be merged with daemonset"
  default     = {}
}

variable "image_name" {
  description = "image name"
  default     = "nvidia/k8s-device-plugin"
}

variable "image_extra_arguments" {
  description = "image extra aguments"
  default     = []
}

variable "toleration" {
  description = <<DOCUMENTATION
List of map of daemonset toleration
  * key (optional):  Key is the taint key that the toleration applies to. Empty means match all taint keys. If the key is empty, operator must be Exists; this combination means to match all values and all keys.
  * effect (optional): Effect indicates the taint effect to match. Empty means match all taint effects. When specified, allowed values are NoSchedule, PreferNoSchedule and NoExecute.
  * operator (optional): Operator represents a key's relationship to the value. Valid operators are Exists and Equal. Defaults to Equal. Exists is equivalent to wildcard for value, so that a pod can tolerate all taints of a particular category.
  * toleation_seconds: TolerationSeconds represents the period of time the toleration (which must be of effect NoExecute, otherwise this field is ignored) tolerates the taint. By default, it is not set, which means tolerate the taint forever (do not evict). Zero and negative values will be treated as 0 (evict immediately) by the system.
  * value (optional): Value is the taint value the toleration matches to. If the operator is Exists, the value should be empty, otherwise just a regular string.
DOCUMENTATION
  default     = {}
}

variable "node_selector" {
  description = "Map of key value that will be used to select appropriate nodes"
  default = {
    "kubernetes.io/os" = "linux"
  }
}
