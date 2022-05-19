;; in config.el we just need to put one line
;; (org-bable-load-file (expand-file-name "<path of the org file>"))
(setq user-full-name "Kanishak Vaidya"
      user-mail-address "will@fill.later")

(setq doom-font (font-spec :family "Source Code Pro" :size 15)
      doom-variable-pitch-font (font-spec :family "Source Code Pro" :size 15 :weight 'Bold)
      doom-big-font (font-spec :family "Hack" :size 17))

(setq display-line-numbers-type t)

(setq doom-theme 'base16-gruvbox-dark-medium)

(set-frame-parameter (selected-frame) 'alpha '(98 97))

(after! org
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-directory "~/.org/")
  (setq org-src-window-setup 'split-window-right)
  (setq org-highlight-latex-and-related '(latex script entities)))

(setq org-publish-use-timestamps-flag nil)
(setq org-export-with-broken-links t)
(setq org-publish-project-alist
      '(("PMRF.progress"
         :base-directory "~/doc/sites/test-site/"
         :base-extension "org"
         :publishing-directory "~/doc/sites/test-site/html/"
         :recursive t
         :exclude "org-html-themes/.*"
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :auto-preamble t)))

(setq shell-file-name "/usr/bin/bash")

(setq font-latex-fontify-script nil)
(add-to-list 'load-path "/home/keshav/doc/programs/latex/")
(require 'lsp-latex)
(with-eval-after-load "tex-mode"
 (add-hook 'tex-mode-hook 'lsp)
 (add-hook 'latex-mode-hook 'lsp))
;; For bibtex
(with-eval-after-load "bibtex"
 (add-hook 'bibtex-mode-hook 'lsp))

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred
