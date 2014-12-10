This folder, `tests`, contains the executable tests for DetectIndent.

## Running the tests

As a prerequisite, the [Vader](https://github.com/junegunn/vader.vim) testing plugin must be installed.

To run the tests, `cd` so your working is the root folder `detectindent`, *not* this `tests` folder. Then run the following:

    $ tests/run-all-tests

You should see output like the following:

    VIM - Vi IMproved 7.4 (2013 Aug 10, compiled Oct 27 2014 04:29:06)
    MacOS X (unix) version
    Included patches: 1-488
    Compiled by Homebrew
    Huge version without GUI.  Features included (+) or not (-):
    +acl             +farsi           +mouse_netterm   +syntax
    +arabic          +file_in_path    +mouse_sgr       +tag_binary
    +autocmd         +find_in_path    -mouse_sysmouse  +tag_old_static
    -balloon_eval    +float           +mouse_urxvt     -tag_any_white
    -browse          +folding         +mouse_xterm     -tcl
    ++builtin_terms  -footer          +multi_byte      +terminfo
    +byte_offset     +fork()          +multi_lang      +termresponse
    +cindent         -gettext         -mzscheme        +textobjects
    -clientserver    -hangul_input    +netbeans_intg   +title
    +clipboard       +iconv           +path_extra      -toolbar
    +cmdline_compl   +insert_expand   +perl            +user_commands
    +cmdline_hist    +jumplist        +persistent_undo +vertsplit
    +cmdline_info    +keymap          +postscript      +virtualedit
    +comments        +langmap         +printer         +visual
    +conceal         +libcall         +profile         +visualextra
    +cryptv          +linebreak       +python          +viminfo
    +cscope          +lispindent      -python3         +vreplace
    +cursorbind      +listcmds        +quickfix        +wildignore
    +cursorshape     +localmap        +reltime         +wildmenu
    +dialog_con      -lua             +rightleft       +windows
    +diff            +menu            +ruby            +writebackup
    +digraphs        +mksession       +scrollbind      -X11
    -dnd             +modify_fname    +signs           -xfontset
    -ebcdic          +mouse           +smartindent     -xim
    +emacs_tags      -mouseshape      -sniff           -xsmp
    +eval            +mouse_dec       +startuptime     -xterm_clipboard
    +ex_extra        -mouse_gpm       +statusline      -xterm_save
    +extra_search    -mouse_jsbterm   -sun_workshop    -xpm
       system vimrc file: "$VIM/vimrc"
         user vimrc file: "$HOME/.vimrc"
     2nd user vimrc file: "~/.vim/vimrc"
          user exrc file: "$HOME/.exrc"
      fall-back for $VIM: "/usr/local/share/vim"
    Compilation: /usr/bin/clang -c -I. -Iproto -DHAVE_CONFIG_H   -F/usr/local/Frameworks -DMACOS_X_UNIX  -Os -w -pipe -march=core2 -msse4.1 -mmacosx-version-min=10.9 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1      
    Linking: /usr/bin/clang   -L. -L/usr/local/lib -L/usr/local/lib -F/usr/local/Frameworks -Wl,-headerpad_max_install_names -o vim        -lm  -lncurses -liconv -framework Cocoa   -fstack-protector -L/usr/local/lib  -L/System/Library/Perl/5.16/darwin-thread-multi-2level/CORE -lperl -framework Python   -lruby.2.0.0 -lobjc   
    Starting Vader: 3 suite(s), 17 case(s)
      Starting Vader: /Users/roryokane/.vim/bundle/detectindent/tests/all-options-are-set.vader
        (1/2) [EXECUTE] reset indent options to initial values
        (2/2) [EXECUTE] check that all four options are changed to a correct value
      Success/Total: 2/2
      Starting Vader: /Users/roryokane/.vim/bundle/detectindent/tests/config-options-are-respected.vader
        (1/2) [EXECUTE] reset indent options to initial values
        (2/2) [EXECUTE] TODO g:detectindent_preferred_expandtab is respected
      Success/Total: 2/2
      Starting Vader: /Users/roryokane/.vim/bundle/detectindent/tests/fixtures-detected-correctly.vader
        ( 1/13) [EXECUTE] reset indent options to initial values
        ( 2/13) [EXECUTE] Coursera-The_Hardware-Software_Interface-lab1-bits.c
        ( 2/13) [EXECUTE] (X) 1 should be equal to 2
        ( 3/13) [EXECUTE] FountainMusic-FMDisplayItem.c
        ( 3/13) [EXECUTE] (X) 4 should be equal to 8
        ( 4/13) [EXECUTE] FountainMusic-FMDisplayItem.h
        ( 5/13) [EXECUTE] GameOfLife.plaid – badly mixed indentation
        ( 6/13) [EXECUTE] general-level-1.indentc
        ( 7/13) [EXECUTE] haml-action_view.haml
        ( 8/13) [EXECUTE] haml-render_layout.haml
        ( 9/13) [EXECUTE] jSnake-demo.html
        (10/13) [EXECUTE] jSnake-snake3.js
        (11/13) [EXECUTE] parslet-scope.rb
        (12/13) [EXECUTE] semver.md – no indentation at all
        (12/13) [EXECUTE] (X) 1 should be equal to 0
        (13/13) [EXECUTE] starbuzz_beverage_cost_calculator-core.clj
        (13/13) [EXECUTE] (X) 1 should be equal to 2
      Success/Total: 9/13
    Success/Total: 13/17 (assertions: 23/27)
    Elapsed time: 1.089934 sec.

That’s right, not all of the tests currently pass. Some edge cases, such as Lisp-like indentation, are currently detected wrong. I figured it was better to put them in the tests so I can at least know about them, and test whether they are fixed later when I improve the algorithm.

There is also a command `tests/run-fixtures-test`. I made a convenient separate command for running those particular tests because they are the only tests that can run on older versions of DetectIndent without changes. I sometimes want to run those tests on older versions to compare their performance with the current version.
