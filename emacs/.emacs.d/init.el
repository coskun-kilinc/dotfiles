(setq inhibit-startup-message t) ; Don't show the splash screen

(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)

(column-number-mode)
(global-display-line-numbers-mode 1)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)


(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)


(set-face-attribute `default nil :font "Hack Nerd Font Mono" :height 160)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(setq backup-directory-alist `(("." . "~/.emacs_backups")))

(setq auto-save-file-name-transforms
      `((".*" "~/.emacs_autosaves/" t)))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)

(use-package command-log-mode)
(ivy-mode 1)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 20)))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

;; (unless (package-installed-p 'org-present)
;;  (package-install 'org-present))

(use-package org)

(use-package org-present
  :ensure t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))


(add-hook 'org-present-mode-hook
          (lambda ()
            (org-display-inline-images)
            (org-present-read-only)
            (org-latex-preview)))

(add-hook 'org-present-mode-quit-hook
          (lambda ()
            (org-remove-inline-images)
            (org-present-show-cursor)
            (org-present-read-write)
            (org-latex-remove-preview)))

(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . markdown-mode)
  :config
  (setq markdown-command "pandoc"))
