{
  zola,
  lib,
  stdenv,
  ...
}:
stdenv.mkDerivation {
  pname = "elmskell-blog";
  version = "0.1.0";
  src = ./.;
  nativeBuildInputs = [
    zola
  ];
  configurePhase = ''
    # zola check
  '';
  buildPhase = ''
    zola build
  '';
  installPhase = ''
    mkdir -p $out/wwwroot
    cp ./public/* $out/wwwroot/ -r
  '';
  meta = {
    description = "Andromeda's blog, statically served via Zola";
    longDescription = "Andromeda's blog, statically served via Zola";
    homepage = "https://mtgmonkey.net";
    license = lib.licenses.wtfpl;
  };
}
