FROM mcr.microsoft.com/devcontainers/base:ubuntu

ENV PYTHONUNBUFFERED=1 PATH="/home/vscode/.local/bin:${PATH}"

USER vscode
WORKDIR /home/vscode

RUN sudo apt-get update \
  && export DEBIAN_FRONTEND=noninteractive \
  && sudo apt-get -y install --no-install-recommends pipx \
  && sudo apt-get clean \
  && sudo rm -rf /var/lib/apt/lists/* \
  && pipx install uv 

RUN uv python install 3.12
