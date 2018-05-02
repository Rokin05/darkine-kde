<p align="center">
  <img src="https://raw.githubusercontent.com/Rokin05/darkine-kde/master/INFO/screenshots/preview.1.png" alt="Preview Darkine KDE"/>
  <a href="https://raw.githubusercontent.com/Rokin05/darkine-kde/master/INFO/screenshots/preview.2.png"><img src="https://raw.githubusercontent.com/Rokin05/darkine-kde/master/INFO/screenshots/thumbs/mini.preview.2.png" alt="Preview Darkine KDE"/></a> <a href="https://raw.githubusercontent.com/Rokin05/darkine-kde/master/INFO/screenshots/preview.3.png"><img src="https://raw.githubusercontent.com/Rokin05/darkine-kde/master/INFO/screenshots/thumbs/mini.preview.3.png" alt="Preview Darkine KDE"/></a> <a href="https://raw.githubusercontent.com/Rokin05/darkine-kde/master/INFO/screenshots/preview.4.png"><img src="https://raw.githubusercontent.com/Rokin05/darkine-kde/master/INFO/screenshots/thumbs/mini.preview.4.png" alt="Preview Darkine KDE"/></a>
</p><p align="center">
  <sup><sub>Screenshot Details: Engine: <a href="https://github.com/tsujan/Kvantum/tree/master/Kvantum">Kvantum</a> | Kvantum Theme: Darkine | Aurorae decoration: Darkine | Plasma Theme: Darkine | Icons: <a href="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme">Papirus-Adapta-Nokto</a> | Dock: <a href="https://github.com/psifidotos/Latte-Dock">Latte Dock</a></sub></sup></p>

Darkine KDE - This is a theme based on [Adapta KDE](https://github.com/PapirusDevelopmentTeam/adapta-kde) for Plasma 5 desktop.

In this repository you'll find:

- [Plasma Look-and-Feel Pack](https://www.opendesktop.org/p/1226052)
- [Plasma Desktop Themes](https://www.opendesktop.org/p/1226050)
- [Plasma Color Schemes](https://www.opendesktop.org/p/1226045)
- [Aurorae Themes](https://www.opendesktop.org/p/1226049)
- [Kvantum Themes](https://www.opendesktop.org/p/1226051)
- [SDDM Theme](https://www.opendesktop.org/p/1226079/)
- [Wallpapers](https://www.opendesktop.org/p/1226061)

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


### Third-party packages

Packages in this section are not part of the official repositories. If you have a trouble or a question please contact with package maintainer.

| **Distro** | **Maintainer** | **Package** |
|:-----------|:---------------|:------------|
| Arch Linux | Josip Ponjavic | [darkine-kde-git](https://aur.archlinux.org/packages/darkine-kde-git/) <sup>AUR</sup> |

**NOTE:** If you maintainer and want be in the list please create an issue or send a pull request.



## Recommendations

- For better looking please use this pack with [Kvantum engine](https://github.com/tsujan/Kvantum/tree/master/Kvantum).

  Run `kvantummanager` to choose and apply **Darkine** theme.

- Install [Papirus-Adapta icon theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) for a more consistent and beautiful experience.

- For better looking use toolbar icons without text with 22px size (for Papirus themes)



## Configuration


<p align="center"><img src="https://raw.githubusercontent.com/Rokin05/darkine-kde/master/INFO/screenshots/thumbs/mini.lockscreen.png" alt="Darkine-KDE lockscreen"/></p>

#### Set the background lockscreen dark-grey :
```
kwriteconfig5 --file kscreenlockerrc --group Greeter --group Wallpaper --group org.kde.color --group General --key Color 29,29,29
qdbus org.kde.KWin /KWin reconfigure
```


<a href="https://raw.githubusercontent.com/Rokin05/darkine-kde/master/INFO/screenshots/fonts-config.png"><p align="center"><img src="https://raw.githubusercontent.com/Rokin05/darkine-kde/master/INFO/screenshots/thumbs/mini.fonts.png" alt="Darkine-KDE fonts"/></p></a>

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


<a href="https://github.com/tsujan/Kvantum/tree/master/Kvantum"><p align="center"><img src="https://raw.githubusercontent.com/Rokin05/darkine-kde/master/INFO/screenshots/thumbs/mini.kvantum.png" alt="Darkine-KDE kvantum"/></p></a>

#### Arch : How install Kvantum engine :

<a href="https://github.com/tsujan/Kvantum/blob/master/Kvantum/INSTALL">Official guide</a> - can be change over the time ! :
```
sudo pacman -S gcc libx11 libxext qt5-base qt5-svg qt5-x11extras qt5-tools

cd /tmp && git clone https://github.com/tsujan/Kvantum
cd Kvantum/Kvantum

qmake && make
make install
make distclean
```

<a href="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme"><p align="center"><img src="https://raw.githubusercontent.com/Rokin05/darkine-kde/master/INFO/screenshots/thumbs/mini.papirus.png" alt="Darkine-KDE papirus"/></p></a>

#### How to change main colors of Papirus iconpack :

After installation of Papirus :

- If the icons are installed at ROOT directory* :
```
sudo find -L /usr/share/icons/Papirus-Adapta-Nokto -name "*.svg" -exec sed -i -e 's/#00bcd4/#5d3263/g' -e 's/#0096aa/#351c39/g' -e 's/#00424A/#1a1a1a/g' {} \;
```

- If the icons are installed at HOME directory for KDE* :
```
find -L $HOME/.local/share/icons/Papirus-Adapta-Nokto -name "*.svg" -exec sed -i -e 's/#00bcd4/#5d3263/g' -e 's/#0096aa/#351c39/g' -e 's/#00424A/#1a1a1a/g' {} \;
```

<sup><sub>*Command execution take ~2 min with a Intel quad core</sub></sup>

<p align="center"><img src="https://raw.githubusercontent.com/Rokin05/darkine-kde/master/INFO/screenshots/thumbs/mini.changecolor.png" alt="Darkine-KDE changecolor"/></p>
<p align="center"><sup><sub>1. The main color : #00bcd4 | 2. The backend color : #0096aa | 3. The logo color : #00424A</sub></sup></p>


## License

GNU GPL v3
 










 
