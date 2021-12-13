#!/usr/bin/env bash

set -e

REGION="eu-west-1"
API_ID="g8jk2lo2w3"
STAGE_NAME="v2"
RSRC_ARN="arn:aws:apigateway:${REGION}::/restapis/${API_ID}/stages/${STAGE_NAME}"

ARN=$(aws wafv2 create-web-acl --cli-input-json file://create-wacl-slim.json --query 'Summary.ARN' --region ${REGION})
aws wafv2 associate-web-acl --resource-arn ${RSRC_ARN} --web-acl-arn ${ARN} --region ${REGION}
