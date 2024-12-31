#!/usr/bin/env bash
# This script sets the correct environment variables, to be able to run tofu commands with the gcp backend.


# decrypt sops gcs sercrets and export them into a file that is not tracked by git
echo "setting GOOGLE_BACKEND_CREDENTIALS env variable"
export GOOGLE_BACKEND_CREDENTIALS=`sops decrypt --output-type json ./00_secrets/gcs_secrets.sops.yaml`