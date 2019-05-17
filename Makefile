# GNU make is required to run this file. To install on *BSD, run:
#   gmake PREFIX=/usr/local install

PREFIX ?= /usr
IGNORE ?=
THEMES ?= plasma color-schemes aurorae Kvantum icons sddm wallpapers konsole themes

# excludes IGNORE from THEMES list
THEMES := $(filter-out $(IGNORE), $(THEMES))

all:

install:
	mkdir -p $(DESTDIR)$(PREFIX)/share
	cp -R $(THEMES) $(DESTDIR)$(PREFIX)/share

uninstall:
	-rm -rf $(DESTDIR)$(PREFIX)/share/plasma/look-and-feel/darkine
	-rm -rf $(DESTDIR)$(PREFIX)/share/plasma/desktoptheme/darkine
	-rm -r  $(DESTDIR)$(PREFIX)/share/color-schemes/Darkine.colors
	-rm -rf $(DESTDIR)$(PREFIX)/share/aurorae/themes/Darkine-classic
	-rm -rf $(DESTDIR)$(PREFIX)/share/aurorae/themes/Darkine-round
	-rm -rf $(DESTDIR)$(PREFIX)/share/Kvantum/Darkine
	-rm -rf $(DESTDIR)$(PREFIX)/share/icons/darkine
	-rm -rf $(DESTDIR)$(PREFIX)/share/sddm/themes/darkine
	-rm -rf $(DESTDIR)$(PREFIX)/share/wallpapers/Darkine
	-rm -r  $(DESTDIR)$(PREFIX)/share/konsole/Darkine.colorscheme
	-rm -rf $(DESTDIR)$(PREFIX)/share/themes/Darkine

_get_version:
	$(eval VERSION := $(shell git show -s --format=%cd --date=format:%Y%m%d HEAD))
	@echo $(VERSION)

dist: _get_version
	git archive --format=tar.gz -o $(notdir $(CURDIR))-$(VERSION).tar.gz master -- $(THEMES)

release: _get_version
	git tag -f $(VERSION)
	git push origin
	git push origin --tags

undo_release: _get_version
	-git tag -d $(VERSION)
	-git push --delete origin $(VERSION)


.PHONY: all install uninstall _get_version dist release undo_release

# .BEGIN is ignored by GNU make so we can use it as a guard
.BEGIN:
	@head -3 Makefile
@false