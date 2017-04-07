;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.


;; "When several buffers visit identically-named files,
;; Emacs must give the buffers distinct names. The usual method
;; for making buffer names unique adds ‘<2>’, ‘<3>’, etc. to the end
;; of the buffer names (all but one of them).
;; The forward naming method includes part of the file's directory
;; name at the beginning of the buffer name
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Uniquify.html
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Turn on recent file mode so that you can more easily switch to
;; recently edited files when you first start emacs
(setq recentf-save-file (concat user-emacs-directory ".recentf"))
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 40)


;; ido-mode allows you to more easily navigate choices. For example,
;; when you want to switch buffers, ido presents you with a list
;; of buffers in the the mini-buffer. As you start to type a buffer's
;; name, ido will narrow down the list of buffers to match the text
;; you've typed in
;; http://www.emacswiki.org/emacs/InteractivelyDoThings
(ido-mode t)

;; This allows partial matches, e.g. "tl" will match "Tyrion Lannister"
(setq ido-enable-flex-matching t)

;; Turn this behavior off because it's annoying
(setq ido-use-filename-at-point nil)

;; Don't try to match file across all "work" directories; only match files
;; in the current directory displayed in the minibuffer
(setq ido-auto-merge-work-directories-length -1)

;; Includes buffer names of recently open files, even if they're not
;; open now
(setq ido-use-virtual-buffers t)

;; This enables ido in all contexts where it could be useful, not just
;; for selecting buffer and file names
(ido-ubiquitous-mode 1)

(setq ido-file-extensions-order '(".rs" ".clj" ".scala" ".org" ".txt" ".py" ".emacs" ".xml" ".el" ".ini" ".cfg" ".cnf" ".java"))


;; Shows a list of buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)


;; Enhances M-x to allow easier execution of commands. Provides
;; a filterable list of possible commands in the minibuffer
;; http://www.emacswiki.org/emacs/Smex
(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

;; projectile everywhere!
(projectile-global-mode)

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
 t)
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
 t)


(defun search-to-brace ()
  "Jump to the next open brace"
  (interactive)
  (search-forward "{"))
(define-key global-map (kbd "M-s {") 'search-to-brace)

(defun search-to-prev-brace ()
    "Jump to the previous brace"
    (interactive)
    (search-backward "{"))
(define-key global-map (kbd "M-S {") 'search-to-prev-brace)

(defun search-to-close-brace ()
  "Jump to the next close brace"
  (interactive)
  (search-forward "}"))
(define-key global-map (kbd "M-s }") 'search-to-close-brace)

(defun search-to-prev-close-brace ()
  "Jump to the previous close brace"
  (interactive)
  (search-backward "}"))
(define-key global-map (kbd "M-S }") 'search-to-prev-brace)

(defun search-to-next-fn ()
  "Jump to the next def"
  (interactive)
  (search-forward "fn "))
(define-key global-map (kbd "M-s d") 'search-to-next-fn)

(defun search-to-prev-fn ()
  "Jump to the previous def"
  (interactive)
  (search-backward "fn "))
(define-key global-map (kbd "M-S d") 'search-to-prev-fn)


;; window command shortcuts
(global-set-key (kbd "s-|") 'split-window-horizontally)
(global-set-key (kbd "s--") 'split-window-vertically)
(global-set-key (kbd "s-+") 'remove-split)
(global-set-key (kbd "s-<up>") 'enlarge-window)
(global-set-key (kbd "s-<down>") 'shrink-window)
(global-set-key (kbd "s-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "s-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-k") 'kill-whole-line)

(global-set-key (kbd "s-1") 'ace-jump-line-mode)
(global-set-key (kbd "s-2") 'ace-jump-word-mode)

(global-set-key (kbd "s-f") 'find-file-in-repository)

(require 'key-chord)
(key-chord-mode 1)

;; Enable better window switching
(windmove-default-keybindings)

;; navigate between windows
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)
