# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-23.11"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.nodejs
    pkgs.nodePackages.firebase-tools
    pkgs.python3
  ];
  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
    ];
    workspace.onStart = {
      npm-watch-css = "npx tailwindcss -i ./tailwind.input.css -o ./tailwind.css --watch";
    };
    # Enable previews and customize configuration
    previews = {
      enable = true;
      previews = [
        {
          command = ["python3" "-m" "http.server" "$PORT" "--bind" "0.0.0.0"];
          manager = "web";
          id = "web";
        }
      ];
    };
  };
}