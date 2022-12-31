(setq user-full-name "Kanishak Vaidya"
      user-mail-address "kanishak@gmail")

(setq doom-font (font-spec :family "Hack" :size 20 :weight 'Regular)
      doom-variable-pitch-font (font-spec :family "Hack" :size 13))

(custom-set-faces
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight bold :family "Source Code Pro"))))
 '(markdown-header-face-1 ((t (:inherit org-level-1 :height 1.5 :overline t))))
 '(markdown-header-face-2 ((t (:inherit org-level-2 :height 1.4 :overline t))))
 '(markdown-header-face-3 ((t (:inherit org-level-3 :height 1.3 :overline t))))
 '(markdown-header-face-4 ((t (:inherit org-level-4 :height 1.2))))
 '(markdown-header-face-5 ((t (:inherit org-level-5 :height 1.1))))
 '(markdown-header-face-6 ((t (:inherit org-level-6 :height 1.1)))))

(setq doom-theme 'doom-tomorrow-night)
(setq display-line-numbers-type t)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-startup-folded t)

(setq org-src-window-setup 'other-frame)

(after! spell-fu
  (setq ispell-dictionary "en_US"))

(after! company-mode
  (setq company-minimum-prefix-length 2
        company-reftex-annotate-citations t))

(setq tex-fontify-script nil)
(setq font-latex-fontify-script nil)
(setq +latex-viewers '(zathura))
(setq-default TeX-master nil)

(setq-hook! 'LaTeX-mode-hook +lsp-company-backends '(:separate company-capf company-yasnippet
 company-reftex-labels company-reftex-citations company-files company-dabbrev company-dabbrev-code))

(evil-define-key 'normal dired-mode-map
  (kbd "M-RET") 'dired-display-file
  (kbd "h") 'dired-up-directory
  (kbd "l") 'dired-find-file) ; use dired-find-file instead of dired-open.
