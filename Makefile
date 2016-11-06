build/vader.vim:
	mkdir -p $(dir $@)
	git clone --depth=1 https://github.com/junegunn/vader.vim $@

test: build/vader.vim
	vim -u tests/basic_vimrc_for_test_running -c "Vader! tests/*.vader"
