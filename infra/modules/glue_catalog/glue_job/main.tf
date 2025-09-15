resource "aws_glue_job" "oracle_to_parquet_partitioned" {
  name        = var.job_name
  role_arn    = var.glue_role_arn
  description = " Script AWS Glue extrai dados de tabela Oracle, adiciona colunas de data (ano, mes, dia) e grava os dados particionados em formato Parquet no Amazon S3."
  command {
    name            = "glueetl"
    script_location = var.script_path
    python_version  = "3"
  }
  default_arguments = {
    "--job-language"   = "python"
    "--env"            = var.environment
    "--table"          = "empregados"
    "--schema"         = "orion"
    "--s3_input_path"  = var.s3_input_path
    "--s3_output_path" = var.s3_output_path
    "--TempDir"        = var.temp_dir
    "--enable-metrics" = "true"
    "--additional-python-modules" = "datadog"
  }
  glue_version = "4.0"
  number_of_workers = 2
  worker_type       = "G.1X"
  tags = {
    Project     = "orion-datahub"
    Environment = var.environment
  }
}
