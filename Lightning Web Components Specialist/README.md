# Step 1

1. Create org and get it connected with vs code

# step 2

1.  install package provided in instruction of super badge

Deploy

1.  `https://login.salesforce.com/packaging/installPackage.apexp?p0=04t6g000008ateoAAA&_ga=2.264719503.1068237350.1662973814-291059715.1656060801`


# Step 3

1. Create lds message channel BoatMessageChannel
2. Create app Friend Ships  
3. Create page Friend Ships

Deploy 

1.  `force-app\main\default\messageChannels\BoatMessageChannel.messageChannel-meta.xml`
2. `force-app\main\default\applications\Friend_Ships.app-meta.xml`
3. `force-app\main\default\flexipages\Friend_Ships.flexipage-meta.xml`

# Step 4

1. Add AuraEnabled and cacheable to apex methods in BoatDataService class

Deploy 

1. `force-app\main\default\classes\BoatDataService.cls`


# Step 5

1. Create lwc component "boatSearch","boatSearchForm","boatTile","boatSearchResults","boatsNearMe","boatDetailTabs","boatAddReviewForm","boatReviews"
2. retrieve "boatMap","fiveStarRating"

Deploy

1. `force-app\main\default\lwc`

