locals {
  tags = {
    Date = formatdate("YYYY-MMM-DD", timestamp())
    Environment = var.env
    Owner = join(" ", ["Vinicius", "Dutra"])
  }
}