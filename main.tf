locals {
  annotations = {}
  labels = {
    "version"    = var.image_version
    "part-of"    = "driver"
    "managed-by" = "terraform"
    "name"       = "nvidia-device-driver"
    "component"  = "device-driver"
  }
}

#####
# Randoms
#####

resource "random_string" "selector" {
  special = false
  upper   = false
  number  = false
  length  = 8
}

#####
# Daemonset
#####

resource "kubernetes_daemonset" "this" {
  metadata {
    name      = var.daemonset_name
    namespace = var.namespace
    annotations = merge(
      local.annotations,
      var.annotations
    )
    labels = merge(
      local.labels,
      var.labels
    )
  }

  spec {
    selector {
      match_labels = {
        selector = "nvidia-${random_string.selector.result}"
      }
    }

    template {
      metadata {
        labels = merge(
          {
            selector = "nvidia-${random_string.selector.result}"
          },
          local.labels,
          var.labels
        )
        annotations = merge(
          local.annotations,
          var.annotations
        )
      }

      spec {
        volume {
          name = "nvidia-device-plugin"

          host_path {
            path = "/var/lib/kubelet/device-plugins"
          }
        }

        container {
          name  = "nvidia-${random_string.selector.result}"
          image = format("%s:%s", var.image_name, var.image_version)
          args  = concat(["--fail-on-init-error=false"], var.image_extra_arguments)

          volume_mount {
            name       = "nvidia-device-plugin"
            mount_path = "/var/lib/kubelet/device-plugins"
          }

          security_context {
            capabilities {
              drop = ["ALL"]
            }
          }
        }

        dynamic "toleration" {
          for_each = var.toleration

          content {
            key                = lookup(each.key, "key", null)
            effect             = lookup(each.value, "effect", null)
            operator           = lookup(each.value, "operator", null)
            toleration_seconds = lookup(each.value, "toleration_seconds", null)
            value              = lookup(each.value, "value", null)
          }
        }

        node_selector = var.node_selector

        priority_class_name = "system-node-critical"
      }
    }

    strategy {
      type = "RollingUpdate"
    }
  }
}
