#!/bin/bash
# Yet another Cloudflare DNS record update tool
# https://github.com/UpInSmoke-FC

AVATAR="https://github.com/actions.png"

# Script Arguments
# Pass the follwing Values as Arguments in this order
# 1: files
# 2: CF_API_KEY
# 3: CF_API_EMAIL
## EXAMPLE: bash import.sh $files $CF_API_KEY $CF_API_EMAIL

# import function
function IMPORT () {
  curl --request POST \
    --url https://api.cloudflare.com/client/v4/zones/$1/dns_records/import \
    --header "X-Auth-Key: $2" \
    --header "X-Auth-Email: $3" \
    --header "Content-Type: application/json" \
    --form 'file=@'"$4"''
}

# get the zone ID of a zone / domain
function GETZONEID() {
  curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=$1" \
	  --header "X-Auth-Key: $2" --header "X-Auth-Email: $3" \
	  --header "Content-Type: application/json" \
	  | jq .result[].id -r
}

# Loop over each file and call the functions
for f in $1; do
    domain="${f%.*}"
    ZONE_ID= GETZONEID "$domain" "$2" "$3"
    echo "$zone_id | $domain"
    if [[ "$f" != *.* ]]; then
        echo "Importing Zone File: $f"
        IMPORT "$zone_id" "$2" "$3" "$f"
        jq .result[].total_record_parsed -r
    fi
done