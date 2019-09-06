## STEP 1

1.Install manage package

## STEP 2

Deploy code
`sfdx force:source:deploy -m ApexClass`

## STEP 3

2.goto setup>remote site settings > add http://sb-integration-bs.herokuapp.com
3.goto setup>named cridentials>add

| Label | ProjectService |
| Name | ProjectService |
|URL| https://sb-integration-pms.herokuapp.com/projects|
|Identity Type |Named Principal|
|Authentication Protocol |Password Authentication|
|Username |pmsUser1|
|Password| pmsPass1|
|Generate Authorization Header |Checked|

4.goto setup>custom setings>ServiceCredentials>manage>new>

|label|BillingServiceCredential|
|Username|pmsUser1|
|Password|bsPass1|

5.goto setup>app manager>new conntected app>add

|Connected App Name |ProjectService|
|API Name| ProjectService|
|Contact email| Your email|
|Enable OAuth Settings |Checked|
|Callback URL |https://sb-integration-pms.herokuapp.com/oauth/_callback|
|Selected OAuth Scopes |Full access & Perform requests on your behalf at any time (refresh_token, offline_access)|

6.goto>https://sb-integration-pms.herokuapp.com/>login to org>paste customer key and secrete from connected app and validate
6.text connection
7.copy token
8.goto setup>custom setings>ServiceTokens>manage>new>label=ProjectServiceToken,Token=paste copied code
9.goto setup>external data source>new

|External Data Source |BillingService|
|Name |BillingService|
|Type| Salesforce Connect OData 2.0|
|URL| https://sb-integration-is.herokuapp.com/odata|
|Identity Type |Anonymous|
|Authentication Protocol| No Authentication|

10.validate and sync
11.open invoice table>goto projectRef\_\_c field>edit>change filed type to indirect relation>select project> save
