FROM madebytimo/builder AS python-packages

WORKDIR /root/builder

RUN apt update -qq && apt install -y -qq libjpeg-dev \
    && rm -rf /var/lib/apt/lists/*
RUN pip3-latest install --prefix /root/builder/python marker-pdf[full]
RUN pip3-latest install --prefix /root/builder/python psutil


FROM madebytimo/python

RUN apt update -qq && apt install -y -qq libjpeg62-turbo libxcb1 \
    && rm -rf /var/lib/apt/lists/* \
    \
    && mkdir --parents /media/marker/{input,output,models} \
    && chown --recursive user:user /media/marker \
    && mkdir /usr/local/lib/python3.14/site-packages/static \
    && chmod 777 /usr/local/lib/python3.14/site-packages/static

COPY --from=python-packages /root/builder/python /usr/local
COPY files/entrypoint.sh files/run-marker.sh /usr/local/bin/

ENV AI_API_KEY=""
ENV AI_API_URL=""
ENV AI_MODEL=default
ENV MODEL_CACHE_DIR=/media/marker/models

USER user
WORKDIR /media/marker
ENTRYPOINT [ "entrypoint.sh" ]
CMD [ "run-marker.sh" ]

HEALTHCHECK CMD [ "healthcheck.sh" ]

LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.source="https://github.com/mbt-infrastructure/docker-marker"
