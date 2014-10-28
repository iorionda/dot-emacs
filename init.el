;; version varidate
(let ((minver 24))
  (unless (>= emacs-major-version minver)
    (error  "*** Your Emacs is too old -- this config requires v%s or higher ***" minver)))

;; for Emacs pacage system
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; load environment variables
(let ((envs '("PATH" "VIRTUAL_ENV" "GOROOT" "GOPATH")))
  (exec-path-from-shell-copy-envs envs))

;; setup theme
(load-theme 'zenburn t t)
(enable-theme 'zenburn)

;; init-loader
(custom-set-variables
 '(init-loader-show-log-after-init 'error-only))
 (init-loader-load (concat user-emacs-directory "init_loader"))
