#! /bin/bash

EXTENSION="${4:-_md5}"
BUCKET_NAME="${2:-mprm-static-data}"
BUCKET_LOCATION="${3:-/}"

fileName="$1"

md5sum $fileName | awk '{print $1}' > "${fileName}${EXTENSION}"
aws s3 cp $fileName "s3://${BUCKET_NAME}${BUCKET_LOCATION}" --acl public-read
aws s3 cp "${fileName}${EXTENSION}" "s3://${BUCKET_NAME}${BUCKET_LOCATION}" --acl public-read
