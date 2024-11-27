FROM mcr.microsoft.com/devcontainers/base:ubuntu

ENV PYTHONUNBUFFERED=1
ENV VOLTA_HOME="/home/vscode/.volta"
ENV PATH="${VOLTA_HOME}/bin:/home/vscode/.local/bin:${PATH}"

USER vscode
WORKDIR /home/vscode

# Install os packages and development stack tooling
RUN sudo apt-get update \
  && export DEBIAN_FRONTEND=noninteractive \
  && sudo apt-get -y install --no-install-recommends \
    pipx \
  && sudo apt-get clean \
  && sudo rm -rf /var/lib/apt/lists/* \
  && pipx install uv \
  && curl https://get.volta.sh | bash -s -- --skip-setup

RUN uv python install 3.12 \
  && volta install \
    node@lts \
    pnpm@latest \
    typescript@latest \
    expo@latest \
    turbo@latest
