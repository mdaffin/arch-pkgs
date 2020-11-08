FROM archlinux

RUN printf "[mdaffin]\
SigLevel = Optional TrustAll\
Server = https://s3.eu-west-2.amazonaws.com/mdaffin-arch/repo/x86_64" >> /etc/pacman.conf

RUN pacman -Syu --noconfirm --noprogressbar --needed \
      base-devel \
      aws-cli \
      jq \
      && pacman --noconfirm -Scc

RUN useradd --create-home --user-group --shell /bin/bash builder
RUN echo "builder ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/builder
USER builder:builder
