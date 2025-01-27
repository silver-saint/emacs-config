This is my personal configuration in Emacs that I use.

If you'd like to use it, please create an init.el in you /home/.emacs.d and write
(when (file-exists-p (expand-file-name "~/.emacs.d/emacs-config/config.el"))
  (load (expand-file-name "~/.emacs.d/emacs-config/config.el")))
and place the emacs-config folder in your home directory.
If you don't know what your home directory is you can check it using echo $HOME in your terminal.
By default it should be "~/"
KeyBinds :
Ctrl-F to use swiper to find matches of text in the file.
I use counsel for searching commands using "M-x".
//TODO fill in;

