resource "aws_kms_key" "main" {

  description = format("KMS key %s", var.name)

  key_usage                = var.key_usage
  customer_master_key_spec = var.customer_master_key_spec
  deletion_window_in_days  = var.deletion_window_in_days

  tags = {
    Name = var.name
  }
}

resource "aws_kms_alias" "main" {
  for_each = toset(concat(var.kms_aliases_list, [var.name]))

  name          = format("alias/%s", each.key)
  target_key_id = aws_kms_key.main.key_id
}
