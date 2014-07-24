(add-to-list 'load-path "~/.emacs.d/site-lisp/evil")

(require 'evil)
(evil-mode -1)

;; variable twists
(setq evil-shift-width 4)

;; mode keybinds
(define-key global-map "\C-z" 'evil-mode)
(define-key evil-insert-state-map "\C-a" 'beginning-of-line)
(define-key evil-insert-state-map "\C-e" 'end-of-line)
(define-key evil-insert-state-map "\C-p" 'previous-line)
(define-key evil-insert-state-map "\C-n" 'next-line)
(define-key evil-insert-state-map "\C-k" 'kill-line)
(define-key evil-normal-state-map "\C-p" 'previous-line)
(define-key evil-normal-state-map "\C-n" 'next-line)

(provide 'init-evil)
