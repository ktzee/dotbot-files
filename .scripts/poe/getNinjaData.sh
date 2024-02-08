#! /usr/bin/bash

curl "https://poe.ninja/api/data/itemoverview?league=Affliction&type=DeliriumOrb" | jq -c '.lines' | while read -r line; do echo "name: $(echo "$line" | jq -r '.name')";done
