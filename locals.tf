locals {
  tags = merge({
    Heritage    = "Terraform"
    Application = "eservice"
    Business    = "enterprise"
    Environment = var.environment
    Team        = "business"
    Repository  = "prac-CloudEngineering/cloudeng-aws-network-eservice-terraform"
    Backup      = ""
    Replication = ""
  }, var.tags)
}
