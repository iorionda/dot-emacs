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
  (save-excurison
   (dolist (buffer (buffer-list))
     (set-buffer buffer)
     (when (and (buffer-file-name)
                (buffer-modified-p)
                (not buffer-read-only)
                (file-writable-p (buffer-file-name)))
       (save-buffer)))))

(run-with-idle-timer 10 t 'my/auto-save-buffers)

;; naming of same name file
(require 'uniquify)
(custom-set-variables
 '(uniquify-buffer-name-style 'post-forward-angle-brackets))
