.PHONY: install

install:
	mkdir -p ${HOME}/.config
	ln -vsf ${PWD}/.Xmodmap ${HOME}/.Xmodmap
	ln -vsf ${PWD}/.Xresources ${HOME}/.Xresources
	ln -vsf ${PWD}/.config/nvim ${HOME}/.config/nvim
