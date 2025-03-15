{ lib, stdenv, fetchFromGitHub, meson, ninja, pkg-config, vala, glib, bamf, wrapGAppsHook, git
, gnome-settings-daemon, dconf, gtk3, gnome-menus, libgee, libwnck, pango, desktop-file-utils }:

stdenv.mkDerivation rec {
  pname = "plank-reloaded";
  version = "0.11.108";

  src = fetchFromGitHub {
    owner = "zquestz";
    repo = "plank-reloaded";
    rev = "ebbdc78"; # latest commit hash
    sha256 = "23tRf6dvwDa+47lI5hzC6IGwsNWnREN0sw3aJviHNH0=";
  };

  patches = [ ./hide-in-pantheon.patch ];

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    vala
    wrapGAppsHook
    git
  ];

  buildInputs = [
    glib
    bamf
    gnome-settings-daemon
    dconf
    gtk3
    gnome-menus
    libgee
    libwnck
    pango
    desktop-file-utils
  ];

  meta = with lib; {
    description = "A simple dock for X11 environments (fork of Plank)";
    homepage = "https://github.com/zquestz/plank-reloaded";
    license = licenses.mit;
    maintainers = with maintainers; [ thecreativedg ];
    platforms = platforms.linux;
  };
}

