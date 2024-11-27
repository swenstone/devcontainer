FROM fedora:41

ENV PYTHONUNBUFFERED=1
ENV VOLTA_HOME="/home/swenstone/.volta" VOLTA_FEATURE_PNPM=1
ENV PATH="${VOLTA_HOME}/bin:/home/swenstone/.local/bin:${PATH}"

# Install os packages and add swenstone user 
RUN useradd -c swenstone -d /home/swenstone -m -s /bin/bash -u 1000 swenstone \
  && echo "swenstone ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER swenstone
WORKDIR /home/swenstone

# Install os packages and development stack tooling
RUN sudo dnf upgrade -y \
  && sudo dnf install -y \
    pipx \
  && sudo dnf clean -y all \
  && pipx install uv \
  && curl https://get.volta.sh | bash -s -- --skip-setup

RUN uv python install 3.12 \
  && volta install \
    node@lts \
    pnpm@latest \
    typescript@latest \
    expo@latest \
    turbo@latest

CMD ["sleep", "infinity"]
