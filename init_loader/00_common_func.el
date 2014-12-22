(defun revert-buffer-no-confirm (&optional force-reverting)
  "Interactive call revert-buffer.Ignoreing the auto-save file
      and not requesting for confirmation.When the current buffer
      is modified the command refuses to revert it, unless you s-
      pecify the optional argument: force-reverting to true"
  (interactive "p")
  (if (or force-reverting (not (buffer-modified-p)))
      (revert-buffer :ignore-auto :noconfirm)
    (error "The buffer has been modified")))

(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)
