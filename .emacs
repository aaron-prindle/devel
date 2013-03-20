(setq ansi-color-for-comint-mode t)

;;Copy-Paste----------------------------------
;;(work with both terminal (S-INS) and X11 apps.):
(when (> (display-color-cells) 16)         ;if not in CLI
    (setq x-select-enable-clipboard t        ;copy-paste should work
	          interprogram-paste-function        ; ...with ...
		          'x-cut-buffer-or-selection-value)) ; ...other X-clients
;;--------------------------------------------))))))

(load-file "~/.emacs.d/plugins/emacs-for-python/epy-init.el")
(epy-setup-checker "pyflakes %f")
(epy-django-snippets)
(epy-setup-ipython)
 (global-hl-line-mode t) ;; To enable
 (set-face-background 'hl-line "#ffe4c4") ;; change with the color that you like
                                        ;; for a list of colors: http://raebear.net/comp/emacscolors.html
 (require 'highlight-indentation)
 (add-hook 'python-mode-hook 'highlight-indentation)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key (kbd "C-h") 'delete-backward-char)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(defalias 'qrr 'query-replace-regexp)
(defalias 'dm 'describe-mode)
(defalias 'yas 'yas/describe-tables)

(setq tex-dvi-view-command "(f=*; pdflatex \"${f%.dvi}.tex\" && open \"${f%.dvi}.pdf\")")

(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)

(setq confirm-nonexistent-file-or-buffer nil)
(require 'ido)
(ido-mode 1)
(ido-everywhere 1)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
(setq ido-enable-tramp-completion nil)
(setq ido-enable-last-directory-history nil)
(setq ido-confirm-unique-completion nil) ;; wait for RET, even for unique?
(setq ido-show-dot-for-dired t) ;; put . as the first item
(setq ido-use-filename-at-point t) ;; prefer file names near point
(put 'upcase-region 'disabled nil)

(load-file "~/.emacs.d/plugins/zencoding/zencoding-mode.el")

;;yes to y prompt
(fset 'yes-or-no-p 'y-or-n-p) 

(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

;;org mode line wrap
(global-visual-line-mode t) 

;; Don't clutter up directories with files~
(defvar backup-dir "~/.emacs.d/backups/")
(setq backup-directory-alist `(("." . ,(expand-file-name
                                    (concat backup-dir "backups")))))
;; Don't clutter with #files either
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name (concat backup-dir "backups")))))

(setq custom-file "~/.emacs.d/mine/custom.el")
(load custom-file)

