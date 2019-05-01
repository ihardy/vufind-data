#!/usr/bin/env bash
# example usage
# ./import.sh diku $TOKEN
tenant=${1:-demo_tenant}
token=$2
okapi=http://localhost:9130
item_storage_address=${okapi}/item-storage/items
instance_storage_address=${okapi}/instance-storage/instances
instance_relationship_storage_address=${okapi}/instance-storage/instance-relationships
holdings_storage_address=${okapi}/holdings-storage/holdings

tar xzf data.tar.gz

for f in ./data/instances/*.json; do
    curl -w '\n' -X POST -D - \
         -H "Content-type: application/json" \
         -H "X-Okapi-Tenant: ${tenant}" \
         -H "X-Okapi-Token: ${token}" \
         -d @$f \
         "${instance_storage_address}"
done

for f in ./data/holdingsrecords/*.json; do
    curl -w '\n' -X POST -D - \
         -H "Content-type: application/json" \
         -H "X-Okapi-Tenant: ${tenant}" \
         -d @$f \
         "${holdings_storage_address}"
done

for f in ./data/items/*.json; do
    curl -w '\n' -X POST -D - \
         -H "Content-type: application/json" \
         -H "X-Okapi-Tenant: ${tenant}" \
         -d @$f \
         "${item_storage_address}"
done
