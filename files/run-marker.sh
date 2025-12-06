#!/usr/bin/env bash
set -e -o pipefail

marker \
    --llm_service marker.services.openai.OpenAIService \
    --openai_api_key "$AI_API_KEY" \
    --openai_base_url "$AI_API_URL" \
    --openai_model "$AI_MODEL" \
    --output_dir /media/marker/output \
    --output_format markdown \
    --redo_inline_math \
    --skip_existing \
    --timeout 3600 \
    --use_llm \
    "$@" \
    /media/marker/input
