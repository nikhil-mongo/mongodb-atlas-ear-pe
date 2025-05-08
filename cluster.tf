resource "mongodbatlas_advanced_cluster" "test" {
  project_id   = var.atlas_project_id
  name         = var.atlas_cluster_name
  cluster_type = "REPLICASET"

  replication_specs {
    region_configs {
      electable_specs {
        instance_size = "M10" //change the instance size to the one you want
        node_count    = 3
      }
      analytics_specs {
        instance_size = "M10" //change the instance size to the one you want
        node_count    = 0
      }
      provider_name = "AWS" //change the provider name to the one you want
      priority      = 7
      region_name   = "US_EAST_1" //change the region name to the one you want
    }
    region_configs {
      electable_specs {
        instance_size = "M10" //change the instance size to the one you want
        node_count    = 2
      }
      provider_name = "AWS" //change the provider name to the one you want
      priority      = 6
      region_name   = "US_EAST_2" //change the region name to the one you want
    }
  }
  encryption_at_rest_provider = "AWS"
}
