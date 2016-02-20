.PHONY: css
css:
	mkdir -p css
	sass --watch sass/style.scss:css/style.css --style expanded --sourcemap
	postcss --watch --use autoprefixer --use postcss-import css/style.css --output css/style.css

.PHONY: mincss
mincss:
	mkdir -p css
	sass sass/style.scss:css/style.css --style compressed
	postcss --use autoprefixer --use postcss-import css/style.css --output css/style.css

.PHONY: server
server:
	browser-sync start --server --files='index.html,css/style.css'

.PHONY: all
all:
	(make css & make server & wait)

.PHONY: clean
clean:
	rm -r css
