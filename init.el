;    (require 'package)
;  (setq package-archives '(("melpa" . "https://melpa.org/packages/")
;			   ("org" . "https://orgmode.org/elpa")
;			   ("elpa" . "https://elpa.gnu.org/packages/")))

;;  (package-initialize)
;;  (unless package-archive-contents
;;    (package-refresh-contents))

;;  (unless (package-installed-p 'use-package)
;;    (package-install 'use-package))

;;    (require 'use-package)
;;    (setq use-package-always-ensure t)

  ;; Set up package.el to work with MELPA
  (require 'package)
  (add-to-list 'package-archives
	       '("melpa" . "https://melpa.org/packages/"))
  (package-initialize)
  (package-refresh-contents)

  ;; Download Evil
  (unless (package-installed-p 'evil)
    (package-install 'evil))

  ;; Enable Evil
  (require 'evil)
  (evil-mode 1)

  (with-eval-after-load 'evil-maps
    (define-key evil-motion-state-map (kbd "SPC") nil)
    (define-key evil-motion-state-map (kbd "RET") nil)
    (define-key evil-motion-state-map (kbd "TAB") nil))

  (setq inhibit-startup-message t)
  (global-visual-line-mode t)
  (global-display-line-numbers-mode 1)

  ;; Make ESC quit prompts
  (global-set-key (kbd "<escape>") 'keyboard-escape-quit)
  (setq org-return-follows-link t)
  (scroll-bar-mode t)
  (tool-bar-mode -1)
  (set-fringe-mode -1)

  (menu-bar-mode -1)
  (setq visible-bell t)

;;  (set-default-coding-system 'utf-8)

  (global-set-key (kbd "C-M-u") 'universal-argument)

  (electric-pair-mode t)

  (set-face-attribute 'default nil :font "Courier New" :height 140)

(use-package all-the-icons
  :if (display-graphic-p))

  (use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-xcode t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(setq org-startup-with-inline-images t)

  (use-package ivy
    :diminish
    :bind (("C-s" . swiper)
	   :map ivy-minibuffer-map
	   ("TAB" . ivy-alt-done)
	   ("C-l" . ivy-alt-done)
	   ("C-j" . ivy-next-line)
	   ("C-k" . ivy-previous-line)
	   :map ivy-switch-buffer-map
	   ("C-k" . ivy-previous-line)
	   ("C-l" . ivy-done)
	   ("C-d" . ivy-switch-buffer-kill)
	   :map ivy-reverse-i-search-map
	   ("C-k" . ivy-previous-line)
	   ("C-d" . ivy-reverse-i-search-kill))
    :config
    (ivy-mode 1))
  (setq ivy-use-selectable-prompt t)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-current-match t)
  (unless (package-installed-p 'counsel)
    (package-install 'counsel))

  (require 'counsel)
  (use-package counsel)

    (unless (package-installed-p 'dashboard)
      (package-install 'dashboard))
    (use-package dashboard
      :config
      (dashboard-setup-startup-hook))

  (use-package org-roam
  :ensure t
  :custom
  (org-roam-directory ("./.org-roam"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
	 ("C-c n f" . org-roam-node-find)
	 ("C-c n g" . org-roam-graph)
	 ("C-c n i" . org-roam-node-insert)
	 ("C-c n c" . org-roam-capture)
	 ;; Dailies
	 ("C-c n j" . org-roam-dailies-capture-today))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))

(setq org-src-preserve-indentation t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package org-modern
  :ensure t
  :defer t
  :init)

(setq
 ;; Edit settings
 org-auto-align-tags nil
 org-tags-column 0
 org-catch-invisible-edits 'show-and-error
 org-special-ctrl-a/e t
 org-insert-heading-respect-content t

 ;; Org styling, hide markup etc.
 org-hide-emphasis-markers t
 org-pretty-entities t

 ;; Agenda styling
 org-agenda-tags-column 0
 org-agenda-block-separator ?─
 org-agenda-time-grid
 '((daily today require-timed)
   (800 1000 1200 1400 1600 1800 2000)
   " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
 org-agenda-current-time-string
 "◀── now ─────────────────────────────────────────────────")

;; Ellipsis styling
(setq org-ellipsis "…")

(global-org-modern-mode)

(setq org-agenda-include-diary t)
(setq diary-file "./.diary")
(require 'org-habit)

  (require 'org-tempo)

  (add-to-list 'org-structure-template-alist '("el" . "src elisp"))
