# S3 bucket iam role
resource "aws_iam_role" "data-analytics-s3-s3-write-access-role" {
  name = "${var.project_name}-${var.env}-write-access-iam-role"
  path = "/service-role/"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [{
      "Effect" : "Allow",
      "Principal" : {
        "Service" : "s3.amazonaws.com"
      },
      "Action" : "sts:AssumeRole",
      "Sid" : ""
    }]
  })
}


# S3 bucket iam policy
resource "aws_iam_policy" "data-analytics-s3-write-access-policy" {
  name        = "data-analytics-s3-write-access-policy"
  description = "write access to s3"
  policy      = data.aws_iam_policy_document.data-analytics-s3-write-access-policy-doc.json
}


# Attach the IAM policy to the IAM role
resource "aws_iam_role_policy_attachment" "data-analytics-s3-s3-write-access-policy-attachment" {
  role       = aws_iam_role.data-analytics-s3-s3-write-access-role.name
  policy_arn = aws_iam_policy.data-analytics-s3-write-access-policy.arn
}

# S3 bucket iam role
resource "aws_iam_role" "data-analytics-s3-s3-read-access-role" {
  name = "${var.project_name}-${var.env}-read-access-iam-role"
  path = "/service-role/"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [{
      "Effect" : "Allow",
      "Principal" : {
        "Service" : "s3.amazonaws.com"
      },
      "Action" : "sts:AssumeRole",
      "Sid" : ""
    }]
  })
}


# S3 bucket iam policy
resource "aws_iam_policy" "data-analytics-s3-read-access-policy" {
  name        = "data-analytics-s3-read-access-policy"
  description = "read access to s3"
  policy      = data.aws_iam_policy_document.data-analytics-s3-read-access-policy-doc.json
}


# Attach the IAM policy to the IAM role
resource "aws_iam_role_policy_attachment" "data-analytics-s3-s3-read-access-policy-attachment" {
  role       = aws_iam_role.data-analytics-s3-s3-read-access-role.name
  policy_arn = aws_iam_policy.data-analytics-s3-read-access-policy.arn
}
