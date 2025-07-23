{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "CatalogAccess",
            "Effect": "Allow",
            "Action": "glue:GetDatabase",
            "Resource": [
                "arn:aws:glue:sa-east-1:475057824718:catalog",
                "arn:aws:glue:sa-east-1:475057824718:database/orion_dev"
            ]
        },
        {
            "Sid": "TableAccess",
            "Effect": "Allow",
            "Action": [
                "glue:GetTable",
                "glue:GetTables"
            ],
            "Resource": "arn:aws:glue:sa-east-1:475057824718:table/orion_dev/*"
        },
        {
            "Sid": "CrawlerAccess",
            "Effect": "Allow",
            "Action": [
                "glue:GetCrawler",
                "glue:GetCrawlers"
            ],
            "Resource": "arn:aws:glue:sa-east-1:475057824718:crawler/*"
        },
        {
            "Sid": "JobAccess",
            "Effect": "Allow",
            "Action": [
                "glue:GetJob",
                "glue:GetJobs"
            ],
            "Resource": "arn:aws:glue:sa-east-1:475057824718:job/*"
        },
        {
            "Sid": "GeneralGlueActions",
            "Effect": "Allow",
            "Action": [
                "glue:GetDataCatalogEncryptionSettings",
                "glue:GetTags"
            ],
            "Resource": "*"
        }
    ]
}