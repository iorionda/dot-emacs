(require 'cl-lib)

;; Encoding
(set-locale-environment nil)
(set-language-environment "Japanese")

(setq default-coding-systems 'utf-8-unix)
(setq file-name-coding-system 'utf-8-unix)
(setq locale-coding-system 'utf-8-unix)

;; Coloring
(global-font-lock-mode t)

;; Cursor
(when window-system
  (set-cursor-color "white")
  (blink-cursor-mode t))
(column-number-mode t)
(line-number-mode t)

;; GC
(setq gc-cons-threshold (* gc-cons-threshold 10))

;; Disable default scroll bar and tool bar
(when window-system
  (set-scroll-bar-mode 'nil)
  (tool-bar-mode 0))

;; Not create backup file and not create auto save file
(setq make-backup-file nil
      auto-save-default nil
      backup-inhibited t
      delete-auto-save-files t)

;; Display function name
(which-function-mode 1)

;; "yes-or-no" to "y-or-n"
(fset 'yes-or-no-p 'y-or-n-p)
(setq use-dialog-box nil)

;; invisible mouse cursor when editing text
(setq make-pointer-invisible t)

;; Add executable permission
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; Line
(setq kill-whole-line t
      require-final-newline t
      next-line-add-newlines nil)

;; Window
(setq-default truncate-lines t
              truncate-partial-width-windows t)

;; Delete trairing while space when after save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Completion
(setq completion-ignore-case t
      read-file-name-completion-ignore-case t)

;; History
(setq history-length 500
      history-delete-duplicates t
      recentf-max-saved-items 500)

;; Save mini-buffer history
(savehist-mode t)

;; Basic customize variables
(custom-set-variables
 '(large-file-warning-threshold (* 25 1024 1024))
 '(save-place t)
 '(dabbrev-case-fold-search nil)
 '(inhibit-startup-screen t)
 '(x-select-enable-clipboard t)
 '(read-file-name-completion-ignore-case t)
 '(line-move-visual nil)
 '(set-mark-command-repeat-pop t)
 '(find-file-visit-truename t)
 '(horizontal-scroll-bar nil)
 '(compile-command "")
 '(menu-bar-mode -1))

(setq-default horizontal-scroll-bar nil)

;; undo setting
(setq undo-no-redo t
      undo-limit 600000
      undo-strong-limit 900000)

;; undo-tree
(global-undo-tree-mode)
(define-key undo-tree-map (kbd "C-x u") 'undo-tree-undo)
(define-key undo-tree-map (kbd "C-/") 'undo-tree-undo)
(global-set-key (kbd "M-/") 'undo-tree-redo)

;; TAB
(setq-default indent-tabs-mode nil)
;;デフォルトのTAB幅を4に
(setq-default tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32
                        36 40 44 48 52 56 60 64
                        68 72 76 80 84 88 92 96
                        100 104 108 112 116 120))

;; Coloring TAB and other
(defface my-face-b-1 '((t (:background "SeaGreen"))) nil)
(defface my-face-b-1 '((t (:background "SeaGreen"))) nil)
(defface my-face-b-2 '((t (:background "SeaGreen"))) nil)
(defface my-face-b-2 '((t (:background "SeaGreen"))) nil)
(defface my-face-u-1 '((t (:foreground "SeaGreen" :underline t))) nil)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(
     ("　" 0 my-face-b-1 append)
     ("\t" 0 my-face-b-2 append)
     ("[ ]+$" 0 my-face-u-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
(add-hook 'find-file-hooks '(lambda ()
                              (if font-lock-mode
                                  nil
                                (font-lock-mode t))))
