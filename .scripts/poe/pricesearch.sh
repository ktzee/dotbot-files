#! /usr/bin/bash

league="Affliction"
declare -a item_type=("DeliriumOrb" "Scarab" "Currency" "Fragment" "Oil" "Essence" "Fossil" "DivinationCard" "UniqueWeapon")

selection=$(printf '%s\n' "${item_type[@]}" | dmenu -i)
# there are 2 main endpoints: /itemoverview and /currencyoverview
url="https://poe.ninja/api/data/itemoverview?league=$league&type=$selection"
url2="https://poe.ninja/api/data/currencyoverview?league=$league&type=$selection"

case $selection in
  Currency | Fragment)
    curl -s "$url2" | jq -r '.lines[] | .currencyTypeName + "*" + (.receive.value|tostring[0:6]) + "c"' | column -ts "*" | dmenu -i;;
  DeliriumOrb | Scarab | Oil | Essence | Fossil | DivinationCard | UniqueWeapon)
    curl -s "$url" | jq -rc '.lines[] | .name + " - " + (.chaosValue | tostring) + "c - " + (.divineValue | tostring) + "d"' | column -ts "-" | dmenu -i;;
esac

