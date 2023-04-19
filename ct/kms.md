Addition to kms policy for CT

{
    "Sid": "Allow CloudTrail and AWS Config to encrypt/decrypt logs",
    "Effect": "Allow",
    "Principal": {
      "Service": [
        "cloudtrail.amazonaws.com",
        "config.amazonaws.com"
     ]
    },
     "Action": [
        "kms:GenerateDataKey",
        "kms:Decrypt"
     ],
      "Resource": "*"
  }
  