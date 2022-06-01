# Define variables
variable "service_name" {
  description = "Desired name for the provisioned resources"
  type        = string
  default     = "ManagementServices"
}

variable "service_location" {
  description = "The production resource locations to deploy"
  type        = map(any)
  default = {
    Prod = [
      "UK South"
    ]

    Prod_BCDR = [
      "North Central US"
    ]

    Dev = [
      "UK South"
    ]

    Dev_BCDR = [
      "North Central US"
    ]

    default = [
      "UK South"
    ]

    default_BCDR = [
      "North Central US"
    ]
  }
}

variable "service_deployment" {
  description = "Desired deployment identifier of the service collection of provisioned resources"
  type        = string
  default     = "01"
}

variable "service_traffic_manager_location" {
  description = "The production resource location for traffic manager to deploy"
  type        = map(any)
  default = {
    Prod         = "UK South"
    Prod_BCDR    = null
    Dev          = "UK South"
    Dev_BCDR     = null
    default      = "UK South"
    default_BCDR = null
  }
}

variable "service_recovery_services_location" {
  description = "The production resource locations to backup"
  type        = map(any)
  default = {
    Prod = [
      "UK South"
    ]

    Prod_BCDR = [
      "North Central US"
    ]

    Dev = [
      "UK South"
    ]

    Dev_BCDR = [
      "North Central US"
    ]

    default = [
      "UK South"
    ]

    default_BCDR = [
      "North Central US"
    ]
  }
}

variable "resource_name" {
  description = "Desired name for the provisioned resources"
  type        = map(string)
  default = {
    "ManagementServices" = "MGMT"
  }
}

variable "operating_system_platform" {
  description = "Desired OS for the provisioned resources"
  type        = string
  default     = "Windows"
}

variable "resource_instance_count" {
  description = "Desired number of the provisioned resources for each service environment"
  type        = map(any)
  default = {
    Prod = {
      "ManagementServices" = 2
    },

    Prod_BCDR = {
      "ManagementServices" = 1
    }

    Dev = {
      "ManagementServices" = 1
    },

    Dev_BCDR = {
      "ManagementServices" = 1
    }

    default = {
      "ManagementServices" = 2
    },

    default_BCDR = {
      "ManagementServices" = 1
    },
  }
}

variable "resource_recovery_services_instance_count" {
  description = "Desired number of the provisioned resources to backup in each service environment"
  type        = map(any)
  default = {
    Prod = {
      "ManagementServices" = 1
    },

    Prod_BCDR = {
      "ManagementServices" = 0
    }

    Dev = {
      "ManagementServices" = 1
    },

    Dev_BCDR = {
      "ManagementServices" = 0
    }

    default = {
      "ManagementServices" = 1
    },

    default_BCDR = {
      "ManagementServices" = 0
    },
  }
}

variable "resource_instance_size" {
  description = "Desired size for the provisioned resources for each service"
  type        = map(any)
  default = {
    Prod = {
      "ManagementServices" = "Standard_B1s"
    },

    Prod_BCDR = {
      "ManagementServices" = "Standard_B1s"
    }

    Dev = {
      "ManagementServices" = "Standard_B1s"
    },

    Dev_BCDR = {
      "ManagementServices" = "Standard_B1s"
    }

    default = {
      "ManagementServices" = "Standard_B1s"
    }

    default_BCDR = {
      "ManagementServices" = "Standard_B1s"
    }
  }
}

variable "resource_address_space" {
  description = "Desired address space for the provisioned resources"
  type        = map(string)
  default = {
    "UK South"         = "10.0.6.0/24"
    "North Europe"     = "10.2.6.0/24"
    "West Europe"      = "10.4.6.0/24"
    "North Central US" = "10.6.6.0/24"
  }
}

variable "resource_dns_servers" {
  description = "Desired DNS servers for the provisioned resources"
  type        = map(any)
  default = {
    "UK South" = [
      "10.0.2.4",
      "10.0.2.5"
    ]

    "North Europe" = [
      "10.2.2.4",
      "10.2.2.5"
    ]

    "West Europe" = [
      "10.4.2.4",
      "10.4.2.5"
    ]

    "North Central US" = [
      "10.6.2.4",
      "10.6.2.5"
    ]
  }
}

variable "provision_public_load_balancer" {
  description = "Whether to provision a public load balancer"
  type        = bool
  default     = true
}

variable "provision_traffic_manager" {
  description = "Whether to provision traffic manager"
  type        = bool
  default     = true
}

variable "resource_network_role" {
  description = "The network type for peering"
  type        = string
  default     = "spoke"
}

variable "resource_network_peer_role" {
  description = "The network type for peering"
  type        = string
  default     = "hub"
}

variable "resource_traffic_manager_endpoint_type" {
  description = "Type of Traffic Manager Endpoint"
  type        = string
  default     = "Azure_Endpoint"
}
