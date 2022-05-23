curl -H 'Content-Type: application/json' -d '{
    "@type": "MessageCard",
    "@context": "http://schema.org/extensions",
    "themeColor": "D7000A",
    "summary": "File Monitor Is Offline",
    "sections": [{
        "activityTitle": "FMSDown: The entimICE-AZ File Monitor is Down!",
        "activitySubtitle": "For Auto Import",
        "facts": [ {
            "name": "Date of Failure",
            "value": "'"$(date)"'"
        }, {
            "name": "Environment",
            "value": "PREPROD"
        }],
        "markdown": true
    }]
 
}' https://outlook.office.com/webhook/42808c96-6a6c-4bfa-9b8a-0411b92b5fde@af8e89a3-d9ac-422f-ad06-cc4eb4214314/IncomingWebhook/6dcd34579a8a4cfdbcacc3f6cfb828d8/76283b65-d857-4f41-bdb6-21a1205804f7

