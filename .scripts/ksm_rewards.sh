#!/usr/bin/bash

# Adds together the numbers in the "Rewards" (5th) column of a CSV generated from subscan.io
awk -F',' '$NF == "staking(Reward)" { sum += $(NF-1) } END { print sum}' $1
