;; yasnippet
(require 'yasnippet)
(yas/load-directory "~/.emacs.d/snippets")

(yas/global-mode 1)

(define-key yas/minor-mode-map (kbd "C-t") 'yas/expand)
(define-key yas/minor-mode-map (kbd "TAB") nil)
