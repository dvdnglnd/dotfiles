(x-focus-frame nil)
(setq mac-command-modifier 'super)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Add melpa repository to archives
;; (add-to-list 'package-archives
;;              '("melpa" . "http://melpa.milkbox.net/packages/") t)

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; List the package we want
(setq package-list '(magit
                     multiple-cursors
                     move-text
                     find-file-in-repository
                     dired-details
                     ace-jump-mode
                     color-theme
                     color-theme-solarized
                     yasnippet
                     window-numbering
                     expand-region
                     monokai-theme
                     tidy
                     rainbow-delimiters
                     key-chord
                     markdown-mode
                     slime
                     clojure-mode
                     cider
                     paredit
                     clj-refactor
                     smex
                     tagedit
                     projectile
                     clojure-mode-extra-font-locking
                     ido-ubiquitous
                     go-mode
                     rust-mode
                     company
                     company-racer
                     racer
                     flycheck
                     flycheck-rust))

(package-initialize)

;; Fetch list of packages available
(unless package-archive-contents
	(package-refresh-contents))

;; install the packages that are missing, if any
(dolist (package package-list)
	(unless (package-installed-p package)
		(package-install package)))

;; Don't show the magit instructions every time
(setq magit-last-seen-setup-instructions "1.4.0")

;; Highlight current line
(global-hl-line-mode +1)

(require 'move-text)
(move-text-default-bindings)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(custom-safe-themes
   (quote
    ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (ac-ispell window-numbering tidy tagedit smex slime rainbow-delimiters racer projectile neotree move-text monokai-theme markdown-mode magit key-chord ido-ubiquitous go-mode flycheck-rust find-file-in-repository expand-region ensime dired-details company-racer color-theme-solarized clojure-mode-extra-font-locking clj-refactor better-defaults ace-jump-mode)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-face-attribute 'default nil :height 130)

(require 'find-file-in-repository)

(global-linum-mode 1)
(global-set-key [f7] 'kill-whole-line)
(global-set-key (kbd "M-s M-m") 'magit-status)
(global-set-key (kbd "M-s M-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-x C-M-f") 'find-file-in-repository)

(put 'dired-find-alternate-file 'disabled nil)

;; Hide menu bar
(menu-bar-mode -1)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)
(setq ido-file-extensions-order '(".rs" ".clj" ".scala" ".org" ".txt" ".py" ".emacs" ".xml" ".el" ".ini" ".cfg" ".cnf" ".java"))

(require 'dired-details)
(dired-details-install)

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

(define-key global-map (kbd "RET") 'newline-and-indent)

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

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

;; Color Themes
;; Read http://batsov.com/articles/2012/02/19/color-theming-in-emacs-reloaded/
;; for a great explanation of emacs color themes.
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Custom-Themes.html
;; for a more technical explanation.
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
(load-theme 'tomorrow-night-bright t)

;; Solarized theme
;; (require 'color-theme)
;; (require 'color-theme-solarized)
;; (load-theme 'solarized t)
;; Use M-x customize-variable frame-background-mode to change
;; (setq frame-background-mode 'dark)
;; (color-theme-solarized)

;; Un-comment below lines for Monokai theme
;; (require 'monokai-theme)
;; (load-theme 'monokai t)

;; Always pick up the most recent file from the filesystem
(global-auto-revert-mode 1)

(setq server-socket-dir "~/.emacs.d/server")

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

;; Put temporary and backup files elsewhere
(setq auto-save-file-name-transforms
          `((".*" ,(concat user-emacs-directory "auto-save/") t))) 
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))
(setq create-lockfiles nil)

(require 'yasnippet)
(yas-global-mode 1)
       
(require 'window-numbering)
(window-numbering-mode 1)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(defun save-all () (interactive) (save-some-buffers t))
(global-set-key (kbd "S-s") 'save-all)

;; (require 'neotree)
;; (global-set-key (kbd "s-d") 'neotree-toggle)
;; (neotree)

(require 'whitespace)
(setq whitespace-line-column 120)
(setq whitespace-style '(face lines-tail))
(global-whitespace-mode +1)

(setq show-paren-delay 0)
(show-paren-mode 1)

(defun bf-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
      (nxml-mode)
      (goto-char begin)
      (while (search-forward-regexp "\>[ \\t]*\<" nil t) 
        (backward-char) (insert "\n"))
      (indent-region begin end))
    (message "Ah, much better!"))

(require 'rainbow-delimiters)
(add-hook 'scala-mode-hook #'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)

;; Save on focus-out
(defun save-all ()
  (interactive)
  (save-some-buffers t))
(add-hook 'focus-out-hook 'save-all)

(require 'key-chord)
(key-chord-mode 1)

;; Exit emacs w/o prompts
(require 'cl)
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
           (cl-flet ((process-list ())) ad-do-it))

(add-hook 'markdown-mode-hook (lambda () (electric-indent-local-mode -1)))

;; Control and mouse-wheel-up to increase font size in buffer, down to decrease    
(global-set-key [C-wheel-up] '(lambda () (interactive) (text-scale-increase 1)))
(global-set-key [C-wheel-down] '(lambda () (interactive) (text-scale-decrease 1)))

;; Super wheel-up to increase font size in all buffers
(defun change-font-height (delta)
  (set-face-attribute 'default 
                      (selected-frame)
                      :height (+ (face-attribute 'default :height) delta)))
(global-set-key [M-wheel-up] '(lambda () (interactive) (change-font-height +4)))
(global-set-key [M-wheel-down] '(lambda () (interactive) (change-font-height -4)))

(setq inferior-lisp-program "/usr/local/bin/sbcl")

(add-hook 'clojure-mode-hook #'paredit-mode)

(add-hook 'clojure-mode-hook #'clj-refactor-mode)

(add-hook 'clojure-mode-hook #'cider-mode)

;; You can uncomment this to remove the graphical toolbar at the top. After
;; awhile, you won't need the toolbar.
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; This is useful for working with camel-case tokens, like names of
;; Java classes (e.g. JavaClassName)
(add-hook 'clojure-mode-hook 'subword-mode)

;; A little more syntax highlighting
;; (require 'clojure-mode-extra-font-locking)

;; syntax hilighting for midje
(add-hook 'clojure-mode-hook
          (lambda ()
            (setq inferior-lisp-program "lein repl")
            (font-lock-add-keywords
             nil
             '(("(\\(facts?\\)"
                (1 font-lock-keyword-face))
               ("(\\(background?\\)"
                (1 font-lock-keyword-face))))
            (define-clojure-indent (fact 1))
            (define-clojure-indent (facts 1))))
;;;;
;; Cider
;;;;

;; provides minibuffer documentation for the code you're typing into the repl
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

;; go right to the REPL buffer when it's finished connecting
(setq cider-repl-pop-to-buffer-on-connect t)

;; When there's a cider error, show its buffer and switch to it
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)

;; Where to store the cider history.
(setq cider-repl-history-file "~/.emacs.d/cider-history")

;; Wrap when navigating history.
(setq cider-repl-wrap-history t)

;; enable paredit in your REPL
(add-hook 'cider-repl-mode-hook 'paredit-mode)

;; Use clojure mode for other extensions
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))

;; key bindings
;; these help me out with the way I usually develop web apps
(defun cider-start-http-server ()
  (interactive)
  (cider-load-current-buffer)
  (let ((ns (cider-current-ns)))
    (cider-repl-set-ns ns)
    (cider-interactive-eval (format "(println '(def server (%s/start))) (println 'server)" ns))
    (cider-interactive-eval (format "(def server (%s/start)) (println server)" ns))))


(defun cider-refresh ()
  (interactive)
  (cider-interactive-eval (format "(user/reset)")))

(defun cider-user-ns ()
  (interactive)
  (cider-repl-set-ns "user"))

(eval-after-load 'cider
  '(progn
     (define-key clojure-mode-map (kbd "C-c C-v") 'cider-start-http-server)
     (define-key clojure-mode-map (kbd "C-M-r") 'cider-refresh)
     (define-key clojure-mode-map (kbd "C-c u") 'cider-user-ns)
     (define-key cider-mode-map (kbd "C-c u") 'cider-user-ns)))

;; Key binding to use "hippie expand" for text autocompletion
;; http://www.emacswiki.org/emacs/HippieExpand
(global-set-key (kbd "M-/") 'hippie-expand)

;; Lisp-friendly hippie expand
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;; Highlights matching parenthesis
(show-paren-mode 1)

;; Highlight current line
(global-hl-line-mode 1)

;; Don't use hard tabs
(setq-default indent-tabs-mode nil)

;; When you visit a file, point goes to the last place where it
;; was when you previously visited the same file.
;; http://www.emacswiki.org/emacs/SavePlace
(require 'saveplace)
(setq-default save-place t)
;; keep track of saved places in ~/.emacs.d/places
(setq save-place-file (concat user-emacs-directory "places"))

;; Emacs can automatically create backup files. This tells Emacs to
;; put all backups in ~/.emacs.d/backups. More info:
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Files.html
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
(setq auto-save-default nil)


;; comments
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-;") 'toggle-comment-on-line)

;; yay rainbows!
;; (global-rainbow-delimiters-mode t)

;; use 2 spaces for tabs
(defun die-tabs ()
  (interactive)
  (set-variable 'tab-width 2)
  (mark-whole-buffer)
  (untabify (region-beginning) (region-end))
  (keyboard-quit))

;; Sets up exec-path-from shell
;; https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs
   '("PATH")))

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

;; Shows a list of buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)


;; Enhances M-x to allow easier execution of commands. Provides
;; a filterable list of possible commands in the minibuffer
;; http://www.emacswiki.org/emacs/Smex
;; (setq smex-save-file (concat user-emacs-directory ".smex-items"))
;; (smex-initialize)
;;(global-set-key (kbd "M-x") 'smex)

;; projectile everywhere!
(projectile-global-mode)

;; Automatically load paredit when editing a lisp file
;; More at http://www.emacswiki.org/emacs/ParEdit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;; eldoc-mode shows documentation in the minibuffer when writing code
;; http://www.emacswiki.org/emacs/ElDoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; javascript / html
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(add-hook 'js-mode-hook 'subword-mode)
(add-hook 'html-mode-hook 'subword-mode)
(setq js-indent-level 2)
(eval-after-load "sgml-mode"
  '(progn
     (require 'tagedit)
     (tagedit-add-paredit-like-keybindings)
     (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))))


;; coffeescript
(add-to-list 'auto-mode-alist '("\\.coffee.erb$" . coffee-mode))
(add-hook 'coffee-mode-hook 'subword-mode)
(add-hook 'coffee-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'coffee-mode-hook
          (defun coffee-mode-newline-and-indent ()
            (define-key coffee-mode-map "\C-j" 'coffee-newline-and-indent)
            (setq coffee-cleanup-whitespace nil)))


;;;;;;;;
;; RUST
;;;;;;;;

;; Enable company globally for all mode
(global-company-mode)

;; Reduce the time after which the company auto completion popup opens
(setq company-idle-delay 0.2)

;; Reduce the number of characters before company kicks in
(setq company-minimum-prefix-length 1)

;; Load rust-mode when you open `.rs` files
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;; Set path to racer binary
(setq racer-cmd "~/bin/racer")

;; Set path to rust src directory
(setq racer-rust-src-path "/Users/englandd/.rust/src/")

;; Setting up configurations when you load rust-mode
(add-hook 'rust-mode-hook

     '(lambda ()
     ;; Enable racer
     (racer-activate)
  
	 ;; Hook in racer with eldoc to provide documentation
     (racer-turn-on-eldoc)
	 
	 ;; Use flycheck-rust in rust-mode
     (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
	 
	 ;; Use company-racer in rust mode
     (set (make-local-variable 'company-backends) '(company-racer))
	 
	 ;; Key binding to jump to method definition
     (local-set-key (kbd "M-.") #'racer-find-definition)
	 
	 ;; Key binding to auto complete and indent
     (local-set-key (kbd "TAB") #'racer-complete-or-indent)))

;; Maximize screen on startup

(setq initial-scratch-message nil)
(setq inhibit-start-screen 1)
(setq inhibit-splash-screen 1)
