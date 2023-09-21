all: clean build

PLUGIN_LOCATION = ~/.local/share/gnome-shell/extensions/cetclock@leskunberg.github.com

compile-schemas:
	glib-compile-schemas schemas/

build: compile-schemas
	zip cetclock.zip extension.js LICENSE metadata.json schemas/*

install: compile-schemas
	mkdir -p $(PLUGIN_LOCATION)
	cp -R extension.js LICENSE metadata.json schemas/ $(PLUGIN_LOCATION)
	echo 'Plugin installed. Restart GNOME Shell.'

uninstall:
	rm -rf $(PLUGIN_LOCATION)

reinstall: uninstall install

clean:
	rm -f *.zip
