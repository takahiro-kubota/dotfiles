DOT_FILES=emacs \
	  tmux.conf \
	  zshrc

all: install

install: $(foreach f, $(DOT_FILES), install-file-$(f))

uninstall: $(foreach f, $(DOT_FILES), uninstall-file-$(f))

install-file-%: %
	ln -snf $(CURDIR)/$< $(HOME)/.$<

uninstall-file-%: %
	unlink $(HOME)/.$<
