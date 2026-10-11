data "oci_generative_ai_semantic_stores" "generative_ai_semantic_stores_lookup" {
  for_each = var.generative_ai_semantic_stores_lookup

  compartment_id                     = each.value.compartment_id
  data_source_querying_connection_id = each.value.data_source_querying_connection_id
  display_name                       = each.value.display_name
  state                              = each.value.state

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

