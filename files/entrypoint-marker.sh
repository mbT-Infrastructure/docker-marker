#!/usr/bin/env bash
set -e -o pipefail

if [[ -z "$AI_API_KEY" ]]; then
  echo "Error: AI_API_KEY is not set." >&2
  exit 1
fi

if [[ -z "$AI_API_URL" ]]; then
  echo "Error: AI_API_URL is not set." >&2
  exit 1
fi

if [[ -z "$SURYA_INFERENCE_URL" ]]; then
    export SURYA_INFERENCE_URL="$AI_API_URL"
fi

if [[ -z "$SURYA_INFERENCE_API_KEY" ]]; then
    export SURYA_INFERENCE_API_KEY="$AI_API_KEY"
fi

mkdir --parents /media/marker/{input,output,models}

exec "$@"
