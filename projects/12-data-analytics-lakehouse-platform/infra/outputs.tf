output "glue_database_name" {
  value = aws_glue_catalog_database.lakehouse.name
}

output "athena_workgroup" {
  value = aws_athena_workgroup.analytics.name
}
