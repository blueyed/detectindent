This folder, `tests`, contains the executable tests for DetectIndent.

## Running the tests

As a prerequisite, the [Vader](https://github.com/junegunn/vader.vim) testing plugin must be installed.

To run the tests, `cd` so your working is the root folder `detectindent`, *not* this `tests` folder. Then run the following:

    $ tests/run-all-tests

You should see output like the following:

    VIM - Vi IMproved 7.4 (2013 Aug 10, compiled Oct 27 2014 04:29:06)
    MacOS X (unix) version
    Included patches: 1-488
    
    [… a bunch of details about the version of Vim the tests are being run with …]
    
    Starting Vader: 2 suite(s), 15 case(s)
      Starting Vader: /Users/roryokane/.vim/bundle/detectindent/tests/all-options-are-set.vader
        (1/2) [EXECUTE] reset indent options to initial values
        (2/2) [EXECUTE] check that all four options are changed to a correct value
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
        (13/13) [EXECUTE] starbuzz_beverage_cost_calculator-core.clj
        (13/13) [EXECUTE] (X) 1 should be equal to 2
      Success/Total: 10/13
    Success/Total: 12/15 (assertions: 25/28)
    Elapsed time: 1.910852 sec.

That’s right, not all of the tests currently pass. Some edge cases, such as Lisp-like indentation, are currently detected wrong. I figured it was better to put them in the tests so I can at least know about them, and test whether they are fixed later when I improve the algorithm.

There is also a command `tests/run-fixtures-test`. I made a convenient separate command for running those particular tests because they are the only tests that can run on older versions of DetectIndent without changes. I sometimes want to run those tests on older versions to compare their performance with the current version.
