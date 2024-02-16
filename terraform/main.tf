provider "aws" {}

resource "aws_sns_topic" "tf_sns_topic_123" {
  name = "tf_sns_topic_123"
}

resource "aws_sqs_queue" "tf_sqs_queue_123" {
  name          = "tf_sqs_queue_123"
  delay_seconds = 2
}

resource "aws_sns_topic_subscription" "tf_sqs_sns_subscription_123" {
  endpoint  = aws_sqs_queue.tf_sqs_queue_123.arn
  protocol  = "sqs"
  topic_arn = aws_sns_topic.tf_sns_topic_123.arn
}

data "aws_iam_policy_document" "allow_message_publishing" {
  statement {
    sid    = "First"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["sns.amazonaws.com"]
    }

    actions   = ["sqs:SendMessage"]
    resources = [aws_sqs_queue.tf_sqs_queue_123.arn]

    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values   = [aws_sns_topic.tf_sns_topic_123.arn]
    }
  }
}

resource "aws_sqs_queue_policy" "test" {
  queue_url = aws_sqs_queue.tf_sqs_queue_123.id
  policy    = data.aws_iam_policy_document.allow_message_publishing.json
}
