# syntax=docker/dockerfile:1
FROM python:3.10-slim

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# RUN apt-get update -qq && \
#     apt-get install -y --no-install-recommends \
#     g++ \
#     build-essential \
#     && apt-get clean && \
#     rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN pip install --upgrade pip && pip install pipenv

COPY ./Pipfile Pipfile
COPY ./Pipfile.lock Pipfile.lock
RUN set -ex && pipenv install --deploy --system --clear

COPY ./app/ /app/

CMD [ "uvicorn", "main:app" ]
