FROM archlinux

RUN pacman -Syu --noconfirm --noprogressbar --needed \
      base-devel \
      aws-cli \
      jq \
      && pacman --noconfirm -Sc

RUN useradd --create-home --user-group --shell /bin/bash builder
RUN echo "builder ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/builder
USER builder:builder
