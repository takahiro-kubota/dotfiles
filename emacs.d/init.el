(show-paren-mode 1)
(setq show-paren-style 'mixed)

(set-language-environment 'Japanese)

(setq make-backup-files nil)
(setq auto-save-default nil)

(if (and (boundp 'window-system) window-system)
    (when (string-match "XEmacs" emacs-version)
       	(if (not (and (boundp 'mule-x-win-initted) mule-x-win-initted))
            (require 'sym-lock))
       	(require 'font-lock)))

(if (boundp 'window-system)
    (setq initial-frame-alist
          (append (list
                   '(foreground-color . "azure3")
                   '(background-color . "Black")
                   '(border-color     . "Black")
                   '(mouse-color      . "White")
                   '(cursor-color     . "White")
                   '(cursor-type      . box)
                   '(menu-bar-lines . 1)
                   '(width . 100)
                   '(height . 35)
                   '(top . 40)
                   '(left . 140)
                   )
                  initial-frame-alist)))
(setq default-frame-alist initial-frame-alist)

(set-face-background 'mode-line "slateblue")
(set-face-foreground 'mode-line "white")
(set-face-background 'highlight "grey10")
(set-face-foreground 'highlight "red")
(set-face-foreground 'font-lock-comment-face "OliveDrab")
(set-face-foreground 'font-lock-string-face "SkyBlue")

(setq truncate-lines nil)

(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/opt/local/bin"
              "/sw/bin"
              "/usr/local/bin"
              "/usr/texbin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin")
              ))
 (when (and (file-exists-p dir) (not (member dir exec-path)))
   (setenv "PATH" (concat dir ":" (getenv "PATH")))
   (setq exec-path (append (list dir) exec-path))))

(global-set-key "\C-c\C-c" 'comment-region)
(global-set-key "\C-c\C-u" 'uncomment-region)
(global-set-key "\C-c\C-r" 'query-replace)
(global-set-key "\C-c\C-g" 'goto-line)
(global-set-key "\C-c\C-a" 'beginning-of-buffer)
(global-set-key "\C-c\C-e" 'end-of-buffer)
(global-set-key "\C-c\C-i" 'indent-region)
(global-set-key "\C-u" 'scroll-down)
; \C-u was originally 'universal-argument
(global-set-key "\C-o" 'dabbrev-expand)
; \C-o was originally 'open-line
