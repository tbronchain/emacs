# Emacs configuration
### by Thibault Bronchain

- Edit dot.emacs and be sure that everything is appropriated to your configuration (cf comments)
- Install emacs
- Run these commands:

`$ cp dot.emacs ~/.emacs`

`$ cp -r dot.emacs.d ~/.emacs.d`

- Check cheat sheet here http://www.rgrjr.com/emacs/emacs_cheat.html

Additional features:

- Switch between "windows' with: alt-arrows
- winner-mode activated: c-c arrows
- Many other stuff that you will appreciate for sure ...

Troobleshoot:

- There are often issues with meta key and OSX.
  A good idea is to define the "Option" key as "Meta" or "Esc+" in the terminal options.
- You may have to change the keys value on other oses.

Comments:

- You probably need to recompile CEDET (used for android development mode). Checkout this article: http://obcerver.com/post/view/p/7
- This configuration is made for OSX, but should be easily adapted to any OS, although some paths would need to be changed.
- Some paths would definitely needed to be changed. Read it before using!
- Check out this script for android project generation: https://github.com/tbronchain/perso/blob/master/scripts/android_project.sh
- Don't hasitate to make some pull request if you want to improve it, I would really appreciate it.
- I try to keep my configuration simple.
  It's not perfect, and I haven't written it all, but it's all I need.
  Once again, you're welcome to contribute!
