;; @author: Thibault BRONCHAIN

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (tsdh-dark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Scala mode
(add-to-list 'load-path "/Users/thibaultbronchain/.emacs.d/modules/scala-emacs")
(require 'scala-mode-auto)

(setq-default indent-tabs-mode nil)

(global-font-lock-mode t) ;pour avoir les couleurs sans avoir a taper font-lock-mode
(setq font-lock-maximum-decoration t) ;maximum de couleurs

;;(if first-time
    (setq auto-mode-alist
          (append '(("\\.cpp$" . c++-mode)
                     ("\\.hpp$" . c++-mode)
                     ("\\.h$" . c++-mode)
                     ("\\.lsp$" . lisp-mode)
                     ("\\.scm$" . scheme-mode)
                     ("\\.pl$" . perl-mode)
                     ) auto-mode-alist))

;; Mise en valeur syntaxique automatique
(defvar font-lock-auto-mode-list
  (list 'c-mode 'c++-mode 'c++-c-mode 'emacs-lisp-mode 'lisp-mode 'perl-mode 'scheme-mode)
  "Listes des modes a demarrer toujours avec mise en valeur")

(defvar font-lock-mode-keyword-alist
  '((c++-c-mode . c-font-lock-keywords)
    (perl-mode . perl-font-lock-keywords))
  "Associations entre modes et mots-clés")

(defun font-lock-auto-mode-select ()
  "Sélectionne automatiquement type de mise en valeur si le major mode courant est dans font-lock-auto-mode-list"
  (if (memq major-mode font-lock-auto-mode-list)
      (progn
	(font-lock-mode t))
    )
  )

(global-set-key [M-f1] 'font-lock-fontify-buffer)

;; Nouveau dabbrev
;;(require 'new-dabbrev)
(setq dabbrev-always-check-other-buffers t)
(setq dabbrev-abbrev-char-regexp "\\sw\\|\\s_")
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
	     (set (make-local-variable 'dabbrev-case-fold-search) nil)
	     (set (make-local-variable 'dabbrev-case-replace) nil)))
(add-hook 'c-mode-hook
          '(lambda ()
	     (set (make-local-variable 'dabbrev-case-fold-search) nil)
	     (set (make-local-variable 'dabbrev-case-replace) nil)))
(add-hook 'text-mode-hook
          '(lambda ()
	     (set (make-local-variable 'dabbrev-case-fold-search) t)
	     (set (make-local-variable 'dabbrev-case-replace) t)))

;; Mode C++ et C...
(defun my-c++-mode-hook ()
  (setq tab-width 4)
  (define-key c++-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (define-key c++-mode-map "\C-ce" 'c-comment-edit)
  (setq c++-auto-hungry-initial-state 'none)
  (setq c++-delete-function 'backward-delete-char)
  (setq c++-tab-always-indent t)
  (setq c-indent-level 4)
  (setq c-continued-statement-offset 4)
  (setq c++-empty-arglist-indent 4))

(defun my-c-mode-hook ()
  (setq tab-width 4)
  (define-key c-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (define-key c-mode-map "\C-ce" 'c-comment-edit)
  (setq c-auto-hungry-initial-state 'none)
  (setq c-delete-function 'backward-delete-char)
  (setq c-tab-always-indent t)
  ;; indentation style BSD
  (setq c-indent-level 4)
  (setq c-continued-statement-offset 4)
  (setq c-brace-offset -4)
  (setq c-argdecl-indent 0)
  (setq c-label-offset -4))

;; Turn off the startup message.
(setq inhibit-startup-message 1)

;; Hide menu-bar.
;;(menu-bar-mode)

;; Show line-number/column-number in the mode line.
(line-number-mode 1)
(column-number-mode 1)

;; Show time in the mode line.
(setq display-time-24hr-format 1)
(display-time)

;; Highlight matching parens.
(require 'paren)
(setq show-paren-delay 0)
(show-paren-mode)

;; Highlight region.
(transient-mark-mode 1)

;; Hightlight current line.
(global-hl-line-mode t)
(custom-set-faces '(highlight ((t (:weight bold)))))

;; Show/delete trailing spaces.
(setq-default show-trailing-whitespace 1)
(global-set-key [f6] 'delete-trailing-whitespace)

;; Mode shortcuts.
(global-set-key [f3] 'c-mode)
(global-set-key [f4] 'ruby-mode)
(global-set-key [f5] 'compile)

;; Navigation shortcuts.
(global-set-key (kbd "ESC <up>") '(lambda () (interactive) (other-window -1)))
(global-set-key (kbd "ESC <down>") 'other-window)
(global-set-key (kbd "ESC <left>") '(lambda () (interactive) (other-window -1)))
(global-set-key (kbd "ESC <right>") 'other-window)

;; Ruby mode.
(autoload 'ruby-mode "ruby-mode" "Ruby source files' editing mode")
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))

;; Tem opt
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(defun to-bottom () (interactive) "Recenter screen so that currentline is on the bottom of the screen"
  (recenter -1)
  )
(defun set-key-to-bottom () (interactive)
  (local-set-key "\C-l" 'to-bottom)
  )
(add-hook 'shell-mode-hook 'set-key-to-bottom)

;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(add-to-list 'load-path "/Users/thibaultbronchain/.emacs.d/modules/auto-complete")
(require 'auto-complete-config)
(ac-config-default)

;;EOF
