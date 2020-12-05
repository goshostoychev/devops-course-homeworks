#!/bin/bash

## Create the aws-prices directory if it doesn't exist
[ ! ~/aws-prices/ ] || mkdir -p ~/aws-prices/

## AWS Base API URL
BASEAPI="https://pricing.us-east-1.amazonaws.com"

## AWS API-1 with regions
API1=https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonRDS/current/region_index.json

## Getting region us-west-1 currentVersionUrl from AWS API1
NEW=$(curl $API1 | jq -r '.regions."us-west-1"."currentVersionUrl"')

## Concatenate the currentVersionUrl to the AWS Base API
RESULT=$BASEAPI$NEW

## Replace json with csv in the link
FINAL=$(echo $RESULT | sed 's/json/csv/g')

## Filter only servers that contain "db.3" and saving the end file with current date
curl $FINAL | grep "db.t3" > ~/aws-prices/"$(date +%Y-%m-%dT%H%M)_rds".csv