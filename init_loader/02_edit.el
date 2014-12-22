;;;; editing operations
;; Use regexp version as Default
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward-symbol-at-point)

;; thingopt
(require 'thingopt)
(define-thing-commands)

;; electrict-mode
(custom-set-variables
 '(electric-indent-mode nil))

;; editorconfig
(setq edconf-exec-path "/usr/local/bin/editorconfig")
