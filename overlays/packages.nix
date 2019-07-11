self: super: {
  branch-server-ssh = super.callPackage ./branch-server-ssh {};

  lorri = let
    src = builtins.fetchGit {
      url = "https://github.com/target/lorri";
      ref = "rolling-release";
    };
  in (import src {
    inherit src;
  }).overrideAttrs(attrs: {
    patches = (attrs.patches or []) ++ [./lorri-ignore-ssl.patch];
  });

  phraseapp_updater = super.callPackage ./phraseapp_updater {};

  neovim-nightly = super.callPackage ./neovim-nightly.nix {};
}
