## step 1

1.Install managed package

## step 2

deploy code
`sfdx force:source:deploy -m ApexClass,ApexTrigger`

## step 3

2.goto>setup>rename tabs> case > rename to = Maintenance Request

3.goto>setup>rename tabs> Products > rename to =Equipment
4.goto>objectmanager>Maintenance Request>pagelayout asignemnt> edit > assign HowWeRoll page layout to all profiles
5.goto>objectmanager>Equipment>pagelayout asignemnt> edit > assign HowWeRoll page layout to all profiles
6.goto>objectmanager>Maintenance Request > fields> select type> create Repair and activate Routine Maintenance

7.add https://th-superbadge-apex.herokuapp.com/equipment to remote site settings
