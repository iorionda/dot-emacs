;; mode-line
;;; I must require these two elisps before loading powerline...
;; (require 'elscreen)
;; (require 'smartrep)

;; (require 'powerline)

;;; modeの名前を自分で再定義
(defvar mode-line-cleaner-alist
  '( ;; For minor-mode, first char is 'space'
    (flymake-mode . " Fm")
    (paredit-mode . "")
    (eldoc-mode . "")
    (abbrev-mode . "")
    (undo-tree-mode . "")
    (git-gutter-mode . "")
    (anzu-mode . "")
    (yas-minor-mode . "")
    (guide-key-mode . "")

    ;; Major modes
    (fundamental-mode . "Fund")
    (dired-mode . "Dir")
    (lisp-interaction-mode . "Li")
    (cperl-mode . "Pl")
    (python-mode . "Py")
    (ruby-mode   . "Rb")
    (emacs-lisp-mode . "El")
    (markdown-mode . "Md")))

(defun clean-mode-line ()
  (interactive)
  (loop for (mode . mode-str) in mode-line-cleaner-alist
        do
        (let ((old-mode-str (cdr (assq mode minor-mode-alist))))
          (when old-mode-str
            (setcar old-mode-str mode-str))
          ;; major mode
          (when (eq mode major-mode)
            (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)

(defun arrow-right-xpm (color1 color2)
  "Return an XPM right arrow string representing."
  (format "/* XPM */
static char * arrow_right[] = {
\"12 24 2 1\",
\". c %s\",
\"  c %s\",
\".           \",
\"..          \",
\"...         \",
\"....        \",
\".....       \",
\"......      \",
\".......     \",
\"........    \",
\".........   \",
\"..........  \",
\"........... \",
\"............\",
\"........... \",
\"..........  \",
\".........   \",
\"........    \",
\".......     \",
\"......      \",
\".....       \",
\"....        \",
\"...         \",
\"..          \",
\".           \",
\"            \"};"  color1 color2))



(defun arrow-left-xpm (color1 color2)
  "Return an XPM right arrow string representing."
  (format "/* XPM */
static char * arrow_right[] = {
\"12 24 2 1\",
\". c %s\",
\"  c %s\",
\"           .\",
\"          ..\",
\"         ...\",
\"        ....\",
\"       .....\",
\"      ......\",
\"     .......\",
\"    ........\",
\"   .........\",
\"  ..........\",
\" ...........\",
\"............\",
\" ...........\",
\"  ..........\",
\"   .........\",
\"    ........\",
\"     .......\",
\"      ......\",
\"       .....\",
\"        ....\",
\"         ...\",
\"          ..\",
\"           .\",
\"            \"};"  color2 color1))

(defconst color1 "#6699ff")
(defconst color2 "#ff66ff")
(defconst color3 "#696969")

(defvar arrow-right-1 (create-image (arrow-right-xpm color1 color2) 'xpm t :ascent 'center))
(defvar arrow-right-2 (create-image (arrow-right-xpm color2 color3) 'xpm t :ascent 'center))
(defvar arrow-right-3 (create-image (arrow-right-xpm color3 "None") 'xpm t :ascent 'center))
(defvar arrow-left-1  (create-image (arrow-left-xpm color2 color1) 'xpm t :ascent 'center))
(defvar arrow-left-2  (create-image (arrow-left-xpm "None" color2) 'xpm t :ascent 'center))

(setq-default mode-line-format
              (list  '(:eval (concat (propertize " %* %b " 'face 'mode-line-color-1)
                                     (propertize " " 'display arrow-right-1)))
                     '(:eval (concat (propertize " %Z " 'face 'mode-line-color-2)
                                     (propertize " " 'display arrow-right-2)))
                     '(:eval (concat (propertize " %m " 'face 'mode-line-color-3)
                                     (propertize " " 'display arrow-right-3)))

                     ;; Justify right by filling with spaces to right fringe - 16
                     ;; (16 should be computed rahter than hardcoded)
                     '(:eval (propertize " " 'display '((space :align-to (- right-fringe 17)))))

                     '(:eval (concat (propertize " " 'display arrow-left-2)
                                     (propertize " %p " 'face 'mode-line-color-2)))
                     '(:eval (concat (propertize " " 'display arrow-left-1)
                                     (propertize "%4l:%2c  " 'face 'mode-line-color-1)))))

(make-face 'mode-line-color-1)
(set-face-attribute 'mode-line-color-1 nil
                    :foreground "#fff"
                    :background color1)

(make-face 'mode-line-color-2)
(set-face-attribute 'mode-line-color-2 nil
                    :foreground "#fff"
                    :background color2)

(make-face 'mode-line-color-3)
(set-face-attribute 'mode-line-color-3 nil
                    :foreground "#fff"
                    :background color3)

(set-face-attribute 'mode-line nil
                    :foreground "#fff"
                    :background "#000"
                    :box nil)
(set-face-attribute 'mode-line-inactive nil
                    :foreground "#fff"
                    :background "#000")

(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat ".../" output)))
    output))

(defun my/powerline-theme ()
  "Setup the my mode-line."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          powerline-default-separator
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           powerline-default-separator
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (powerline-raw "%*" nil 'l)
                                     (powerline-buffer-size nil 'l)
                                     (powerline-raw mode-line-mule-info nil 'l)
                                     (powerline-raw
                                      (shorten-directory default-directory 15)
                                      nil 'l)
                                     (powerline-buffer-id nil 'r)
                                     (when (and (boundp 'which-func-mode) which-func-mode)
                                       (powerline-raw which-func-format nil 'l))
                                     (powerline-raw " ")
                                     (funcall separator-left mode-line face1)
                                     (when (boundp 'erc-modified-channels-object)
                                       (powerline-raw erc-modified-channels-object face1 'l))
                                     (powerline-major-mode face1 'l)
                                     (powerline-process face1)
                                     (powerline-minor-modes face1 'l)
                                     (powerline-narrow face1 'l)
                                     (powerline-raw " " face1)
                                     (funcall separator-left face1 face2)
                                     (powerline-vc face2 'r)))
                          (rhs (list (powerline-raw global-mode-string face2 'r)
                                     (funcall separator-right face2 face1)
                                     (powerline-raw "%4l" face1 'l)
                                     (powerline-raw ":" face1 'l)
                                     (powerline-raw "%3c" face1 'r)
                                     (funcall separator-right face1 mode-line)
                                     (powerline-raw " ")
                                     (powerline-raw "%6p" nil 'r)
                                     (powerline-hud face2 face1))))
                     (concat (powerline-render lhs)
                             (powerline-fill face2 (powerline-width rhs))
                             (powerline-render rhs)))))))

(my/powerline-theme)
