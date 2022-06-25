;;; init.el --- Peter's Emacs config file
;;
;; Copyright (C) 2015-2021 by Peter Brovchenko <p.brovchenko@protonmail.com>
;;
;; Author: Peter Brovchenko <p.brovchenko@protonmail.com>
;; URL: https://github.com/ChaoticEvil/configs/tree/master/.emacs.d/init.el
;; Version: 0.8.7
;;
;;; Commentary:
;;
;; Yet another Emacs customization :)
;;
;;; Code:

;;; ================================================================================
;;; Common settings
;;; ================================================================================

;; Increase GC threshold to speed up startup.
;; Reset the GC threshold after initialization, and GC whenever we tab out.
(setq gc-cons-threshold (* 64 1000 1000))
(add-hook 'after-init-hook #'(lambda ()
                               ;; restore after startup
                               (setq gc-cons-threshold (* 2 1000 1000))))
(add-hook 'focus-out-hook 'garbage-collect)
(run-with-idle-timer 5 t 'garbage-collect)

;; Encoding
(set-language-environment            'UTF-8)
(setq buffer-file-coding-system      'utf-8)
(setq-default coding-system-for-read 'utf-8)
(setq file-name-coding-system        'utf-8)
(set-selection-coding-system         'utf-8)
(set-keyboard-coding-system          'utf-8)
(set-terminal-coding-system          'utf-8)
(prefer-coding-system                'utf-8)

;; Disable autosave
(setq make-backup-files        nil)
(setq auto-save-default        nil)
(setq auto-save-list-file-name nil)

;; Create variable for check terminal mode
(defun is-in-terminal()
  (not (display-graphic-p)))

;; Line numbers
(global-display-line-numbers-mode)

;; Fringes
(if (not (is-in-terminal))
    (fringe-mode '(8 . 0))
  (setq-default indicate-empty-lines t) ;; Gliph indicate for empty line
  (setq-default indicate-buffer-boundaries 'left)) ;; Only left-indication

;; Disable scrollbar for X version
(if (not (is-in-terminal))
    (scroll-bar-mode   -1))

;; Set custom format for modeline
(setq-default mode-line-format
              (list
               "----------"
               ;; the buffer name; the file name as a tool tip
               '(:eval (propertize " %b " 'face 'font-lock-keyword-face))

               ;; '(:eval (list (nyan-create)))

               ;; line and column
               "(" ;; '%02' to set to 2 chars at least; prevents flickering
               (propertize "%02lL" 'face 'font-lock-type-face) ","
               (propertize "%02cC" 'face 'font-lock-type-face)
               ") "

               ;; relative position, size of file
               "["
               (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
               "/"
               (propertize "%I" 'face 'font-lock-constant-face) ;; size
               "] "

               ;; the current major mode for the buffer.
               "["
               '(:eval (propertize "%m" 'face 'font-lock-string-face))
               "] "

               "[" ;; insert vs overwrite mode, input-method in a tooltip
               '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
                        'face 'font-lock-preprocessor-face))

               ;; was this buffer modified since the last save?
               '(:eval (when (buffer-modified-p)
                         (concat ","  (propertize "Mod"
                                                  'face 'font-lock-warning-face))))

               ;; is this buffer read-only?
               '(:eval (when buffer-read-only
                         (concat ","  (propertize "RO"
                                                  'face 'font-lock-type-face))))
               "] "

               ;; minor modes
               ;; minor-mode-alist

               ;; add the time, with the date and the emacs uptime in the tooltip
               '(:eval (propertize (format-time-string "%H:%M")))

               " %-" ;; fill with '-'
               ))

;; Words wrap
(setq word-wrap          t) ;; Wrap by word
(global-visual-line-mode t)

;; Syntax highlight
(require 'font-lock)
(setq font-lock-maximum-decoration t)

;; Indentation
(setq-default indent-tabs-mode nil
              tab-width 4
              fill-column 80
              c-basic-offset 4        ;; Indentation level for C
              c-default-style "k&r"   ;; C-specific style
              indicate-empty-lines t) ;; Highlight end of buffer?
(global-set-key (kbd "RET") 'newline-and-indent) ;; Autoindent for newline
(setq lisp-indent-function  'common-lisp-indent-function) ;; Enable indent for lisp code

;; Scroll
(setq scroll-step               1) ;; Scroll by one line
(setq scroll-margin             5) ;; Set top and bottom scroll margin as a five lines
(setq scroll-conservatively 10000)

;; Clipboard settings
(setq select-enable-clipboard t)

;; Search results highlight
(setq search-highlight        t)
(setq query-replace-highlight t)

;; Enable for delete selected text region
(delete-selection-mode t)

;; Short answers (yes->y, no->n)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Remove trailing whitespace before save buffer
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Disable debug messages
(setq debug-on-error nil)

;;; ================================================================================
;;; /Common settings
;;; ================================================================================


;;; ================================================================================
;;; Look and Feel settings
;;; ================================================================================

(electric-pair-mode 1) ;; Autocompare scopes
(show-paren-mode t)    ;; Enable highlight for scopes
(setq show-paren-style 'expression)
(tooltip-mode      -1) ;; Disable tooltip
(menu-bar-mode     -1) ;; Disable menubar
(tool-bar-mode     -1) ;; Disable toolbar

(setq use-dialog-box nil                  ;; No gui dialogs. Only minibuffer.
      ring-bell-function 'ignore          ;; Disable bell sound
      inhibit-startup-message t           ;; Disable startup message
      inhibit-splash-screen   t           ;; Disable splash-screen
      initial-scratch-message ""          ;; Empty string into *scratch* buffer
      confirm-kill-emacs nil              ;; Always confirm before closing Emacs?
      show-trailing-whitespace t          ;; Display trailing whitespace.
      frame-title-format "GNU Emacs: %b") ;; Set window title as 'GNU Emacs: <filename>'

;; Set font only if we're not in the terminal.
(when (display-graphic-p)
  ;; Function for checking font existence.
  (defun font-exists-p (font)
    "Check if FONT exists."
    (if (null (x-list-fonts font)) nil t))
  (declare-function font-exists-p "init.el")

  ;; Set font.
  (cond
    ((font-exists-p "Iosevka")
     (set-face-attribute
      'default nil :font "Iosevka:weight=Medium" :height 150)
     (setq-default line-spacing 0))))

;; Highlight current line
(global-hl-line-mode nil)

;;; ================================================================================
;;; /Look and Feel settings
;;; ================================================================================


;;; ================================================================================
;;; Shortcusts settings
;;; ================================================================================

;; Move cursor up
(global-unset-key (kbd "M-i"))
(global-set-key (kbd "M-i") 'previous-line)

;; Move cursor down
(global-unset-key (kbd "M-k"))
(global-set-key (kbd "M-k") 'next-line)

;; Move cursor left
(global-unset-key (kbd "M-j"))
(global-set-key (kbd "M-j") 'backward-char)

;; Move cursor right
(global-unset-key (kbd "M-l"))
(global-set-key (kbd "M-l") 'forward-char)

;; Move page up
(global-unset-key (kbd "M-I"))
(global-set-key (kbd "M-I") 'scroll-down-command)

;; Move page down
(global-unset-key (kbd "M-K"))
(global-set-key (kbd "M-K") 'scroll-up-command)

;; Forward word
(global-unset-key (kbd "M-L"))
(global-set-key (kbd "M-L") 'forward-word)

;; Backward word
(global-unset-key (kbd "M-J"))
(global-set-key (kbd "M-J") 'backward-word)

;; Beginnning of line
(global-unset-key (kbd "M-h"))
(global-set-key (kbd "M-h") 'move-beginning-of-line)

;; End of line
(global-unset-key (kbd "M-H"))
(global-set-key (kbd "M-H") 'move-end-of-line)

;; Beginning of buffer
(global-unset-key (kbd "M-n"))
(global-set-key (kbd "M-n") 'beginning-of-buffer)

;; End of buffer
(global-unset-key (kbd "M-N"))
(global-set-key (kbd "M-N") 'end-of-buffer)

;; Move cursor in next window
(global-unset-key (kbd "M-s"))
(global-set-key (kbd "M-s") 'other-window)

;;
;; Editing
;;

;; Delete
(global-unset-key (kbd "M-f"))
(global-set-key (kbd "M-f") 'delete-forward-char)

;; Backspace
(global-unset-key (kbd "M-d"))
(global-set-key (kbd "M-d") 'delete-backward-char)

;; Delete word
(global-unset-key (kbd "M-r"))
(global-set-key (kbd "M-r") 'kill-word)

;; Delete word backward
(global-unset-key (kbd "M-e"))
(global-set-key (kbd "M-e") 'backward-kill-word)

;; Enter
(global-unset-key (kbd "M-m"))
(global-set-key (kbd "M-m") 'reindent-then-newline-and-indent)

;; Select region
(global-unset-key (kbd "M-SPC"))
(global-set-key (kbd "M-SPC") 'set-mark-command)

;; Copy selected region
(global-unset-key (kbd "M-c"))
(global-set-key (kbd "M-c") 'kill-ring-save)

;; Cut selected region
(global-unset-key (kbd "M-x"))
(global-set-key (kbd "M-x") 'kill-region)

;; Past selected region
(global-unset-key (kbd "M-v"))
(global-set-key (kbd "M-v") 'yank)

;; Undo
(global-unset-key (kbd "M-z"))
(global-set-key (kbd "M-z") 'undo)

;; Redo
(global-unset-key (kbd "M-Z"))
(global-set-key (kbd "M-Z") 'undo-only)

;; Open file
(global-unset-key (kbd "C-o"))
(global-set-key (kbd "C-o") 'find-file)

;; Comment or uncomment selected region
(global-unset-key (kbd "M-'"))
(global-set-key (kbd "M-'") 'comment-or-uncomment-region)

;; Revert buffer
(global-unset-key (kbd "C-M-r"))
(global-set-key (kbd "C-M-r") 'revert-buffer)

;; Change Meta for OS X
;; (cond
;;   ((string-equal system-type "darwin")
;;    (progn
;;      (setq mac-option-key-is-meta nil)
;;      (setq mac-command-key-is-meta nil)
;;      (setq mac-command-modifier 'meta)
;;      (setq mac-option-modifier nil))))

;; ;; Move page up
;; (global-unset-key (kbd "C-S-p"))
;; (global-set-key (kbd "C-S-p") 'scroll-down-command)

;; ;; Move page down
;; (global-unset-key (kbd "C-S-n"))
;; (global-set-key (kbd "C-S-n") 'scroll-up-command)

;; ;; Undo
;; (global-unset-key (kbd "C-z"))
;; (global-set-key (kbd "C-z") 'undo)

;; ;; Redo
;; (global-unset-key (kbd "C-Z"))
;; (global-set-key (kbd "C-Z") 'undo-only)

;; ;; Change Meta for OS X
;; ;; (cond
;; ;;   ((string-equal system-type "darwin")
;; ;;    (progn
;; ;;      (setq mac-option-key-is-meta nil)
;; ;;      (setq mac-command-key-is-meta nil)
;; ;;      (setq mac-command-modifier 'meta)
;; ;;      (setq mac-option-modifier nil))))

;; (cond
;;   ((string-equal system-type "darwin")
;;    (progn
;;      (setq mac-option-key-is-meta nil)
;;      (setq mac-command-key-is-meta nil)
;;      (setq mac-command-modifier 'control)
;;      (setq mac-option-modifier 'meta))))


;;; ================================================================================
;;; /Shortcusts settings
;;; ================================================================================


;;; ================================================================================
;;; Biltin packages settings
;;; ================================================================================

;; IDO
(require 'ido)
(ido-mode                      t)
(icomplete-mode                t)
(ido-everywhere                t)
(setq ido-vitrual-buffers      t)
(setq ido-enable-flex-matching t)

;; Org-mode
(setq org-todo-keywords '((sequence "TODO" "IN PROGRESS" "|" "DONE" "DELEGATED")))
(setq org-src-fontify-natively 't)
(org-babel-do-load-languages
 'org-babel-load-languages '((C . t)
                             (shell . t)
                             (perl . t)
                             (python . t)))

;; Execute Emacs command
(global-unset-key (kbd "C-5"))
(global-set-key (kbd "C-5") 'execute-extended-command)

;; List of buffers (with *scratch)
(require 'bs)
(setq bs-configurations
      '(("files" "^\\*scratch\\*" nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)))
(global-unset-key (kbd "<f2>"))
(global-set-key (kbd "<f2>") 'bs-show)

;; Folding
(require 'hideshow)
(defvar hs-special-modes-alist
  (mapcar 'purecopy
          '((c-mode "{" "}" "/[*/]" nil nil)
            (c++-mode "{" "}" "/[*/]" nil nil)
            (bibtex-mode ("@\\S(*\\(\\s(\\)" 1))
            (java-mode "{" "}" "/[*/]" nil nil)
            (scala-mode "{" "}" "/[*/]" nil nil)
            (cperl-mode "{" "}" "/[*/]" nil nil)
            (js-mode "{" "}" "/[*/]" nil)
            (js2-mode "{" "}" "/[*/]" nil nil)
            (json-mode "{" "}" "/[*/]" nil nil))))
(global-set-key (kbd "M-<f9>") 'hs-toggle-hiding)
(global-set-key (kbd "C-<f9>") 'hs-hide-all)
(global-set-key (kbd "C-S-<f9>") 'hs-show-all)

;; Bookmarks
(global-set-key (kbd "C-1") 'bookmark-set)
(global-set-key (kbd "C-2") 'bookmark-jump)
(global-set-key (kbd "C-3") 'bookmark-bmenu-list)

;;; ================================================================================
;;; /Biltin packages settings
;;; ================================================================================


;;; ================================================================================
;;; Third-party packages settings
;;; ================================================================================

(require 'package)
;; Explicitly enable packages.
(setq package-enable-at-startup nil)
;; Add package sources.
(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; Run auto-load functions specified by package authors.
(package-initialize)

;; Require use-package.
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Set theme (Nimbus)
(use-package nimbus-theme
    :ensure t)

(load-theme 'nimbus t)

;; Snippets system
(use-package yasnippet
    :ensure t
    :init (yas-global-mode t)
    :config
    ;; Snippets collection
    (use-package yasnippet-snippets
        :ensure t))

;; Company mode for total auto-completion.
(use-package company
    :ensure t
    :diminish company-mode
    :bind ("M-/" . company-complete)
    :hook (after-init . global-company-mode)
    :config (setq company-tooltip-limit 20
                  company-tooltip-align-annotations t)
    :init (setq company-idle-delay 0
                company-tooltip-align-annotations t
                company-minimum-prefix-length 3)
    (global-company-mode 1))

;; Rainbow delimiters
(use-package rainbow-delimiters
    :ensure t
    :config
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;; Magit
(use-package magit
    :diminish auto-revert-mode
    :bind (("<f6>" . magit-status))
    :init (setq
           ;; Show fine differences for all displayed diff hunks.
           magit-diff-refine-hunk `all
           magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1
           ;; Don't ask before saving repository buffers.
           magit-save-repository-buffers 'dontask))

;; Web-mode
(use-package web-mode
    :mode (("\\.html$"        . web-mode)
           ("\\.phtml\\'"     . web-mode)
           ("\\.tpl\\.php\\'" . web-mode)
           ("\\.[agj]sp\\'"   . web-mode)
           ("\\.as[cp]x\\'"   . web-mode)
           ("\\.erb\\'"       . web-mode)
           ("\\.mustache\\'"  . web-mode)
           ("\\.djhtml\\'"    . web-mode)
           ("\\.ejs\\'"       . web-mode)
           ("\\.html?\\'"     . web-mode)
           ("\\.js?\\'"       . web-mode)
           ("\\.jsx?\\'"      . web-mode)
           ("\\.css?\\'"      . web-mode)
           ("\\.scss?\\'"     . web-mode)
           ("\\.ep?\\'"       . web-mode)
           ("\\.vbhtml?\\'"   . web-mode)
           ("\\.jinja\\'"     . web-mode))
    :config (setq web-mode-markup-indent-offset 4
                  web-mode-code-indent-offset 4
                  web-mode-css-indent-offset 4
                  js-indent-level 4
                  web-mode-enable-auto-pairing t
                  web-mode-enable-auto-expanding t
                  web-mode-enable-css-colorization t
                  web-mode-engines-alist '(("underscore" . "\\.html\\'")))
    (add-hook 'web-mode-hook 'electric-pair-mode))

;; Markdowm
(use-package markdown-mode
    :mode "\\.md\\'")

;; YAML
(use-package yaml-mode
    :ensure t
    :mode (("\\.yml\\'"   . yaml-mode)
           ("\\.yaml\\'" . yaml-mode)))

;; Pomidor
(use-package pomidor
    :ensure t
    :config (setq pomidor-sound-tick nil
                  pomidor-sound-tack nil
                  pomidor-sound-overwork nil
                  pomidor-sound-break-over nil)
    :hook (pomidor-mode . (lambda ()
                            (display-line-numbers-mode nil)
                            (setq left-fringe-width 0 right-fringe-width 0)
                            (setq left-margin-width 2 right-margin-width 0)
                            (set-window-buffer nil (current-buffer)))))

;; Crux
(use-package crux
    :bind (("M-h" . crux-move-beginning-of-line)
           ("C-k" . crux-kill-whole-line)
           ("C-j" . crux-top-join-line)))

;; Smart region selection
(use-package expand-region
    :ensure t
    :bind ("M--". 'er/expand-region))

;; Hightlight word under cursor
(use-package highlight-symbol
    :ensure t
    :bind (("M-8" . 'highlight-symbol-next)
           ("M-7" . 'highlight-symbol-prev)
           ("M-9" . 'highlight-symbol-query-replace)
           ("M-0" . 'highlight-symbol-mode))
    :config (setq highlight-symbol-on-navigation-p t))

;; Restclient - http client
(use-package restclient
    :ensure t)
(use-package company-restclient
    :ensure t
    :config
    (add-to-list 'company-backends 'company-restclient))

;; Syntax check
(use-package flycheck
    :ensure t
    :config
    (add-hook 'after-init-hook #'global-flycheck-mode)

    (setq flycheck-perl-include-path '("/usr/lib/perl5/5.36/"
                                       "/usr/lib/perl5/5.36/core_perl"
                                       "/usr/lib/perl5/5.36/site_perl"
                                       "/usr/lib/perl5/5.36/vendor_perl"
                                       "/home/peter/perl5"
                                       "/home/peter/perl5/bin"
                                       "/home/peter/perl5/lib/perl5"
                                       "/home/peter/work/regru/srs/lib"))
    ;; Flycheck and perlcritic
    (flycheck-define-checker perl-perlcritic
      "A perl syntax checker using perlcritic. See URL `http://search.cpan.org/dist/Perl-Critic/bin/perlcritic'"
      :command ("perlcritic" "-p" "/Volumes/data/peter/.perlcriticrc" source)
      :error-patterns
      ((error line ":" column ":" (any "5") ":" (message))
       (warning line ":" column ":" (any "234") ":" (message))
       (info line ":" column ":" (any "1") ":" (message)))
      :modes (cperl-mode perl-mode)
      :next-checkers (perl))

    (flycheck-define-checker perl
      "A Perl syntax checker using the Perl interpreter. See URL `http://www.perl.org'."
      :command ("perl" "-w" "-c" source)
      :error-patterns
      ((error line-start (minimal-match (message))
              " at " (file-name) " line " line
              (or "." (and ", " (zero-or-more not-newline))) line-end))
      :modes (perl-mode cperl-mode))

    (setq-default flycheck-highlighting-mode 'lines)
    ;; Define fringe indicator / warning levels
    (define-fringe-bitmap 'flycheck-fringe-bitmap-ball
        (vector #b00000000
                #b00000000
                #b00000000
                #b00000000
                #b00000000
                #b00000000
                #b00000000
                #b00011100
                #b00111110
                #b00111110
                #b00111110
                #b00011100
                #b00000000
                #b00000000
                #b00000000
                #b00000000
                #b00000000))
    (flycheck-define-error-level 'error
      :severity 2
      :overlay-category 'flycheck-error-overlay
      :fringe-bitmap 'flycheck-fringe-bitmap-ball
      :fringe-face 'flycheck-fringe-error)
    (flycheck-define-error-level 'warning
      :severity 1
      :overlay-category 'flycheck-warning-overlay
      :fringe-bitmap 'flycheck-fringe-bitmap-ball
      :fringe-face 'flycheck-fringe-warning)
    (flycheck-define-error-level 'info
      :severity 0
      :overlay-category 'flycheck-info-overlay
      :fringe-bitmap 'flycheck-fringe-bitmap-ball
      :fringe-face 'flycheck-fringe-info))

;; Org-mode bullets
(use-package org-bullets
    :ensure t
    :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;;; ================================================================================
;;; /Third-party packages settings
;;; ================================================================================


;; ================================================================================
;; Languages
;; ================================================================================

;; --------------------------------------------------------------------------------
;; C
;;

;; Set indention for C-mode
(setq-default c-basic-offset 4)

(use-package irony
    :ensure t
    :config
    (add-hook 'c-mode-hook 'irony-mode)
    (add-hook 'c++-mode-hook 'irony-mode)
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(use-package company-irony
    :ensure t
    :config
    (require 'company)
    (add-to-list 'company-backends 'company-irony))

(use-package flycheck-irony
    :ensure t
    :hook (flycheck-mode . flycheck-irony-setup))

;;
;; /C
;; --------------------------------------------------------------------------------


;; --------------------------------------------------------------------------------
;; Perl
;;

;; Auto associate with cperl-mode
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\|t\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

(setq cperl-invalid-face nil)    ;; disable errors
(setq cperl-electric-keywords t) ;; expands for keywords such as foreach, while, etc...

;; Autocomplete pairs
(mapc
 (lambda (pair)
   (if (eq (cdr pair) 'perl-mode)
       (setcdr pair 'cperl-mode)))
 (append auto-mode-alist interpreter-mode-alist))

;; Indentation
(setq cperl-indent-level 4
      cperl-close-paren-offset -4
      cperl-continued-statement-offset 4
      cperl-indent-parens-as-block t
      cperl-tab-always-indent t)

(add-hook 'cperl-mode-hook
          (lambda()
            (setq tab-width 4)
            (setq indent-tabs-mode nil)))

;; PerlySense Config
;; The PerlySense prefix key (unset only if needed, like for \C-o)
(global-unset-key "\C-o")
(setq ps/key-prefix "\C-o")
(setq ps/load-flymake t)

(setq ps/external-dir (shell-command-to-string "perly_sense external_dir"))
(setq load-path (cons (expand-file-name (format "%s/%s" ps/external-dir "emacs"))
                      load-path))
(load "perly-sense")

;; Autocompletion
(use-package company-plsense
    :ensure t
    :config
    (add-to-list 'company-backends 'company-plsense)
    (add-hook 'perl-mode-hook 'company-mode)
    (add-hook 'cperl-mode-hook 'company-mode))

;;
;; /Perl
;; --------------------------------------------------------------------------------


;; --------------------------------------------------------------------------------
;; JavaScript
;;

(use-package js2-mode
    :ensure t
    :config
    (add-hook 'js2-mode-hook
              (defun my-js2-mode-setup ()
                (flycheck-mode t)
                (when (executable-find "eslint")
                  (flycheck-select-checker 'javascript-eslint)))))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;;
;; /JavaScript
;; --------------------------------------------------------------------------------


;; --------------------------------------------------------------------------------
;; Lua
;;

(use-package lua-mode
    :mode "\\.lua\\'"
    :config (setq lua-indent-level 4))

;;
;; /Lua
;; --------------------------------------------------------------------------------


;; --------------------------------------------------------------------------------
;; Python
;;

(use-package elpy
    :ensure t
    :init
    (elpy-enable)
    :config
    (setq python-shell-interpreter "ipython"
          python-shell-interpreter-args "-i --simple-prompt")
    (define-key python-mode-map (kbd "M-.") 'jedi:goto-definition)
    (setq jedi:complete-on-dot t)
    :hook
    (add-hook 'python-mode-hook 'jedi:setup))

(use-package pyenv-mode
    :ensure t)

;;
;; /Python
;; --------------------------------------------------------------------------------


;; --------------------------------------------------------------------------------
;; Scala
;;

;; Enable scala-mode for highlighting, indentation and motion commands
(use-package scala-mode
    :interpreter
  ("scala" . scala-mode))

;; Enable sbt mode for executing sbt commands
(use-package sbt-mode
    :commands sbt-start sbt-command
    :config
    ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
    ;; allows using SPACE when in the minibuffer
    (substitute-key-definition
     'minibuffer-complete-word
     'self-insert-command
     minibuffer-local-completion-map)
    ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
    (setq sbt:program-options '("-Dsbt.supershell=false"))
    )

;; Enable nice rendering of diagnostics like compile errors.
(use-package flycheck
    :init (global-flycheck-mode))

(use-package lsp-mode
    ;; Optional - enable lsp-mode automatically in scala files
    :hook  (scala-mode . lsp)
    (lsp-mode . lsp-lens-mode)
    :config
    ;; Uncomment following section if you would like to tune lsp-mode performance according to
    ;; https://emacs-lsp.github.io/lsp-mode/page/performance/
    ;;       (setq gc-cons-threshold 100000000) ;; 100mb
    ;;       (setq read-process-output-max (* 1024 1024)) ;; 1mb
    ;;       (setq lsp-idle-delay 0.500)
    ;;       (setq lsp-log-io nil)
    ;;       (setq lsp-completion-provider :capf)
    (setq lsp-prefer-flymake nil))

;; Add metals backend for lsp-mode
(use-package lsp-metals)

;; Enable nice rendering of documentation on hover
;;   Warning: on some systems this package can reduce your emacs responsiveness significally.
;;   (See: https://emacs-lsp.github.io/lsp-mode/page/performance/)
;;   In that case you have to not only disable this but also remove from the packages since
;;   lsp-mode can activate it automatically.
(use-package lsp-ui)

;; Use company-capf as a completion provider.
;;
;; To Company-lsp users:
;;   Company-lsp is no longer maintained and has been removed from MELPA.
;;   Please migrate to company-capf.
(use-package company
    :hook (scala-mode . company-mode)
    :config
    (setq lsp-completion-provider :capf))

;; Use the Debug Adapter Protocol for running tests and debugging
(use-package posframe
    ;; Posframe is a pop-up tool that must be manually installed for dap-mode
    )
(use-package dap-mode
    :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode))

;;
;; /Scala
;; --------------------------------------------------------------------------------

;; ================================================================================
;; /Languages
;; ================================================================================
