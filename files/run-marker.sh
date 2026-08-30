#!/usr/bin/env bash
set -e -o pipefail

marker \
    --llm_service marker.services.openai.OpenAIService \
    --max_concurrency 1 \
    --max_retries 10 \
    --mode balanced \
    --openai_api_key "$AI_API_KEY" \
    --openai_base_url "$AI_API_URL" \
    --openai_model "$AI_MODEL" \
    --OpenAIService_openai_image_format png \
    --output_dir /media/marker/output \
    --output_format markdown \
    --redo_inline_math \
    --retry_wait_time 120 \
    --skip_existing \
    --timeout 3600 \
    --use_llm \
    "$@" \
    /media/marker/input
