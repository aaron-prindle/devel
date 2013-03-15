(setq ansi-color-for-comint-mode t)

;;Copy-Paste----------------------------------
;;(work with both terminal (S-INS) and X11 apps.):
(when (> (display-color-cells) 16)         ;if not in CLI
    (setq x-select-enable-clipboard t        ;copy-paste should work
	          interprogram-paste-function        ; ...with ...
		          'x-cut-buffer-or-selection-value)) ; ...other X-clients
;;--------------------------------------------))))))

(load-file "~/.emacs.d/plugins/emacs-for-python/epy-init.el")

(global-set-key "\C-x\C-m" 'execute-extended-command)
;;(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
;;(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)

(global-set-key (kbd "M-g") 'goto-line)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(defun jta-reformat-xml ()
  "Reformats xml to make it readable (respects current selection)."
  (interactive)
  (save-excursion
    (let ((beg (point-min))
          (end (point-max)))
      (if (and mark-active transient-mark-mode)
          (progn
            (setq beg (min (point) (mark)))
            (setq end (max (point) (mark))))
        (widen))
      (setq end (copy-marker end t))
      (goto-char beg)
      (while (re-search-forward ">\\s-*<" end t)
        (replace-match ">\n<" t t))
      (goto-char beg)
      (indent-region beg end nil))))

(setq tex-dvi-view-command "(f=*; pdflatex \"${f%.dvi}.tex\" && open \"${f%.dvi}.pdf\")")

(add-to-list 'load-path (expand-file-name "~/.emacs.d/magit/mainline"))
(autoload 'magit-status "magit" nil t)
(setq transient-mark-mode nil)
(global-set-key "\C-x\g" 'magit-status)

;path to where nxml is
(set 'nxml-path (concat "~/nxml-mode/"))

(load (concat nxml-path "rng-auto.el"))

 (add-to-list 'auto-mode-alist
	                    (cons (concat "\\." (regexp-opt '("xml" "xsd" "sch" "rng" "xslt" "svg" "rss") t) "\\'")
				                      'nxml-mode))

  (unify-8859-on-decoding-mode)

    (setq magic-mode-alist
	    (cons '("<＼＼?xml " . nxml-mode)
		    magic-mode-alist))
   (fset 'xml-mode 'nxml-mode)

   (fset 'html-mode 'nxml-mode)

;;(epy-setup-checker "pyflakes %f")

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 ;;'(initial-buffer-choice "~/TODO/TODO")
 '(nxml-slash-auto-complete-flag t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


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

;;Adds newlines on C-n
(setq next-line-add-newlines t)
;;yes to y prompt
(fset 'yes-or-no-p 'y-or-n-p) 

(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(require 'coffee-mode)

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

;;org mode line wrap
(global-visual-line-mode t) 
