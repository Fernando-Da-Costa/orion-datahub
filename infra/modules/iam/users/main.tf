resource "aws_iam_user_group_membership" "devs_orion_datahub_membership" {
  user = "devs-orion-datahub"
  groups = [
    var.data_readers_group_name
  ]
}

# resource "aws_iam_user" "analyst" {
#   name = "devs-orion-analyst"
# }
