;; Enable fullscreen when using window-system
(if (eq window-system 'ns)
    (toggle-frame-fullscreen))

;; Mac specified setting(Meta key, input method, terminfo)
;; switch super(Cmd) to meta(alt)
(setq ns-command-modifier 'meta)
(setq ns-alternate-modifier 'super)
(setq ns-use-native-fullscreen t)
(setq system-uses-terminfo nil)
(setq ns-toggle-toolbar nil)

;; font setting
 (set-face-attribute 'default nil
             :family "Ricty" ;; font
             :height 150)    ;; font size

;; japanese
(set-fontset-font
 nil 'japanese-jisx0208
  (font-spec :family "Hiragino Kaku Gothic ProN"))

(setq face-font-rescale-alist
      '((".*Hiragino_Kaku_Gothic_ProN.*" . 1.0)))

;; copy-and-paste-for-macosx
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)
