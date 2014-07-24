(setq user-full-name "Seamwills") 
(setq user-mail-address "seamwill@gmail.com")

(setq gnus-select-method '(nntp "news.gmane.org"))
(setq gnus-options-subscribe "orgmode")

(setq gnus-secondary-select-methods
      '((nnimap "Contact"
		(nnimap-address "imap.gmail.com")
	        (nnimap-server-port 993)
	        (nnimap-stream ssl)
	        (nnimap-authinfo-file "~/.authinfo"))
	(nnimap "Product"
	      (nnimap-address "imap.gmail.com")
	      (nnimap-server-port 993)
	      (nnimap-stream ssl)
	      (nnimap-authinfo-file "~/.authinfo"))))

(setq gnus-group-line-format "[%8s] - %m%4N:%-4t %-24G\n")
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587
				   "seamwill@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

(setq gnus-parameters
      '(("nnimap Contact:INBOX"
	 (display . all)
	 (posting-tyle
	  (name "Seamwills")
	  (address "seamwill@gmail.com"))
	 (expiry-target . delete))
	("nnimap Contact:[Gmail]/.*"
	 (display . all)
	 (posting-style
	  (name "Seamwills")
	  (address "seamwill@gmail.com"))
	 (expiry-wait . never))
	("nnimap Product:INBOX"
	 (display . all)
	 (posting-style
	  (name "Virexit")
	  (address "virexit@gmail.com"))
	 (expiry-target . delete))
	("nnimap Product:[Gmail]/.*"
	 (display . all)
	 (posting-style
	  (name "Virexit")
	  (address "virexit@gmail.com"))
	 (expiry-wait .never))))

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

(setq gnus-blocked-images nil)
(auto-image-file-mode t)

;;(set-face-foreground 'gnus-header-content-face "#E22222")
;;(set-face-foreground 'gnus-header-from-face "yellow")

(provide 'init-gnus)
