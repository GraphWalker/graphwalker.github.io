{
  description = "GraphWalker website development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Astro / Tailwind
            nodejs_22

            # Docs sync pipeline (local rebuild of graphwalker-rs/docs)
            ruby
            bundler
            git

            # Verification
            lychee
          ];

          shellHook = ''
            echo ""
            echo "  GraphWalker website dev shell"
            echo "  ============================="
            echo "  npm run dev     — Start Astro dev server"
            echo "  npm run build   — Build the site to dist/"
            echo ""
            echo "  Docs rebuild:   ./.github/scripts/build-docs.sh \$PWD"
            echo "  Link check:     lychee --offline dist/index.html"
            echo ""
          '';
        };
      });
}
