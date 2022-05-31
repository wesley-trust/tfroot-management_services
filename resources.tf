/* module "management_services_virtual_machines" {
  for_each                       = toset(local.resource_locations)
  source                         = "github.com/wesley-trust/tfmodule-windows_virtual_machine"
  service_environment            = terraform.workspace
  service_deployment             = var.service_deployment
  service_name                   = var.service_name
  service_location               = each.value
  resource_name                  = local.resource_name
  resource_instance_count        = local.resource_instance_count
  resource_instance_size         = local.resource_instance_size
  resource_address_space         = lookup(var.resource_address_space, each.value, null)
  resource_dns_servers           = lookup(var.resource_dns_servers, each.value, null)
  provision_public_load_balancer = var.provision_public_load_balancer
  resource_network_role          = var.resource_network_role
}

module "management_services_network_peering" {
  for_each                   = toset(local.resource_locations)
  source                     = "github.com/wesley-trust/tfmodule-network_peering"
  service_environment        = terraform.workspace
  service_deployment         = var.service_deployment
  service_name               = var.service_name
  service_location           = each.value
  resource_network_peer      = module.management_services_virtual_machines[each.value].network_name
  resource_group_peer        = module.management_services_virtual_machines[each.value].resource_group_name
  resource_network_peer_role = var.resource_network_peer_role
}

module "management_services_traffic_manager" {
  depends_on                                  = [module.management_services_virtual_machines]
  count                                       = var.provision_traffic_manager == true ? 1 : 0
  source                                      = "github.com/wesley-trust/tfmodule-traffic_manager"
  service_environment                         = terraform.workspace
  service_deployment                          = var.service_deployment
  service_name                                = "${var.service_name}-TM"
  service_location                            = local.resource_traffic_manager_location
  resource_name                               = local.resource_name
  resource_traffic_manager_endpoints          = module.management_services_virtual_machines
  resource_traffic_manager_endpoint_locations = local.resource_locations
}

module "management_services_recovery_services" {
  depends_on                                  = [module.management_services_virtual_machines]
  for_each                                    = toset(local.resource_recovery_services_locations)
  source                                      = "github.com/wesley-trust/tfmodule-recovery_services"
  service_environment                         = terraform.workspace
  service_deployment                          = var.service_deployment
  service_name                                = "${var.service_name}-RSV"
  service_location                            = each.value
  resource_name                               = local.resource_name
  resource_recovery_services_instance_count   = local.resource_recovery_services_instance_count
  resource_recovery_services_virtual_machines = module.management_services_virtual_machines[each.value]
}
 */