#!/usr/bin/env bash
#
# @name         : install.sh
# @version      : 2.0.0
# @date         : 12/05/2019
# @description  : Install le last git version of XXXXX theme for KDE-Plasma.  
# @website      : https://github.com/Rokin05
#
##

set -e

name="darkine"
gh_repo="darkine-kde"


E='echo -e'
OUT="/dev/null"

: "${PREFIX:=/usr}"
: "${uninstall:=false}"



title() {
    $E ; $E "[+]\e[1;33m ${1} \e[m"
    $E "------------------------------------"
}

msg() {
    $E "  - ${1}"
}



_rm() {
    # removes parent directories if empty
    sudo rm -rf "${1}"
    sudo rmdir -p "$(dirname "${1}")" 2>$OUT || true
}

_download() {
    msg "Getting the latest version from GitHub ..."
    msg "(https://github.com/Rokin05/${gh_repo}/archive/master.tar.gz)"
    wget --quiet -O "${temp_file}" \
        "https://github.com/Rokin05/${gh_repo}/archive/master.tar.gz"
    msg "Unpacking archive ..."
    tar -xzf "${temp_file}" -C "${temp_dir}"
}

_uninstall() {
    msg "Deleting ${name^}"
    _rm "${PREFIX}/share/plasma/look-and-feel/${name,,}"
    _rm "${PREFIX}/share/plasma/desktoptheme/${name,,}"
    _rm "${PREFIX}/share/color-schemes/${name^}.colors"
    _rm "${PREFIX}/share/aurorae/themes/${name^}-classic"
    _rm "${PREFIX}/share/aurorae/themes/${name^}-round"
    _rm "${PREFIX}/share/Kvantum/${name^}"
    _rm "${PREFIX}/share/icons/${name,,}"
    _rm "${PREFIX}/share/sddm/themes/${name,,}"
    _rm "${PREFIX}/share/wallpapers/${name^}"
    _rm "${PREFIX}/share/konsole/Darkine.colorscheme"
}

_install() {
    msg "Installing"
    sudo cp -R \
        "${temp_dir}/${gh_repo}-master/plasma" \
        "${temp_dir}/${gh_repo}-master/color-schemes" \
        "${temp_dir}/${gh_repo}-master/aurorae" \
        "${temp_dir}/${gh_repo}-master/Kvantum" \
        "${temp_dir}/${gh_repo}-master/icons" \
        "${temp_dir}/${gh_repo}-master/sddm" \
        "${temp_dir}/${gh_repo}-master/wallpapers" \
        "${temp_dir}/${gh_repo}-master/konsole" \
        "${PREFIX}/share"
}

_cleanup() {
    msg "Clearing cache"
    rm -rf "${temp_file}" "${temp_dir}" \
        ~/.cache/plasma-svgelements-${name,,}* \
        ~/.cache/plasma_theme_${name,,}*.kcache \
        ~/.cache/icon-cache.kcache
}


temp_file="$(mktemp -u)"
temp_dir="$(mktemp -d)"

title "${name^}"
trap _cleanup EXIT HUP INT TERM


if [ "$uninstall" = "false" ]; then
    _download
    _uninstall
    _install
else
    _uninstall
fi