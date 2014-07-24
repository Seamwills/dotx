;; remove  all unnecessary UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; color several elements
(set-background-color "#002B36")
(set-foreground-color "#AFAFAF")
(set-face-foreground 'mode-line "#FFFFFF")
(set-face-background 'mode-line "#27408B")
(set-face-foreground 'font-lock-comment-face "#658084")
(set-face-foreground 'font-lock-keyword-face "#6A5ACD")
(set-face-foreground 'font-lock-string-face "#40A04C")
(set-face-foreground 'font-lock-function-name-face "#FFA500")
(set-face-background 'fringe "#002B36")

;; initial frame size and position
(add-to-list 'initial-frame-alist '(height . 48))
(add-to-list 'initial-frame-alist '(width . 80))
(set-frame-position (selected-frame) -2 0)

;; text dispaly
(setq initial-major-mode 'text-mode)
(setq auto-fill-mode t)
(setq line-number-mode t)
(setq column-number-mode t)
(setq scroll-preserve-screen-position t)
(global-linum-mode t)

(add-hook 'text-mode-hook
	  (lambda ()
	    (linum-mode -1)
	    (set-fill-column 80)))	;; auto-fill-mode, M-q to break

;; default font for English and Chinese
(set-default-font "-outline-Consolas-normal-normal-normal-mono-16-*-*-*-c-*-iso8859-1")
(set-fontset-font t 'han (font-spec :family "Microsoft Yahei" :size 18))
(set-language-environment 'UTF-8)
(set-locale-environment "UTF-8")

;; reply with y(yes) or n(no)
(fset 'yes-or-no-p 'y-or-n-p)

;; disable file backup and autosave
(setq make-backup-files nil)
(setq auto-save-default nil)

;; c mode style
(setq c-default-style "linux"
      c-basic-offset 4)

;; default input method
(setq default-input-method 'chinese-py)

;; global key bindings
(define-key global-map [f10] 'linum-mode)
(define-key global-map [f12] 'eval-buffer)
(define-key global-map [S-f12] (lambda() (interactive)(find-file "~/.emacs.d/init.el")))
(global-set-key (kbd "RET") 'newline-and-indent)

(provide 'init-init)
