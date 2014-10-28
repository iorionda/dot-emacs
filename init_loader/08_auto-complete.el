;; setting of auto-complete
(ac-config-default)

;; Enable auto-complete mode other than default enable modes
(dolist (mode '(git-commit-mode
                coffee-mode
                go-mode
                cider-repl-mode
                markdown-mode
                fundamental-mode
                org-mode
                text-mode))
  (add-to-list 'ac-modes mode))

(custom-set-variables
 '(ac-dictionary-directories (concat user-emacs-directory "ac-dict"))
 '(ac-use-fuzzy t)
 '(ac-auto-start nil)
 '(ac-use-menu-map t)
 '(ac-auto-show-menu 0.2)
 '(ac-quick-help-delay 0.2))
(ac-set-trigger-key "TAB")


(define-key ac-complete-mode-map (kbd "C-n") 'ac-next)
(define-key ac-complete-mode-map (kbd "C-p") 'ac-previous)
(define-key ac-complete-mode-map (kbd "C-s") 'ac-isearch)
(define-key ac-completing-map (kbd "<tab>") 'ac-complete)
(define-key ac-mode-map (kbd "C-c h") 'ac-last-quick-help)
(define-key ac-mode-map (kbd "C-c H") 'ac-last-help)

;; for global minor mode
(defun my/auto-complete ()
  (interactive)
  (cl-case major-mode
    (python-mode (jedi:complete))
    (otherwise
     (if auto-complete-mode
         (call-interactively 'auto-complete)
       (call-interactively 'dabbrev-expand)))))

(dolist (hook '(text-mode-hook markdown-mode-hook))
  (add-hook hook 'ac-ispell-ac-setup))

(set-face-background 'ac-candidate-face "lightgray")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue")
