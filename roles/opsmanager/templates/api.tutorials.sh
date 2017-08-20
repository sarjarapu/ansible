#!/bin/sh

# get groups 
curl -u "shyam.arjarapu@10gen.com:0c72df21-3154-46d6-9db2-2de40d496ce7" "http://ec2-54-214-214-22.us-west-2.compute.amazonaws.com:8080/api/public/v1.0/groups" --digest -X GET

# create new group
curl -u "shyam.arjarapu@10gen.com:0c72df21-3154-46d6-9db2-2de40d496ce7" -H "Content-Type: application/json" "http://ec2-54-214-214-22.us-west-2.compute.amazonaws.com:8080/api/public/v1.0/groups" --digest -i -X POST --data '
{
   "name": "opsmgs_auto"
}'


# 5998d2fcbba0ea27746e067d
# 747862e5601e5eda9ff73077cb69d331

# create a new user as group owner for above group
curl -u "shyam.arjarapu@10gen.com:0c72df21-3154-46d6-9db2-2de40d496ce7" -H "Content-Type: application/json" "http://ec2-54-214-214-22.us-west-2.compute.amazonaws.com:8080/api/public/v1.0/users" --digest -i -X POST --data '
{
   "username": "shyam.arjarapu@gmail.com",
   "emailAddress": "shyam.arjarapu@gmail.com",
   "firstName": "Shyam",
   "lastName": "Arjarapu",
   "password": "p@$$w0rd",
   "roles": [{
     "groupId": "5998d2fcbba0ea27746e067d",
     "roleName": "GROUP_OWNER"
   }]
}'

# Retrieve the automation configuration from Ops Manager
curl -u "shyam.arjarapu@10gen.com:0c72df21-3154-46d6-9db2-2de40d496ce7" "http://ec2-54-214-214-22.us-west-2.compute.amazonaws.com:8080/api/public/v1.0/groups/5998d2fcbba0ea27746e067d/automationConfig" --digest -i

# Send the updated automation configuration.
curl -u "shyam.arjarapu@10gen.com:0c72df21-3154-46d6-9db2-2de40d496ce7" -H "Content-Type: application/json" "http://ec2-54-214-214-22.us-west-2.compute.amazonaws.com:8080/api/public/v1.0/groups/5998d2fcbba0ea27746e067d/automationConfig" --digest -i -X PUT --data @/Users/shyamarjarapu/Code/work/git-hub/sarjarapu/ansible/roles/opsmanager/templates/automation.config.json

