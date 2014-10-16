(require 'popwin)
(defvar popwin:special-display-config-backup popwin:special-display-config)
(custom-set-variables
 '(display-buffer-function 'popwin:display-buffer)
 '(popwin:popup-window-position 'bottom))


(when (require 'popwin nil t)
  (setq display-buffer-function 'popwin:display-buffer)
  ;; basic
  (push '("*Help*" :stick t :noselect t) popwin:special-display-config)
  (push '("helm" :regexp t :height 0.5) popwin:special-display-config)
  (push '("*Completions*" :height 0.4) popwin:special-display-config)
  (push '("*compilation*" :height 0.4 :noselect t :stick t) popwin:special-display-config)
  (push '("*quickrun*" :height 0.5 :stick t) popwin:special-display-config)
  (push '("\*grep\*" :regexp t :height 0.5 :stick t) popwin:special-display-config)
  (push '("COMMIT_EDITMSG" :height 0.3) popwin:special-display-config)

  ;; Ruby
  (push '("*ri-doc*" :stick t :height 20) popwin:special-display-config)
  (push '(inf-ruby-mode :stick t :height 20) popwin:special-display-config)

  ;; CoffeeScript
  (push '("*CoffeeREPL*" :stick t) popwin:special-display-config)

  ;; python
  (push '("*Python*"   :stick t) popwin:special-display-config)
  (push '("*Python Help*" :stick t :height 20) popwin:special-display-config)
  (push '("*jedi:doc*" :stick t :noselect t) popwin:special-display-config)

  ;; Haskell
  (push '("*haskell*" :stick t) popwin:special-display-config)
  (push '("*GHC Info*") popwin:special-display-config)

  ;; direx
  (push '(direx:direx-mode :position top :width 40 :dedicated t) popwin:special-display-config)

  ;; flycheck
  (push '(flycheck-error-list-mode :stick t) popwin:special-display-config)
)
