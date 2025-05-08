variable "atlas_project_id" {
  description = "The project ID for MongoDB Atlas"
  type        = string
}
variable "atlas_public_key" {
  description = "The public API key for MongoDB Atlas"
  type        = string
}
variable "atlas_private_key" {
  description = "The private API key for MongoDB Atlas"
  type        = string
  sensitive   = true
}
variable "atlas_cluster_name" {
  description = "The name of the cluster"
  type        = string
}
variable "atlas_aws_region" {
  type        = string
  description = "Region in which the Encryption At Rest private endpoint is located."
  default     = "US_EAST_1" //change the region name to the one you want
}
variable "atlas_aws_region2" {
  type        = string
  description = "Region in which the Encryption At Rest private endpoint is located."
  default     = "US_EAST_2" //change the region name to the one you want

}

variable "aws_kms_key_arn" {
  type        = string
  description = "The full ARN of the KMS key in primary region."
}
variable "aws_kms_key_arn2" {
  type        = string
  description = "The full ARN of the KMS key in secondary region."
}
variable "aws_kms_key_id" {
  type        = string
  description = "The KMS key ID for AWS"
}
variable "access_key" {
  description = "The access key for AWS Account"
  type        = string
}
variable "secret_key" {
  description = "The secret key for AWS Account"
  type        = string
  sensitive   = true
}
variable "aws_region" {
  type        = string
  description = "AWS Region"
}
