resource "aws_kinesisanalyticsv2_application" "analytics_app" {
  name                   = var.app_name
  runtime_environment    = "SQL-1_0"
  service_execution_role = var.execution_role_arn

  application_configuration { # Novo bloco application_configuration
    sql_application_configuration {
      input {
        name_prefix = "SOURCE_SQL_STREAM"
        kinesis_streams_input {
          resource_arn = var.input_stream_arn
        }
        input_schema {
          record_format {
            record_format_type = "JSON"
            mapping_parameters {
              json_mapping_parameters {
                record_row_path = "$"
              }
            }
          }

          record_columns {
            name     = "user_id"
            sql_type = "VARCHAR(64)"
            mapping  = "$.user_id"
          }
          record_columns {
            name     = "event_type"
            sql_type = "VARCHAR(32)"
            mapping  = "$.event_type"
          }
          record_columns {
            name     = "score"
            sql_type = "DOUBLE"
            mapping  = "$.score"
          }
        }
      }

      output {
        name             = "processed_stream"
        destination_schema {
          record_format_type = "JSON"
        }
        kinesis_firehose_output {
          resource_arn = var.firehose_arn
        }
      }
    }
  } # Fim do bloco application_configuration
}
