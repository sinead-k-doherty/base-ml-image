FROM python:3.8-slim

RUN apt-get update && \
    apt-get install -y build-essential cmake \
    ffmpeg libsm6 libxext6 pkg-config libx11-dev \
    libatlas-base-dev libgtk-3-dev \ 
    libboost-python-dev 

RUN pip install poetry

RUN mkdir /app

COPY pyproject.toml /app/

WORKDIR /app

RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-root
