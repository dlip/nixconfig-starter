FROM nixos/nix:2.19.2

RUN mkdir -p /root/.config/nix
RUN mkdir -p /nix/var/nix/{profiles,gcroots}/per-user/root/
RUN echo "experimental-features = nix-command flakes" > /root/.config/nix/nix.conf
RUN nix-env -q | xargs -L1 nix-env --set-flag priority 10
RUN nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
RUN nix-channel --update
RUN nix-shell '<home-manager>' -A install
