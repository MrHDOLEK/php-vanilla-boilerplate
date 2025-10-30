let
    nixpkgs = fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/41239f03433fe534c51a1526bed9214ab2a3582f.tar.gz";
    };

    lockedPkgs = import nixpkgs {
        config = {
            allowUnfree = true;
        };
    };
in
{
    pkgs ? lockedPkgs,
    php-version ? 8.4,
    with-xdebug ? false,
}:

let
    base-php = if php-version == 8.4 then
        pkgs.php84
    else
        throw "Unknown php version ${php-version}";

    php = base-php.buildEnv {
        extensions = { enabled, all }: enabled ++ [
            all.opcache
            all.mbstring
            all.curl
            all.openssl
        ]
        ++ pkgs.lib.optional with-xdebug all.xdebug;

        extraConfig = pkgs.lib.optionalString with-xdebug ''
            xdebug.mode = debug
            xdebug.start_with_request = yes
            xdebug.client_host = 127.0.0.1
            xdebug.client_port = 9003
        '';
    };
in
pkgs.mkShell {
    buildInputs = [
        php
        php.packages.composer
        pkgs.starship
        pkgs.figlet
        pkgs.symfony-cli
        pkgs.act
    ];

    shellHook = ''
        if [ -f "$PWD/.nix/shell/starship.toml" ]; then
            export STARSHIP_CONFIG="$PWD/.nix/shell/starship.toml"
        else
            export STARSHIP_CONFIG="$PWD/.nix/shell/starship.toml.dist"
        fi

        eval "$(${pkgs.starship}/bin/starship init bash)"

        clear
        figlet "PHP VANILLA BOILERPLATE"

        ${pkgs.lib.optionalString with-xdebug ''
            echo "⚡ Xdebug enabled on port 9003"
        ''}
    '';
}