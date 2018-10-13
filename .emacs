(add-to-list 'load-path "/Users/kristiansallberg/.emacs.d/lisp")
(add-to-list 'load-path "/Users/kristiansallberg/.emacs.d/elpa/prop-menu-20150728.418")
(add-to-list 'load-path "/Users/kristiansallberg/.emacs.d/elpa/idris-mode-20171212.759")
(add-to-list 'load-path "/Users/kristiansallberg/.emacs.d/elpa/fill-column-indicator-20171209.1124")
(add-to-list 'exec-path "/usr/local/bin")

'(backup-directory-alist (quote (("." . "/Users/kristian/backup/emacs"))))

(require 'whitespace)
(require 'fill-column-indicator)
(require 'lux-mode)
(require 'idris-mode)

; (autoload 'yang-mode "yang-mode" "Major mode for editing YANG modules." t)
; (add-to-list 'auto-mode-alist '("\\.yang$" . yang-mode))

(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)

(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

(setq fci-rule-width 1)
(setq fci-rule-color "darkblue")

(setq-default show-trailing-whitespace t)

(setq-default fill-column 80)

(require 'linum)
(setq linum-format
      (lambda (line)
        (propertize (number-to-string (1- line)) 'face 'linum)))

(setq linum-format "%d ")
;; (global-linum-mode 1)

(global-set-key (kbd "C-z") 'undo)

(cua-mode t)
;; (setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted

(setq load-path (cons "/usr/local/Cellar/erlang/20.2.2/lib/erlang/lib/tools-2.11.1/emacs" load-path))
(setq erlang-root-dir "/usr/local/Cellar/erlang/20.2.2")
(setq exec-path (cons "/usr/local/Cellar/erlang/20.2.2/bin" exec-path))

(require 'erlang-start)

(column-number-mode 1)

(require 'package)
(add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(add-hook 'after-init-hook 'my-after-init-hook)
(defun my-after-init-hook ()
  (require 'edts-start))

;; (setq scroll-step            1
;;       scroll-conservatively  10000)

(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))

; (global-set-key "\C-p" 'comment-or-uncomment-region-or-line)

(setq-default indent-tabs-mode nil)

(defun my-yang-mode-hook ()
         "Configuration for YANG Mode. Add this to `yang-mode-hook'."
         (if window-system
           (progn
            (c-set-style "BSD")
            (setq indent-tabs-mode nil)
            (setq c-basic-offset 2)
            (setq font-lock-maximum-decoration t)
            (font-lock-mode t))))
       (add-hook 'yang-mode-hook 'my-yang-mode-hook)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

(defun my-kill-emacs ()
  "save some buffers, then exit unconditionally"
  (interactive)
  (save-some-buffers nil t)
  (kill-emacs))
(global-set-key (kbd "C-x C-c") 'my-kill-emacs)

;; Shift the selected region right if distance is positive, left if
;; negative

(defun shift-region (distance)
  (let ((mark (mark)))
    (save-excursion
      (indent-rigidly (region-beginning) (region-end) distance)
      (push-mark mark t t)
      ;; Tell the command loop not to deactivate the mark
      ;; for transient mark mode
      (setq deactivate-mark nil))))

(defun shift-right ()
  (interactive)
  (shift-region 1))

(defun shift-left ()
  (interactive)
  (shift-region -1))

;; Bind (shift-right) and (shift-left) function to your favorite keys. I use
;; the following so that Ctrl-Shift-Right Arrow moves selected text one
;; column to the right, Ctrl-Shift-Left Arrow moves selected text one
;; column to the left:

(global-set-key [C-S-right] 'shift-right)
(global-set-key [C-S-left] 'shift-left)

(global-set-key "\M-m" 'magit-blame)
(global-set-key "\M-n" 'magit-blame-quit)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#ffffff" "#ffffff" "#2ecc71" "#f1c40f" "#2492db" "#9b59b6" "#1abc9c" "#2c3e50"])
 '(custom-safe-themes
   (quote
    ("0d2bd712f2983bbdacc69157f4effbf756f9f3c84a619b933af4721f0e3fb17d" "e40ce8486f865c3089537ad774f7583a6c51a3027bd7feb3a313fc8b386c318a" "c8224b1754e86054e67d64ee687f227489a192b38997a7ccfe76386d6daee1f4" "1bf0d8c4006c02a745a8bf148fd0f367823c75e61a282bda211fbf6a319f3cfe" "eca4678272065de24d4b07ff982811b9161ec5b606326eb155b46570a853e760" "4f5776944d5cf8803dd1e9fe12bd679afa1cda724948e359b7dbcc1cd7247f28" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "3df646ca49db56cdb450803d9b392f44d0edf9af3ee4b0864fa7c6c83e7f7722" "efa1e7cc1555e35f9082120563770f35567e6455345f396b2f4c4a8c3ef4f0e1" "7b2be1fad5d49815db35d58db0f19f6db7e342c4f31e1c4e12129b8acbed7609" "e1971dd04efc89e418e18a354586730ef7d1d2bf660b66eef9bea59ec1171662" "f9aaa18f27c61afe1f0af672f78096457526d265507288927638745d63115d0c" "665f2e8645ce3a204a2508a49bed491d2377efe51f2154ab091a52543db2e50c" "98d666a5ec488c59a82564885f6fdced82725e6bf64fb515648c561c4ae36475" "da5b25ca67bea1f0d5a49bfc76fc788ad092f33a0afbeec8a0facd52bc1984ea" default)))
 '(fci-rule-color "#f1c40f")
 '(global-auto-revert-mode t)
 '(haskell-mode-hook
   (quote
    (turn-on-haskell-indent turn-on-haskell-indentation turn-on-font-lock turn-on-eldoc-mode capitalized-words-mode)))
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ffffff" "#ffffff" "#c0392b")))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (intero cql-mode dracula-theme markdown-mode erlang fill-column-indicator leuven-theme idris-mode magit haskell-mode edts)))
 '(send-mail-function (quote smtpmail-send-it))
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ffffff")
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e")
 '(vc-annotate-background "#ffffff")
 '(vc-annotate-color-map
   (quote
    ((30 . "#e74c3c")
     (60 . "#c0392b")
     (90 . "#e67e22")
     (120 . "#d35400")
     (150 . "#f1c40f")
     (180 . "#d98c10")
     (210 . "#2ecc71")
     (240 . "#27ae60")
     (270 . "#1abc9c")
     (300 . "#16a085")
     (330 . "#2492db")
     (360 . "#0a74b9"))))
 '(vc-annotate-very-old-color "#0a74b9"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-x C-c") 'ibuffer)

(load "server")
(unless (server-running-p) (server-start))

(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

(setq mac-left-option-modifier 'meta
      mac-right-option-modifier nil
      mac-command-modifier nil
      x-select-enable-clipboard t)

(load-theme 'dracula t)

(defun toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullheight)))

(global-set-key (kbd "<f6>") 'toggle-fullscreen)
