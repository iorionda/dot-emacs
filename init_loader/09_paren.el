;; paren
(show-paren-mode t)
(custom-set-variables
 '(show-paren-delay 0)
 '(show-paren-style 'expressin)
 '(parens-require-spaces nil))

(set-face-attribute 'show-paren-match-face nil
                    :background nil :foreground nil
                    :underline "#ffff00" :weight 'extra-bold)
;; smartparen
(with-eval-after-load "ruby-mode"
  (require 'smartparens-ruby)
  (set-face-attribute 'sp-show-pair-match-face nil
                      :background "grey20" :foreground "green"
                      :weight 'semi-bold))

(add-hook 'ruby-mode-hook 'show-smartparens-mode)
