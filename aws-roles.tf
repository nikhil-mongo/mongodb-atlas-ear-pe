resource "aws_iam_role" "test_role" {
  name = "mongodb-atlas-kms-role"

  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "AWS": "${mongodbatlas_cloud_provider_access_setup.setup_only.aws_config[0].atlas_aws_account_arn}"
        },
        "Action": "sts:AssumeRole",
        "Condition": {
          "StringEquals": {
            "sts:ExternalId": "${mongodbatlas_cloud_provider_access_setup.setup_only.aws_config[0].atlas_assumed_role_external_id}"
          }
        }
      }
    ]
  }
  EOF
}

resource "aws_iam_role_policy" "test_policy" {
  name = "mongodb-atlas-kms-policy"
  role = aws_iam_role.test_role.id

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "kms:Decrypt",
          "kms:Encrypt",
          "kms:DescribeKey"
        ],
        "Resource": [
          "${var.aws_kms_key_arn}",
          "${var.aws_kms_key_arn2}"
        ]
      }
    ]
  }
  EOF
}
