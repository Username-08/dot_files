(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))
(setq gc-cons-threshold (* 1024 1024 100))

(pixel-scroll-precision-mode)

(defvar elpaca-installer-version 0.11)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1 :inherit ignore
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (<= emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (let ((load-source-file-function nil)) (load "./elpaca-autoloads"))))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

(elpaca elpaca-use-package
  ;; Enable use-package :ensure support for Elpaca.
  (elpaca-use-package-mode))

;; (use-package meow :ensure (:wait t) :demand t)

;; (defun meow-setup ()
;; (setq meow-cheatsheet-layout meow-cheatsheet-layout-colemak)
;; (meow-motion-overwrite-define-key
;;  ;; Use e to move up, n to move down.
;;  ;; Since special modes usually use n to move down, we only overwrite e here.
;;  '("e" . meow-prev)
;;  '("<escape>" . ignore))
;; (meow-leader-define-key
;;  '("?" . meow-cheatsheet)
;;  ;; To execute the originally e in MOTION state, use SPC e.
;;  '("e" . "H-e")
;;  '("1" . meow-digit-argument)
;;  '("2" . meow-digit-argument)
;;  '("3" . meow-digit-argument)
;;  '("4" . meow-digit-argument)
;;  '("5" . meow-digit-argument)
;;  '("6" . meow-digit-argument)
;;  '("7" . meow-digit-argument)
;;  '("8" . meow-digit-argument)
;;  '("9" . meow-digit-argument)
;;  '("0" . meow-digit-argument))
;; (meow-normal-define-key
;;  '("0" . meow-expand-0)
;;  '("1" . meow-expand-1)
;;  '("2" . meow-expand-2)
;;  '("3" . meow-expand-3)
;;  '("4" . meow-expand-4)
;;  '("5" . meow-expand-5)
;;  '("6" . meow-expand-6)
;;  '("7" . meow-expand-7)
;;  '("8" . meow-expand-8)
;;  '("9" . meow-expand-9)
;;  '("-" . negative-argument)
;;  '(";" . meow-reverse)
;;  '("," . meow-inner-of-thing)
;;  '("." . meow-bounds-of-thing)
;;  '("[" . meow-beginning-of-thing)
;;  '("]" . meow-end-of-thing)
;;  '("/" . meow-visit)
;;  '("a" . meow-append)
;;  '("A" . meow-open-below)
;;  '("v" . meow-back-word)
;;  '("V" . meow-back-symbol)
;;  '("c" . meow-change)
;;  '("e" . meow-prev)
;;  '("E" . meow-prev-expand)
;;  '("f" . meow-find)
;;  '("g" . meow-delete)
;;  '("b" . meow-cancel-selection)
;;  '("B" . meow-grab)
;;  '("h" . meow-left)
;;  '("H" . meow-left-expand)
;;  '("i" . meow-right)
;;  '("I" . meow-right-expand)
;;  '("j" . meow-join)
;;  '("k" . meow-kill)
;;  '("l" . meow-line)
;;  '("L" . meow-goto-line)
;;  '("m" . meow-mark-word)
;;  '("M" . meow-mark-symbol)
;;  '("n" . meow-next)
;;  '("N" . meow-next-expand)
;;  '("o" . meow-block)
;;  '("O" . meow-to-block)
;;  '("p" . meow-yank)
;;  '("q" . meow-quit)
;;  '("r" . meow-replace)
;;  '("s" . meow-insert)
;;  '("S" . meow-open-above)
;;  '("t" . meow-till)
;;  '("u" . meow-undo)
;;  '("U" . meow-undo-in-selection)
;;  '("d" . meow-search)
;;  '("w" . meow-next-word)
;;  '("W" . meow-next-symbol)
;;  '("x" . meow-delete)
;;  '("X" . meow-backward-delete)
;;  '("y" . meow-save)
;;  '("z" . meow-pop-selection)
;;  '("'" . repeat)
;;  '("<escape>" . ignore)
;;  '("}" . forward-paragraph)
;;  '("{" . backward-paragraph)))

;; (require 'meow)
;; (meow-setup)
;; (meow-global-mode 1)

(setq evil-want-keybinding nil)
(use-package evil :ensure t :config (evil-mode 1))
(use-package evil-collection :ensure t :config (evil-collection-init))

(use-package vertico
:ensure t
:config
(setq vertico-cycle t)
(setq vertico-resize nil)
(vertico-mode 1))

(use-package marginalia
:ensure t
:config
(marginalia-mode 1))

(use-package consult
:ensure t
:config)

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package pdf-tools
  :ensure t
  :config)

(use-package doom-themes :ensure (:wait t))

;; (use-package nano-emacs
  ;; :ensure (
	     ;; :host github
	     ;; :repo "rougier/nano-emacs"
	     ;; :main "nano.el"))

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
	   ("C-c C-e" . markdown-do)))

(use-package rust-mode
  :ensure t
  :config (setq rust-mode-treesitter-derive t))

(use-package rustic :ensure t)

(use-package yasnippet :ensure t :config (yas-global-mode 1))
(use-package yasnippet-snippets :ensure t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq display-line-numbers-type 'relative)
;; (global-display-line-numbers-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode) (add-hook 'text-mode-hook 'display-line-numbers-mode)

(setq treesit-font-lock-level 6)
(set-frame-font "JetBrainsMono NF Bold 13")
;;(add-to-list 'default-frame-alist '(font . "JetBrainsMono NF SemiBold 13"))
;;(set-face-attribute 'default nil :font "JetBrainsMono NF SemiBold 13")

;; Set the fixed pitch face
;;(set-face-attribute 'fixed-pitch nil :font "JetBrainsMono NF SemiBold 13")

;; Set the variable pitch face
;;(set-face-attribute 'variable-pitch nil :font "Cantarell" :height efs/default-variable-font-size :weight 'regular))
;;(set-face-attribute 'variable-pitch nil :font "Ubuntu Nerd Font Medium 13")

(add-to-list 'custom-theme-load-path "~/.config/emacs/themes")
(load-theme 'gruvbox-flat)
