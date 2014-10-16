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

;; autopair
(custom-set-variables
 '(autopair-blink nil)
 '(autopair-blink-delay 0))

(defvar my/autopair-enabled-modes
  '(c-mode
    c++-mode
    java-mode
    python-mode
    ruby-mode
    sh-mode
    js-mode
    coffee-mode
    cperl-mode))

(dolist (mode my/autopair-enabled-modes)
  (add-hook (intern (format "%s-hook" mode)) 'autopair-mode))
