FROM python:3.14.0a3-alpine AS recon-ng

RUN mkdir -p /recon-ng

WORKDIR /recon-ng

COPY ./REQUIREMENTS /recon-ng/REQUIREMENTS

RUN apk add --no-cache --virtual .build-deps gcc libc-dev libxslt-dev &&\
    apk add --no-cache libxslt &&\
    pip install --no-cache-dir -r REQUIREMENTS &&\
    apk del .build-deps
