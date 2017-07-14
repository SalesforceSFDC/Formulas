AND(
  [Subscription__c].Contract_End_Date__c <= TODAY() + 180,
  [Subscription__c].Contract_End_Date__c >= TODAY() + 5,
  NOT(ISBLANK([Subscription__c].Zuora_Subscription__c)),
  [Subscription__c].Zuora_Subscription__r.Zuora__Status__c = "Active",
  NOT(CONTAINS([Subscription__c].Testing_Product_zSub__c, "starter:gold:silver:bronze")),
  ISBLANK([Subscription__c].Open_Opportunity__c),
  OR(
    ISCHANGED([Subscription__c].Last_Synced_Hermes__c),
    AND(
      ISCHANGED([Subscription__c].Date_Last_Opportunity_Closed__c),
      NOT(ISBLANK([Subscription__c].Date_Last_Opportunity_Closed__c)),
      [Subscription__c].Date_Last_Opportunity_Closed__c <> TODAY()
    )
  )
)
