locals {
  lambda_configs = {
    statements = {
      function_name     = "sendStatementsToKinesis"
      handler           = "sendStatementsToKinesis.lambda_handler"
      runtime           = "python3.12"
      iam_role_arn      = module.iam.lambda_role_arn
      filename          = "sendStatementsToKinesis.zip"
      environment_vars  = {
        KINESIS_STREAM_NAME = module.kinesis_stream["statements"].kinesis_stream_name
        API_URL             = "https://my.api.mockaroo.com/statements.json?key=1240a590"
      }
    }
    payments = {
      function_name     = "sendPaymentsToKinesis"
      handler           = "sendPaymentsToKinesis.lambda_handler"
      runtime           = "python3.12"
      iam_role_arn      = module.iam.lambda_role_arn
      filename          = "sendPaymentsToKinesis.zip"
      environment_vars  = {
        KINESIS_STREAM_NAME = module.kinesis_stream["payments"].kinesis_stream_name
        API_URL             = "https://my.api.mockaroo.com/payments.json?key=1240a590"
      }
    }
    matches = {
      function_name     = "sendMatchesToKinesis"
      handler           = "sendMatchesToKinesis.lambda_handler"
      runtime           = "python3.12"
      iam_role_arn      = module.iam.lambda_role_arn
      filename          = "sendMatchesToKinesis.zip"
      environment_vars  = {
        KINESIS_STREAM_NAME = module.kinesis_stream["matches"].kinesis_stream_name
        API_URL             = "https://my.api.mockaroo.com/matches.json?key=1240a590"
      }
    }
  }
}
