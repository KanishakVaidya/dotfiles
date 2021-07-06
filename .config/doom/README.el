;; in config.el we just need to put one line
;; (org-bable-load-file (expand-file-name "<path of the org file>"))
(setq user-full-name "Kanishak Vaidya"
      user-mail-address "will@fill.later")

(setq doom-font (font-spec :family "Source Code Pro" :size 15)
      doom-variable-pitch-font (font-spec :family "Source Code Pro" :size 15 :weight 'Bold)
      doom-big-font (font-spec :family "Hack" :size 17))

(setq display-line-numbers-type t)

(setq doom-theme 'doom-one)

(set-frame-parameter (selected-frame) 'alpha '(98 95))

(after! org
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-directory "~/.org/")
  (setq org-highlight-latex-and-related '(latex script entities)))

(setq shell-file-name "/usr/bin/bash")
