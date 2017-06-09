#!/bin/bash

set -o errexit

export DOMAIN=jessklein.is
export URL=http://${DOMAIN}/
export SERVER=jeskle2@berzerker.dreamhost.com

hugo --destination $DOMAIN --baseURL $URL

scp -r $DOMAIN ${SERVER}:

echo "Done! Visit $URL to see your awesome site."
