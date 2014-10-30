(global-linum-mode t)
(setq linum-format "%4d:")

(setq whitespace-line-column 80)
(setq whitespace-style '(face
                         trailing
                         lines-tail
                         space-before-tab
                         space-after-tab))

(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background "#CC0066"))
    (t
     ()))
  "*Face used by hl-line.")

(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;; auto-save
(defun my/auto-save-buffers ()
  (save-excursion
   (dolist (buffer (buffer-list))
     (set-buffer buffer)
     (when (and (buffer-file-name)
                (buffer-modified-p)
                (not buffer-read-only)
                (file-writable-p (buffer-file-name)))
       (save-buffer)))))

(run-with-idle-timer 10 t 'my/auto-save-buffers)

;; naming of same name file
(custom-set-variables
 '(uniquify-buffer-name-style 'post-forward-angle-brackets))

;; raibow-delimiters-mode
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(custom-set-faces '(rainbow-delimiters-depth-1-face ((t (:foreground "#FF8F22")))))
(cl-loop
 for index from 1 to rainbow-delimiters-max-face-count
 do
 (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
   (cl-callf color-saturate-name (face-foreground face) 30)))
(rainbow-delimiters-mode t)

;; git-gutter
(global-git-gutter-mode t)
(define-key global-map (kbd "C-x g") 'git-gutter:toggle)
(setq git-gutter:window-width 1)

(setq git-gutter:modified-sign " ")
(setq git-gutter:added-sign "+")
(setq git-gutter:deleted-sign "-")

(set-face-foreground 'git-gutter:modified "blue")
(set-face-foreground 'git-gutter:added "green")
(set-face-foreground 'git-gutter:deleted "red")

;; highlight-indentation
(highlight-indentation-mode t)
(set-face-background 'highlight-indentation-face "midnight blue")
(set-face-background 'highlight-indentation-current-column-face "red")
(setq highlight-indentation-offset 4)

;; highlight-symbol
(global-set-key [f3] 'highlight-symbol-at-point)
(global-set-key [(shift f3)] 'highlight-symbol-next)
(global-set-key [(super f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)
