resource "aws_iam_group" "data_readers" {
  name = "orion-data-readers"
}

resource "aws_iam_group" "data_writers" {
  name = "orion-data-writers"
}

resource "aws_iam_group" "data_analysts" {
  name = "orion-data-analysts"
}
