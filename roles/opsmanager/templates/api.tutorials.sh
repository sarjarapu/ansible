#!/bin/sh

owner='shyam.arjarapu@10gen.com'
ownerApiKey='0c72df21-3154-46d6-9db2-2de40d496ce7'
url='ec2-54-214-214-22.us-west-2.compute.amazonaws.com:8080'
group_id='5998d2fcbba0ea27746e067d'

username='shyam.arjarapu@10gen.com'
apiKey='0c72df21-3154-46d6-9db2-2de40d496ce7'

# get groups 
curl -u "$owner:$ownerApiKey" "http://$url/api/public/v1.0/groups" --digest -X GET

# create new group
curl -u "$owner:$ownerApiKey" -H "Content-Type: application/json" "http://$url/api/public/v1.0/groups" --digest -i -X POST --data '
{
   "name": "opsmgs_auto"
}'


# 5998d2fcbba0ea27746e067d
# 747862e5601e5eda9ff73077cb69d331

# create a new user as group owner for above group
curl -u "$owner:$ownerApiKey" -H "Content-Type: application/json" "http://$url/api/public/v1.0/users" --digest -i -X POST --data '
{
   "username": "shyam.arjarapu@gmail.com",
   "emailAddress": "shyam.arjarapu@gmail.com",
   "firstName": "Shyam",
   "lastName": "Arjarapu",
   "password": "p@$$w0rd",
   "roles": [{
     "group_id": "$group_id",
     "roleName": "GROUP_OWNER"
   }]
}'

# Retrieve the automation configuration from Ops Manager
curl -u "$username:$apiKey" "http://$url/api/public/v1.0/groups/$group_id/automationConfig" --digest -i

# Send the updated automation configuration.
curl -u "$username:$apiKey" -H "Content-Type: application/json" "http://$url/api/public/v1.0/groups/$group_id/automationConfig" --digest -i -X PUT --data @/Users/shyamarjarapu/Code/work/git-hub/sarjarapu/ansible/roles/opsmanager/templates/automation.config.json

# Confirm successful update of the automation configuration.
curl -u "$username:$apiKey" "http://$url/api/public/v1.0/groups/$group_id/automationConfig" --digest -i


# Verify that the configuration update is deployed.
curl -u "$username:$apiKey" "http://$url/api/public/v1.0/groups/$group_id/automationStatus" --digest -i

curl -u "$username:$apiKey" "http://$url/api/public/v1.0/groups/$group_id/automationConfig?pretty=true" --digest -i > get.automation.config.json

# 2017-08-21T23:16:04.590+0000 E -        [mongosMain] error upgrading config database to v6 :: caused by :: newer version 6 of mongo config metadata is required, current version is 5, need to run mongos with --upgrade
# {"detail":"Invalid automation config: Unable to upgrade from the MongoDB 2.6 series to the 3.2 series. Please upgrade to 3.0 first","error":400,"errorCode":null,"parameters":null,"reason":"Bad Request"}shyam-macbook:templates shyamarjarapu$ curl -u "$username:$apiKey" -H "Content-Type: application/json" "http://$url/api/public/v1. --digest -i -X PUT --data @/Users/shyamarjarapu/Code/work/git-hub/sarjarapu/ansible/roles/opsmanager/templates/get.automation.config.json

