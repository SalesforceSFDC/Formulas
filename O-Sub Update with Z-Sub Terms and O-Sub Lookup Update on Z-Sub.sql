OR(
AND(
ISNEW(),
ISBLANK([Subscription__c].Zuora_Subscription__c) = FALSE
),

AND(
ISCHANGED([Subscription__c].Zuora_Subscription__c),
ISBLANK([Subscription__c].Zuora_Subscription__c) = FALSE
)
)
