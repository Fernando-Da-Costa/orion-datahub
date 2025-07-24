resource "aws_s3_object" "glue_script" {
  bucket = var.bucket_script
  key    = "scripts/oracle_to_parquet_partitioned.py"
  source = "${path.root}/../jobs/glue_jobs/ingest_oracle_to_bronze/oracle_to_parquet_partitioned.py"
  etag   = filemd5("${path.root}/../jobs/glue_jobs/ingest_oracle_to_bronze/oracle_to_parquet_partitioned.py")
}