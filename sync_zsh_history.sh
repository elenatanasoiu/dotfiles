#!/bin/sh

set -e

echo "Copying zsh_history file"

echo "Introduce AWS Key ID"
read key_id

echo "Introduce AWS Secret Access Key"
read secret_access_key_id

AWS_ACCESS_KEY_ID=$key_id AWS_SECRET_ACCESS_KEY=$secret_access_key_id \
aws s3 cp s3://elenas-backups/zsh_history ~/.zsh_history

