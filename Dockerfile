FROM alpine:3.20.2

RUN apk add curl xz git
RUN addgroup -S nixbld && adduser -S nix -G nixbld
# USER nix
RUN mkdir -m 0755 /nix && chown root /nix
WORKDIR /root
RUN curl -LO https://nixos.org/nix/install && chmod +x install
RUN ./install --no-daemon
ENV USER=root
ENV ENV="/root/.alpineprofile"
COPY profile $ENV
RUN mkdir /etc/nix
RUN echo "experimental-features = nix-command flakes" > /etc/nix/nix.conf

# RUN mkdir -p /root/.config/nix
# RUN mkdir -p /nix/var/nix/{profiles,gcroots}/per-user/root/
# RUN echo "experimental-features = nix-command flakes" > /root/.config/nix/nix.conf
# RUN nix-env -q | xargs -L1 nix-env --set-flag priority 10
# RUN nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
RUN git config --global --add safe.directory /work
# RUN . $ENV \
#     && nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz home-manager \
#     && nix-channel --update \
#     && nix-shell '<home-manager>' -A install \
