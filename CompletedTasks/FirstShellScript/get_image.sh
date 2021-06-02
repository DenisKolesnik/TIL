#!/usr/bin/env bash

args=("$@")

request=$(curl -X POST -F 'username='"${args[0]}"'' -F 'password=secret' localhost:8000/auth)

token=$(jq -r '.access_token' <<<"$request")

image=$(curl -X GET localhost:8000/image -H "Accept: application/json" -H "Authorization: Bearer $token" -o "${args[1]}")
