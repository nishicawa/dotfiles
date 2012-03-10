;;; $BF|K\8l4D6-@_Dj(B
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8-unix)
(setq default-buffer-file-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

;; C-x C-j$B$G%H%0%k(B
(global-set-key "\C-x\C-j" 'toggle-input-method)

;;; font-lock$B$N@_Dj(B
(global-font-lock-mode t)

(set-face-attribute 'variable-pitch nil :family "*")

;; $B=i4|%U%l!<%`$N@_Dj(B
(setq default-frame-alist
      (append (list '(foreground-color . "white")
		    '(background-color . "black")
		    '(border-color . "black")
		    '(mouse-color . "white")
		    '(cursor-color . "white")
		    '(width . 140)
		    '(height . 60)
		    '(top . 0)
		    '(left . 128))
	      default-frame-alist))

;; $B%b!<%I%i%$%s$NJ8;z$N?'$r@_Dj$7$^$9!#(B
(set-face-foreground 'modeline "white")

;; $B%b!<%I%i%$%s$NGX7J?'$r@_Dj$7$^$9!#(B
(set-face-background 'modeline "#606068")

;; $BA*BrCf$N%j!<%8%g%s$N?'$r@_Dj$7$^$9!#(B
(set-face-background 'region "#30B0B0")

;; ;;; shell $B$N@_Dj(B

;; shell-mode$B$G$NJd40(B (for drive letter)
(setq shell-file-name-chars "~/A-Za-z0-9_^$!#%&{}@`'.,:()-")

;; ;;; browse-url $B$N@_Dj(B
;; (global-set-key [S-mouse-2] 'browse-url-at-mouse)

; $B%P%C%/%9%Z!<%9@_Dj(B
;; (if (eq window-system 'x)
;; (progn
;; 	(define-key function-key-map [backspace] [8])
;; 	(put 'backspace 'ascii-character 8)
;; ))
;; (global-set-key "\C-h" 'backward-delete-char)
;; (global-set-key "\177" 'delete-char)

(keyboard-translate ?\C-h ?\C-?)

(global-set-key "\C-^" 'help-command)

;; $B?'$r$D$1$k(B
(global-font-lock-mode t) 
(require 'font-lock) 

;; $B%G%U%)%k%H%G%#%l%/%H%j(B
;(setq default-directory "/Users/nishikawa/")

;; $B%j!<%8%g%s$r%O%$%i%$%HI=<($9$k(B
(transient-mark-mode 1)

;; $B9THV9f!&7eHV9f$r%b!<%I%i%$%s$KI=<($9$k(B 
(line-number-mode t) ; $B9THV9f(B 
(column-number-mode t) ; $B7eHV9f(B 

;; $B2hLL$+$i=P$?$H$-0l9T$@$1%9%/%m!<%k$5$;$k(B 
(setq scroll-conservatively 1) 

;; $B%?%$%H%k%P!<$KJT=8Cf$N%U%!%$%k$rI=<((B
(defvar dired-mode-p nil)
(add-hook 'dired-mode-hook
(lambda ()
(make-local-variable 'dired-mode-p)
(setq dired-mode-p t)))
(setq frame-title-format-orig frame-title-format)
(setq frame-title-format '((buffer-file-name "%f"
(dired-mode-p default-directory
mode-line-buffer-identification))))

;; $B9T$N@^$jJV$7%H%0%k(B
(defun toggle-truncate-lines ()
  "$B@^$jJV$7I=<($r%H%0%kF0:n$7$^$9(B."
  (interactive)  
  (if truncate-lines
      (setq truncate-lines nil)
      (setq truncate-lines t))
  (recenter))
(global-set-key "\C-c\C-l" 'toggle-truncate-lines)  ; $B@^$jJV$7I=<((BON/OFF

;; iswitchb
(iswitchb-mode 1)

(defadvice iswitchb-exhibit
  (after
   iswitchb-exhibit-with-display-buffer
   activate)
  "$BA*Br$7$F$$$k(B buffer $B$r(B window $B$KI=<($7$F$_$k!#(B"
  (when (and
         (eq iswitchb-method iswitchb-default-method)
         iswitchb-matches)
    (select-window
     (get-buffer-window (cadr (buffer-list))))
    (let ((iswitchb-method 'samewindow))
      (iswitchb-visit-buffer
       (get-buffer (car iswitchb-matches))))
    (select-window (minibuffer-window))))

;; BS $B$GA*BrHO0O$r>C$9(B
(delete-selection-mode 1)

;; $BNs?tI=<((B
(column-number-mode 1) 

;;; $B%D!<%k%P!<$r>C$9(B
(tool-bar-mode 0)

;;; $B%P%C%/%"%C%W%U%!%$%k$r:n$i$J$$(B
(setq backup-inhibited t)

;;; $B=*N;;~$K%*!<%H%;!<%V%U%!%$%k$r>C$9(B
(setq delete-auto-save-files t)

;;; $BBP1~$9$k3g8L$r8w$i$;$k!#(B
(show-paren-mode 1)

;; $B%^%/%m$N3+;O!&=*N;(B
(defun end-macro-or-call-last-kbd-macro (arg)
  (interactive "P")
  (if defining-kbd-macro
      (if arg
          (end-kbd-macro arg)
        (end-kbd-macro))
    (call-last-kbd-macro arg)))
(define-key global-map [f3] 'start-kbd-macro)
(define-key global-map [f4] 'end-macro-or-call-last-kbd-macro)


; $B%U%!%$%k$r3+$$$?MzNr$rI=<($9$k(B
(recentf-mode 1)
(global-set-key "\C-xf" 'recentf-open-files) ;;$BMzNr0lMw(B

; $B5/F0;~$K(B*message*$B$r3+$+$J$$(B
(setq inhibit-startup-message t)

; F1$B$G%X%k%W(B
(global-set-key [f1] 'help-for-help)

;;====================================
;;$B9THV9fI=<(%b!<%I(B
;====================================
(autoload 'setnu-mode "setnu" nil t)
(global-set-key [f7] 'setnu-mode)

(global-set-key "\C-x\C-b" 'bs-show);C-xC-b$B$r(BM-x bs-show$B$KJQ99(B


;;;--------------------
;;; flymake
;;;--------------------
(require 'flymake)
(defun flymake-python-init ()
 (let* ((temp-file (flymake-init-create-temp-buffer-copy
                    'flymake-create-temp-inplace))
        (local-file (file-relative-name
                     temp-file
                     (file-name-directory buffer-file-name))))
   (list "pyflakes" (list local-file))))

(defconst flymake-allowed-python-file-name-masks '(("\\.py$"
flymake-python-init)))
(defvar flymake-python-err-line-patterns
'(("\\(.*\\):\\([0-9]+\\):\\(.*\\)" 1 2 nil 3)))

(defun flymake-python-load ()
 (interactive)
 (defadvice flymake-post-syntax-check (before
flymake-force-check-was-interrupted)
   (setq flymake-check-was-interrupted t))
 (ad-activate 'flymake-post-syntax-check)
 (setq flymake-allowed-file-name-masks (append
flymake-allowed-file-name-masks
flymake-allowed-python-file-name-masks))
 (setq flymake-err-line-patterns flymake-python-err-line-patterns)
 (flymake-mode t))
(add-hook 'python-mode-hook '(lambda () (flymake-python-load)))


;; -*- emacs-lisp -*-
;; License: Gnu Public License
;;
;; Additional functionality that makes flymake error messages appear
;; in the minibuffer when point is on a line containing a flymake
;; error. This saves having to mouse over the error, which is a
;; keyboard user's annoyance

;;flymake-ler(file line type text &optional full-file)
(defun show-fly-err-at-point ()
 "If the cursor is sitting on a flymake error, display the
message in the minibuffer"
 (interactive)
 (let ((line-no (line-number-at-pos)))
   (dolist (elem flymake-err-info)
     (if (eq (car elem) line-no)
	  (let ((err (car (second elem))))
	    (message "%s" (fly-pyflake-determine-message err)))))))

(defun fly-pyflake-determine-message (err)
 "pyflake is flakey if it has compile problems, this adjusts the
message to display, so there is one ;)"
 (cond ((not (or (eq major-mode 'Python) (eq major-mode 'python-mode) t)))
	((null (flymake-ler-file err))
	 ;; normal message do your thing
	 (flymake-ler-text err))
	(t ;; could not compile err
	 (format "compile error, problem on line %s" (flymake-ler-line err)))))

(defadvice flymake-goto-next-error (after display-message activate compile)
 "Display the error in the mini-buffer rather than having to mouse over it"
 (show-fly-err-at-point))
(global-set-key (kbd "C-c e") 'flymake-goto-next-error)

(defadvice flymake-goto-prev-error (after display-message activate compile)
 "Display the error in the mini-buffer rather than having to mouse over it"
 (show-fly-err-at-point))

(defadvice flymake-mode (before post-command-stuff activate compile)
 "Add functionality to the post command hook so that if the
cursor is sitting on a flymake error the error information is
displayed in the minibuffer (rather than having to mouse over
it)"
 (set (make-local-variable 'post-command-hook)
      (cons 'show-fly-err-at-point post-command-hook)))

;; auto-install$B$K$h$C$F%$%s%9%H!<%k$5$l$k(BEmacs Lisp$B$r%m!<%I%Q%9$K2C$($k(B
;; $B%G%U%)%k%H$O(B ~/.emacs.d/auto-install/
(add-to-list 'load-path "~/.emacs.d/auto-install/")
(require 'auto-install)
;; $B5/F0;~$K(BEmacsWiki$B$N%Z!<%8L>$rJd408uJd$K2C$($k(B
(auto-install-update-emacswiki-package-name t)
;; install-elisp.el$B8_49%b!<%I$K$9$k(B
(auto-install-compatibility-setup)
;; ediff$B4XO"$N%P%C%U%!$r(B1$B$D$N%U%l!<%`$K$^$H$a$k(B
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(require 'grep-edit)

;; diff-mode color
(add-hook 'diff-mode-hook
          (lambda ()
            (set-face-foreground 'diff-context-face "grey50")
            (set-face-background 'diff-header-face "black")
            (set-face-underline-p 'diff-header-face t)
            (set-face-foreground 'diff-file-header-face "MediumSeaGreen")
            (set-face-background 'diff-file-header-face "black")
            (set-face-foreground 'diff-index-face "MediumSeaGreen")
            (set-face-background 'diff-index-face "black")
            (set-face-foreground 'diff-hunk-header-face "plum")
            (set-face-background 'diff-hunk-header-face"black")
            (set-face-foreground 'diff-removed-face "pink")
            (set-face-background 'diff-removed-face "gray5")
            (set-face-foreground 'diff-added-face "light green")
            (set-face-foreground 'diff-added-face "white")
            (set-face-background 'diff-added-face "SaddleBrown")
            (set-face-foreground 'diff-changed-face "DeepSkyBlue1")))


(defun my-make-scratch (&optional arg)
  (interactive)
  (progn
    ;; "*scratch*" $B$r:n@.$7$F(B buffer-list $B$KJ|$j9~$`(B
    (set-buffer (get-buffer-create "*scratch*"))
    (funcall initial-major-mode)
    (erase-buffer)
    (when (and initial-scratch-message (not inhibit-startup-message))
      (insert initial-scratch-message))
    (or arg (progn (setq arg 0)
                   (switch-to-buffer "*scratch*")))
    (cond ((= arg 0) (message "*scratch* is cleared up."))
          ((= arg 1) (message "another *scratch* is created")))))

(defun my-buffer-name-list ()
  (mapcar (function buffer-name) (buffer-list)))

(add-hook 'kill-buffer-query-functions
    ;; *scratch* $B%P%C%U%!$G(B kill-buffer $B$7$?$iFbMF$r>C5n$9$k$@$1$K$9$k(B
          (function (lambda ()
                      (if (string= "*scratch*" (buffer-name))
                          (progn (my-make-scratch 0) nil)
                        t))))

(add-hook 'after-save-hook
;; *scratch* $B%P%C%U%!$NFbMF$rJ]B8$7$?$i(B *scratch* $B%P%C%U%!$r?7$7$/:n$k(B
          (function (lambda ()
                      (unless (member "*scratch*" (my-buffer-name-list))
                        (my-make-scratch 1)))))

;; elscreen
(load "elscreen" "ElScreen" t)
(global-set-key [(C-tab)] 'elscreen-next)
(global-set-key [(C-S-tab)] 'elscreen-previous)

;; $BF)2a(B
(add-to-list 'default-frame-alist   '(active-alpha . 0.90))
(add-to-list 'default-frame-alist '(inactive-alpha . 0.40))

;; bm.el
(setq-default bm-buffer-persistence nil)
(setq bm-restore-repository-on-load t)
(require 'bm)
(add-hook 'find-file-hooks 'bm-buffer-restore)
(add-hook 'kill-buffer-hook 'bm-buffer-save)
(add-hook 'after-save-hook 'bm-buffer-save)
(add-hook 'after-revert-hook 'bm-buffer-restore)
(add-hook 'vc-before-checkin-hook 'bm-buffer-save)
(global-set-key (kbd "M-SPC") 'bm-toggle)
(global-set-key (kbd "M-[") 'bm-previous)
(global-set-key (kbd "M-]") 'bm-next)

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode 1)

;; open-junk-file.el
(require 'open-junk-file)
(setq open-junk-file-format "~/junk/%Y-%m-%d-%H%M%S.")

;; grep-a-lot
(require 'grep-a-lot)
(grep-a-lot-setup-keys)
(grep-a-lot-advise igrep)

;;$B%?%VI}$r(B 4 $B$K@_Dj(B
(setq-default tab-width 4)

;;$B%?%VI}$NG\?t$r@_Dj(B
(setq tab-stop-list
  '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))

;;
;; (load "~/.emacs.d/nxhtml/autostart.el")
;; (setq mumamo-background-colors nil) 
;; (add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))

;;;
;;; end of file
;;;

(put 'upcase-region 'disabled nil)
