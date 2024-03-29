FROM python:3.11

ENV PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100

RUN pip install "poetry"

WORKDIR /app/server/
COPY pyproject.toml /app/server/

RUN poetry config virtualenvs.create false \
  &&  poetry install --no-interaction --no-ansi --no-root

ADD . /app/server/
