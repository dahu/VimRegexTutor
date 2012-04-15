VimRegexTutor
=============

_A "hands on" regular expression tutorial for users of the Vim editor._

**Project Page:** https://github.com/dahu/VimRegexTutor  
**Maintainer:**   Barry Arthur <barry.arthur@gmail.com>  
**Status:**       Beta, feedback welcome  

Most new users can get through it in less than one hour. The result is that you
can use simple regular expressions using the Vim editor.

`regextutor` is a file that contains the tutorial lessons. You can simply
execute `vim regextutor` and then follow the instructions in the lessons.  The
lessons tell you to modify the file, so *DON'T DO THIS ON YOUR ORIGINAL COPY*.

On Unix you can also use the `vimregextutor` program.  It will make a scratch
copy of the tutor first. Currently, this program needs to be manually installed
into a directory in your PATH. Assuming you used pathogen to install
VimRegexTutor, you could do something like:

    cd
    mkdir -p bin
    ln -s $HOME/.vim/bundle/VimRegexTutor/bin/vimregextutor $HOME/bin/vimregextutor

**NOTE:** This is a once-off setup and won't need to be repeated after
upgrading VimRegexTutor.

Add an Issue on the Project Page if you find any mistakes or think of any
improvements or additions. Of course, you could just fork it and add those
improvements yourself, too. :)

TODO
----

* Add some lessons on `:substitute` and integrate more `:s` exercises.
* Move the `\zs` and `\ze` introduction before "lookaround" into their own
  lessons, with exercises. Stress the preference of `\z[se]` over lookaround.
* Add 'fold' modeline options to hide the ANSWER blocks.
