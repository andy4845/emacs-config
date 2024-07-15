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

(set-face-attribute 'default nil :font "Courier New" :height 140)

(require 'org-tempo)

(add-to-list 'org-structure-template-alist '("el" . "src elisp"))
