<p align="center">
  <img src="https://raw.githubusercontent.com/Rokin05/darkine-kde/master/INFO/screenshots/preview.1.png" alt="Preview Darkine KDE"/>
  <a href="https://raw.githubusercontent.com/Rokin05/darkine-kde/master/INFO/screenshots/preview.2.png"><img src="https://raw.githubusercontent.com/Rokin05/darkine-kde/master/INFO/screenshots/thumbs/mini.preview.2.png" alt="Preview Darkine KDE"/></a> <a href="https://raw.githubusercontent.com/Rokin05/darkine-kde/master/INFO/screenshots/preview.3.png"><img src="https://raw.githubusercontent.com/Rokin05/darkine-kde/master/INFO/screenshots/thumbs/mini.preview.3.png" alt="Preview Darkine KDE"/></a> <a href="https://raw.githubusercontent.com/Rokin05/darkine-kde/master/INFO/screenshots/preview.4.png"><img src="https://raw.githubusercontent.com/Rokin05/darkine-kde/master/INFO/screenshots/thumbs/mini.preview.4.png" alt="Preview Darkine KDE"/></a>
</p><p align="center">
  <sup><sub>Screenshot Details: Engine: <a href="https://github.com/tsujan/Kvantum/tree/master/Kvantum">Kvantum</a> | Kvantum Theme: Darkine | Aurorae decoration: Darkine | Plasma Theme: Darkine | Icons: <a href="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme">Papirus-Adapta-Nokto</a> | Dock: <a href="https://github.com/psifidotos/Latte-Dock">Latte Dock</a></sub></sup></p>

Darkine KDE - This is a theme based on [Adapta KDE](https://github.com/PapirusDevelopmentTeam/adapta-kde) for Plasma 5 desktop.

In this repository you'll find:

- Aurorae Theme
- Kvantum Themes
- Plasma Color Schemes
- Plasma Desktop Theme
- Plasma Look-and-Feel Settings
- SDDM Theme
- Wallpaper

## Installation

Use the script to install the latest version directly from this repo (independently on your distro):

#### Install

```
wget -qO- https://raw.githubusercontent.com/Rokin05/darkine-kde/master/install.sh | sh
```


#### Uninstall

```
wget -qO- https://raw.githubusercontent.com/Rokin05/darkine-kde/master/install.sh | uninstall=true sh
```


## Recommendations

- For better looking please use this pack with [Kvantum engine](https://github.com/tsujan/Kvantum/tree/master/Kvantum).

  Run `kvantummanager` to choose and apply **Darkine** theme.

- Install [Papirus-Adapta icon theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) for a more consistent and beautiful experience.

- For better looking use toolbar icons without text with 22px size (for Papirus themes)



## Configuration


#### Set the background lockscreen dark-grey :
```
kwriteconfig5 --file kscreenlockerrc --group Greeter --group Wallpaper --group org.kde.color --group General --key Color 29,29,29
qdbus org.kde.KWin /KWin reconfigure
```


#### Use the same <a href="https://raw.githubusercontent.com/Rokin05/darkine-kde/master/INFO/screenshots/fonts-config.png">fonts</a> from the screenshot :
```
# Arch :
sudo pacman -S cantarell-fonts

# Debian / Ubuntu :
sudo apt-get install fonts-cantarell

kwriteconfig5 --file kdeglobals --group General --key fixed "Monospace,9,-1,5,50,0,0,0,0,0"
kwriteconfig5 --file kdeglobals --group General --key font "Cantarell,9,-1,5,50,0,0,0,0,0,Regular"
kwriteconfig5 --file kdeglobals --group General --key menuFont "Cantarell,10,-1,5,25,0,0,0,0,0,Light"
kwriteconfig5 --file kdeglobals --group General --key smallestReadableFont "Cantarell,8,-1,5,50,0,0,0,0,0,Regular"
kwriteconfig5 --file kdeglobals --group General --key toolBarFont "Cantarell,9,-1,5,25,0,0,0,0,0,Light"
kwriteconfig5 --file kdeglobals --group WM --key activeFont "Cantarell,9,-1,5,50,0,0,0,0,0,Regular"
qdbus org.kde.KWin /KWin reconfigure
kquitapp5 plasmashell && kstart5 plasmashell
```


#### Arch : How install Kvantum :
<a href="https://github.com/tsujan/Kvantum/blob/master/Kvantum/INSTALL">Official guide</a> - can be change over the time ! :
```
sudo pacman -S gcc libx11 libxext qt5-base qt5-svg qt5-x11extras qt5-tools

mkdir /tmp/kvantum && cd /tmp/kvantum
git clone https://github.com/tsujan/Kvantum

qmake && make
make install
make distclean
```


## License

GNU GPL v3
 







