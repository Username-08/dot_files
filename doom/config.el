;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Yash Ranjan"
      user-mail-address "yashranjan08@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'gruvbox-flat)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 17 :weight 'medium))

(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(add-to-list 'load-path "~/.emacs.d/.local/straight/build-28.2/emacs-application-framework/")
(require 'eaf)
(require 'eaf-markdown-previewer)
(require 'eaf-video-player)
(require 'eaf-jupyter)
(require 'eaf-browser)
(require 'eaf-image-viewer)
(require 'eaf-pdf-viewer)
(require 'eaf-org-previewer)
(require 'eaf-evil)

(define-key key-translation-map (kbd "SPC")
    (lambda (prompt)
      (if (derived-mode-p 'eaf-mode)
          (pcase eaf--buffer-app-name
            ("browser" (if  (string= (eaf-call-sync "call_function" eaf--buffer-id "is_focus") "True")
                           (kbd "SPC")
                         (kbd eaf-evil-leader-key)))
            ("pdf-viewer" (kbd eaf-evil-leader-key))
            ("image-viewer" (kbd eaf-evil-leader-key))
            (_  (kbd "SPC")))
        (kbd "SPC"))))

(setq browse-url-browser-function 'eaf-open-browser)
(setq eaf-browser-enable-adblocker "true")
(setq eaf-browser-continue-where-left-off t)
(setq eaf-browser-default-search-engine "duckduckgo")
(setq eaf-browse-blank-page-url "https://duckduckgo.com")

;;(require 'company)
;;(define-key company-active-map (kbd "SPC") 'company-complete-selection)
;;(set 'company-auto-commit t)
;;(setq company-auto-commit 'company-explicit-action-p)

;;(setq dap-auto-configure-mode t)
(require 'dap-cpptools)

(require 'projectile)
(add-to-list 'projectile-project-root-files-bottom-up "Cargo.toml")
(add-to-list 'projectile-project-root-files-bottom-up "tsconfig.json")

(require 'tree-sitter)
(tree-sitter-hl-add-patterns 'rust
  [( ["==" "=>" "->" ";" "(" ")" "{" "}" "[" "]" "<" ">" "=" "|" "&" "^" "." "," ":" "::" ">=" "<=" "!=" "+=" "-=" "*=" "/=" "/" "*" "-" "+"] @function.macro)] )
(setq select-enable-clipboard nil)

;; (require 'flycheck)
;; (setq flycheck-check-syntax-automatically '(save mode-enabled))

(require 'evil)
(setq evil-insert-state-cursor '("#d2b48c" box))
(setq evil-normal-state-cursor '("#d2b48c" box))
(setq evil-visual-state-cursor '("#d2b48c" box))
(setq evil-replace-state-cursor '("#d2b48c" box))
(setq evil-emacs-state-cursor '("#d2b48c" box))
(setq evil-motion-state-cursor '("#d2b48c" box))
(setq evil-operator-state-cursor '("#d2b48c" box))

;(defun company-box-doc--make-buffer (object)
;  (let* ((buffer-list-update-hook nil)
;         (inhibit-modification-hooks t)
;         (string (cond ((stringp object) object)
;                       ((bufferp object) (with-current-buffer object (buffer-string))))))
;    (when (and string (> (length (string-trim string)) 0))
;      (with-current-buffer (company-box--get-buffer "doc")
;        (erase-buffer)
;        (insert string)
;        (setq mode-line-format nil
;              display-line-numbers nil
;              header-line-format nil
;              show-trailing-whitespace nil
;              cursor-in-non-selected-windows nil)
;
;        (toggle-truncate-lines -1) ;; PATCHED HERE
;
;        (current-buffer)))))
