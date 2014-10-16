;; helm
;; (require 'helm)
;; (require 'helm-config)
(helm-mode t)

(custom-set-variables
 '(helm-input-idle-delay 0.02)
 '(helm-exit-idle-delay 0.02)
 '(helm-candidate-number-limit 500)
 '(helm-ag-insert-at-point 'symbol)
 '(helm-swoop-pre-input-function 'ignore)
 '(helm-ff-auto-update-initial-value nil)
 '(helm-find-files-doc-header "")
 '(helm-samewindow nil))

(defun my/helm ()
  (interactive)
  (helm :sources '(
                   helm-c-source-buffers-list
                   helm-c-source-recentf
                   helm-c-source-files-in-current-dir
                   helm-c-source-mac-spotlight
                   helm-c-source-buffer-not-found)
        :buffer "*my helm*"))

(remove-hook 'kill-emacs-hook 'helm-c-adaptive-save-history)

(define-key helm-read-file-map (kbd "C-h") 'delete-backward-char)
(define-key helm-read-file-map (kbd "<tab>") 'helm-execute-persistent-action)
