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
                     flycheck-rust
                     parinfer))

(package-initialize)

;; Fetch list of packages available
(unless package-archive-contents
	(package-refresh-contents))

;; install the packages that are missing, if any
(dolist (package package-list)
	(unless (package-installed-p package)
		(package-install package)))

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
    (danneskjold-theme jdee dockerfile-mode babel elixir-mode popup-imenu elpy ein 4clojure python-mode fill-column-indicator ace-flyspell omn-mode ac-ispell window-numbering tidy tagedit smex slime rainbow-delimiters racer projectile neotree move-text monokai-theme markdown-mode magit key-chord ido-ubiquitous go-mode flycheck-rust find-file-in-repository expand-region ensime dired-details company-racer color-theme-solarized clojure-mode-extra-font-locking clj-refactor better-defaults ace-jump-mode)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'find-file-in-repository)

(put 'dired-find-alternate-file 'disabled nil)

(require 'dired-details)
(dired-details-install)

;; Put temporary and backup files elsewhere
(setq auto-save-file-name-transforms
          `((".*" ,(concat user-emacs-directory "auto-save/") t))) 
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))
(setq create-lockfiles nil)

(require 'yasnippet)
       
(require 'window-numbering)
(window-numbering-mode 1)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(defun save-all () (interactive) (save-some-buffers t))
(global-set-key (kbd "S-s") 'save-all)

(require 'whitespace)
(setq whitespace-line-column 120)
(setq whitespace-style '(face lines-tail))
(global-whitespace-mode +1)

(setq show-paren-delay 0)
(show-paren-mode 1)

;; Rainbow delimiters when programming
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Save on focus-out
(defun save-all ()
  (interactive)
  (save-some-buffers t))
(add-hook 'focus-out-hook 'save-all)

;; Exit emacs w/o prompts
(require 'cl)
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
           (cl-flet ((process-list ())) ad-do-it))

(add-hook 'markdown-mode-hook (lambda () (electric-indent-local-mode -1)))

(setq inferior-lisp-program "/usr/local/bin/sbcl")

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

;; eldoc-mode shows documentation in the minibuffer when writing code
;; http://www.emacswiki.org/emacs/ElDoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

(add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
(setq ispell-program-name "aspell")
(setq ispell-personal-dictionary "C:/path/to/your/.ispell")
(require 'ispell)
(global-set-key (kbd "<f8>") 'ispell-word)
(global-set-key (kbd "C-<f8>") 'flyspell-mode)

;; Python
(package-initialize)
(elpy-enable)
(setq python-shell-interpreter "C:\\Anaconda2\\envs\\py35\\python.exe")

;; Org-mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(org-babel-do-load-languages
      'org-babel-load-languages
      '((R . t)
    (python . t)
    (sh . t)
    (ruby . t)
    (clojure . t)
    (js . t)
    (haskell . t)
    (java . t)
    (latex . t)
    (lisp . t)
    (sass . t)
    (css . t)
    (scheme . t)))

(setq org-log-done t)

(require 'company)
(global-company-mode t)

(require `neotree)
(defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (if project-dir
          (if (neotree-toggle)
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name)))
        (message "Could not find git project root."))))
(global-set-key [f8] `neotree-project-dir)
(setq neo-smart-open t)

;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")

;; For random keybindings
(load "keybindings.el")

;; Langauage-specific
(load "setup-clojure.el")
(load "setup-js.el")
(load "setup-rust.el")
(load "setup-java.el")
(load "setup-scala.el")

;; Maximize screen on startup
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

