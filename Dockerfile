FROM mcr.microsoft.com/devcontainers/base:ubuntu

ENV PYTHONUNBUFFERED=1 PATH="/home/vscode/.local/bin:${PATH}"

RUN apt-get update \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install --no-install-recommends pipx \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

USER vscode
WORKDIR /home/vscode

RUN pipx install uv
RUN uv python install 3.12
