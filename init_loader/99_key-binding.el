(keyboard-translate ?\C-h ?\C-?)

(define-key global-map (kbd "M-?") 'help-for-help)
(define-key global-map (kbd "C-c i") 'indent-region)
(define-key global-map (kbd "C-o") 'hippie-expand)
(define-key global-map (kbd "C-c ;") 'comment-dwim)
(define-key global-map (kbd "M-C-g") 'grep)
(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "M-?")  'help-for-help)
(define-key global-map (kbd "C-\\") 'undo)
(define-key global-map (kbd "C-c C-i") 'dabbrev-expand)
(define-key global-map (kbd "C-c g") 'goto-line)

(define-key global-map (kbd "RET") 'newline-and-indent)

(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines 1))
    (forward-line)
    (move-to-column col)))

(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines -1))
    (move-to-column col)))

(global-set-key (kbd "M-P") 'move-line-up)
(global-set-key (kbd "M-N") 'move-line-down)

;; sr-speedbar
(require 'sr-speedbar)
(define-key speedbar-file-key-map "+" 'speedbar-create-directory)
(define-key speedbar-file-key-map (kbd "O")
  (lambda ()
    (interactive)
    (speedbar-open-mac)))

(define-key speedbar-file-key-map (kbd "o")
  (lambda ()
    (interactive)
    (speedbar-edit-line-and-switch-to-window)))

(define-key speedbar-file-key-map (kbd "f")
  (lambda ()
    (interactive)
    (speedbar-edit-line)))

(define-key speedbar-file-key-map (kbd "RET")
  (lambda ()
    (interactive)
    (speedbar-edit-line)))
