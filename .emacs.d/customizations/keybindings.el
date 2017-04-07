(global-set-key [f7] 'kill-whole-line)
(global-set-key (kbd "M-s M-m") 'magit-status)
(global-set-key (kbd "M-s M-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-x C-M-f") 'find-file-in-repository)

;; comments
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-;") 'toggle-comment-on-line)
