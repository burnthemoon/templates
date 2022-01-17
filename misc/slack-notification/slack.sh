#!/usr/bin/env bash

if [[ -z "${ENV0_DEPLOYMENT_REVISION}" ]]; then
  REVISION="repository's default branch.\n"
else
  REVISION=$ENV0_DEPLOYMENT_REVISION
fi

#TODO: Change link to prod
DEPLOYMENT_DETAILS="Environment Name: ${ENV0_ENVIRONMENT_NAME}\nRevision: ${REVISION}\n<https://dev.dev.env0.com/p/ENV0_PROJECT_ID/environments/ENV0_ENVIRONMENT_ID/deployments/ENV0_DEPLOYMENT_LOG_ID|View deployment>"
MESSAGE="${1}\n\n${DEPLOYMENT_DETAILS}"
ICON_URL="https://uploads-ssl.webflow.com/5ceab5395d0f478e169de7c0/5f21eb54b57c7a8559c68ff7_Env0-Color%20Icon%403x.png"
PAYLOAD="{\"channel\": \"#${SLACK_CHANNEL}\", \"username\": \"webhookbot\", \"text\": \"${MESSAGE}\", \"icon_url\": \"${ICON_URL}\"}"

curl -X POST --data-urlencode "payload=${PAYLOAD}" ${SLACK_URL}
