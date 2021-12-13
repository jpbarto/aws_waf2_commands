#!/usr/bin/env bash

set -e

RSRC_ARN=""
REGION="eu-west-1"
API_ID="g8jk2lo2w3"
STAGE_NAME="v2"

ARN=$(aws wafv2 create-web-acl --cli-input-json file:///tmp/create-wacl-slim.json --query 'Summary.ARN' --region ${REGION})
aws wafv2 associate-web-acl --resource-arn arn:aws:apigateway:${REGION}::/restapis/${API_ID}/stages/${STAGE_NAME} --web-acl-arn ${ARN} --region ${REGION}
