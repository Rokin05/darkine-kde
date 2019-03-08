#!/usr/bin/env bash

set -e

gh_repo="darkine-kde"
gh_desc="Darkine KDE"

cat <<- EOF


    ______              _     _             
   (______)            | |   (_)            
    _     _ _____  ____| |  _ _ ____  _____ 
   | |   | (____ |/ ___) |_/ ) |  _ \| ___ |
   | |__/ // ___ | |   |  _ (| | | | | ____|
   |_____/ \_____|_|   |_| \_)_|_| |_|_____)



  $gh_desc
  https://github.com/Rokin05/$gh_repo


EOF

PREFIX=${PREFIX:=/usr}
uninstall=${uninstall:-false}

_msg() {
    echo "=>" "$@" >&2
}

_rm() {
    # removes parent directories if empty
    sudo rm -rf "$1"
    sudo rmdir -p "$(dirname "$1")" 2>/dev/null || true
}

_download() {
    _msg "Getting the latest version from GitHub ..."
    wget -O "$temp_file" \
        "https://github.com/Rokin05/$gh_repo/archive/master.tar.gz"
    _msg "Unpacking archive ..."
    tar -xzf "$temp_file" -C "$temp_dir"
}

_uninstall() {
    _msg "Deleting $gh_desc ..."
    _rm "$PREFIX/share/aurorae/themes/Darkine"
    _rm "$PREFIX/share/color-schemes/Darkine.colors"
    _rm "$PREFIX/share/Kvantum/Darkine"
    _rm "$PREFIX/share/plasma/desktoptheme/Darkine"
    _rm "$PREFIX/share/plasma/look-and-feel/org.kde.darkine"
    _rm "$PREFIX/share/wallpapers/Darkine"
    _rm "$PREFIX/share/sddm/themes/Darkine"
}

_install() {
    _msg "Installing ..."
    sudo cp -R \
        "$temp_dir/$gh_repo-master/aurorae" \
        "$temp_dir/$gh_repo-master/color-schemes" \
        "$temp_dir/$gh_repo-master/Kvantum" \
        "$temp_dir/$gh_repo-master/plasma" \
        "$temp_dir/$gh_repo-master/wallpapers" \
        "$temp_dir/$gh_repo-master/sddm" \
        "$PREFIX/share"
}

_cleanup() {
    _msg "Clearing cache ..."
    rm -rf "$temp_file" "$temp_dir" \
        ~/.cache/plasma-svgelements-Darkine* \
        ~/.cache/plasma_theme_Darkine*.kcache
    _msg "Done!"
}

trap _cleanup EXIT HUP INT TERM

temp_file="$(mktemp -u)"
temp_dir="$(mktemp -d)"

if [ "$uninstall" = "false" ]; then
    _download
    _uninstall
    _install
else
    _uninstall
fi
 
