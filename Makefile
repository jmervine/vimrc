install:
	make $(HOME)/.vim
	make $(HOME)/.vimrc
	make bundle/Vundle.vim
	make PluginInstall
	make GoInstallBinaries

uninstall:
	rm -f $(HOME)/.vimrc

update:
	git pull
	make PluginInstall

$(HOME)/.vim:
	ln -s $(shell pwd) $(HOME)/.vim

$(HOME)/.vimrc:
	ln -s $(shell pwd)/vimrc $(HOME)/.vimrc

bundle/Vundle.vim:
	mkdir -p bundle
	git clone https://github.com/gmarik/Vundle.vim.git bundle/Vundle.vim

PluginInstall:
	-go install github.com/nsf/gocode@latest
	vim +PluginClean\! +PluginInstall +qall

GoInstallBinaries:
	vim +GoInstallBinaries\! +qall

clean:
	mv -f $(HOME)/.vimrc $(HOME)/.vimrc.backup
	rm -rf $(HOME)/.vim/bundle

docker:
	docker build -t 'jmervine/vimrc' .

.PHONY: PluginInstall GoInstallBinaries \
		clean docker install uninstall update
