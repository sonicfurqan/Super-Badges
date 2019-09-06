## Step 1

1.Install managed package

## Step 2

2.Deploy code
sfdx force:source:deploy -m ApexClass,ApexPage,ApexTrigger,CustomLabel,CustomMetadata,CustomObject

## Step 3

3.gotosetup>object manager>products>fields>Select Product Family >Add Entree, Side, Dessert, Beverage
4.gotosetup>object manager>product>page layout>Add Initial Inventory, Quantity Ordered, and Quantity Remaining fields
5.gotosetup>object manager>Account>page layout>Add Orders realted list
6.gotosetup>object manager>order>page layout>remove contact number field
7.open devloper console>open Constants class>change STANDARD_PRICEBOOK_ID value to any standard price book id
8.open chatter tab>click new group>name=Inventory Announcements,description=Inventory Announcements
9.goto object manager>order>buttons>click edit>override with vf page>save
10.goto object manager>product>buttons>click new and add>override with vf page>save
