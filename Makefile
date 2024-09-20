.PHONY: all fmt build check test

all: build

test:
	cargo nextest run

check:
	cargo check

build:
	cargo build $(BUILD_OPTS) -p wezterm
	cargo build $(BUILD_OPTS) -p wezterm-gui
	cargo build $(BUILD_OPTS) -p wezterm-mux-server
	cargo build $(BUILD_OPTS) -p strip-ansi-escapes

fmt:
	cargo +nightly fmt

INSTALL_SRC  := target/release
INSTALL_DEST := /Applications/WezTerm.app/Contents/MacOS/

.PHONY: install-macos
install-macos:
	install -m 0755 ${INSTALL_SRC}/wezterm ${INSTALL_DEST}
	install -m 0755 ${INSTALL_SRC}/wezterm-gui ${INSTALL_DEST}
	install -m 0755 ${INSTALL_SRC}/wezterm-mux-server ${INSTALL_DEST}
	install -m 0755 ${INSTALL_SRC}/strip-ansi-escapes ${INSTALL_DEST}

