data "aws_caller_identity" "current" {}


data "aws_iam_policy_document" "data-analytics-s3-write-access-policy-doc" {
  statement {
    effect  = "Allow"
    actions = ["s3:GetObject", "s3:ListObject", "s3:PutObject"]
    resources = [
      "${module.dpa_poc_bucket[0].s3_bucket_arn}",
      "${module.dpa_poc_bucket[0].s3_bucket_arn}/*"
    ]
  }
}

data "aws_iam_policy_document" "data-analytics-s3-read-access-policy-doc" {
  statement {
    effect  = "Allow"
    actions = ["s3:GetObject", "s3:ListObject"]
    resources = [
      "${module.dpa_poc_bucket[0].s3_bucket_arn}",
      "${module.dpa_poc_bucket[0].s3_bucket_arn}/*"
    ]
  }
}


data "aws_iam_policy_document" "storage_iam_s3_policy" {
  statement {
    effect = "Deny"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = ["s3:DeleteObject*"]
    resources = [
      "${module.dpa_poc_bucket[0].s3_bucket_arn}",
      "${module.dpa_poc_bucket[0].s3_bucket_arn}/*"
    ]
  }
  statement {
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.account_id}:role/aws_iam_role.data-analytics-s3-s3-write-access-role.name", "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/aws_iam_role.data-analytics-s3-s3-write-access-role.name"]
    }
    actions = ["s3:GetObject", "s3:ListObject*", "s3:PutObject*"]
    resources = [
      "${module.dpa_poc_bucket[0].s3_bucket_arn}",
      "${module.dpa_poc_bucket[0].s3_bucket_arn}/*"
    ]
    condition {
      test     = "StringEquals"
      variable = var.user_access
      values   = ["write"]
    }
  }

  statement {
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.account_id}:role/aws_iam_role.data-analytics-s3-s3-read-access-role.name", "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/aws_iam_role.data-analytics-s3-s3-read-access-role.name"]
    }
    actions = ["s3:GetObject", "s3:ListObject*"]
    resources = [
      "${module.dpa_poc_bucket[0].s3_bucket_arn}",
      "${module.dpa_poc_bucket[0].s3_bucket_arn}/*"
    ]
    condition {
      test     = "StringEquals"
      variable = var.user_access
      values   = ["read"]
    }
  }
  #depends_on = [module.dpa_poc_bucket]
}
