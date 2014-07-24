;; initialization
(add-to-list 'load-path "~/.emacs.d/site-lisp/orgmode/lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp/orgmode/contrib/lisp" t)

;; global key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; contributed packages
(add-hook 'org-mode-hook
	  (lambda ()
	    (require 'org-contacts)))

;; capture mode
(setq org-capture-templates
      '(("c" "Contacts" entry (file+headline "~/.data/org/contacts.org" "CONTACTS")
	 "* %(org-contacts-template-name)
:PROPERTIES:
:PHONE: %(org-contacts-template-phone)
:EMAIL: %(org-contacts-template-email)
:END:")
	("i" "Inbox" entry (file+headline "~/.data/org/inbox.org" "INBOX")
	 "* TODO %?")
	("j" "Journals" entry (file+datetree "~/.data/org/journals.org")
	 "* %?\nDate: %U")
	("n" "Notes" entry (file+headline "~/.data/org/notes.org" "NOTES")
	 "* %? %^g\n\nCaptured At: %U")
	("t" "Todos" entry (file+headline "~/.data/org/todos.org" "TODOS")
	 "* TODO %?")))

(setq org-contacts-files '("~/.data/org/contacts.org"))

;; agenda mode
(setq org-agenda-files '("~/.data/org/todos.org"))
(setq org-archive-location "~/.data/org/archive.org::* Archived Todos")

;; todo mode
(setq org-enforce-todo-dependencies t)
(setq org-log-done 'time)
(setq org-todo-keywords
      '((sequence "TODO" "|" "DONE" "CANCELED")))
(setq org-todo-keyword-faces
           '(("TODO" . org-warning)
             ("CANCELED" . (:foreground "maroon" :weight bold))))
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;; refile and copy
(setq org-refile-targets
      '(("~/.data/org/next.org" . (:level . 1))
	("~/.data/org/todos.org" . (:level . 1))
	(nil . (:level . 2))))
(setq org-reverse-note-order (quote (("next" . nil) ("todos" . t))))

;; tree structure
(defun org-show-level (level)
  (interactive)
  (org-content level))
(add-hook 'org-mode-hook
	  (lambda ()
	    (org-show-level 2)
	    (define-key org-mode-map "\C-cm" 'org-show-level)
	    (define-key org-mode-map "\C-cw" 'toggle-truncate-lines)))

;; shortcuts for visiting specific files
;; use C-x r j <x> to visit
(set-register ?b (cons 'file "~/.data/org/booklists.org"))
(set-register ?c (cons 'file "~/.data/org/contacts.org"))
(set-register ?i (cons 'file "~/.data/org/inbox.org"))
(set-register ?n (cons 'file "~/.data/org/notes.org"))
(set-register ?r (cons 'file "~/.data/org/records.org"))
(set-register ?t (cons 'file "~/.data/org/todos.org"))

(provide 'init-org)
