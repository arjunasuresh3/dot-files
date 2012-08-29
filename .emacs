;;File:		.emacs
;;Author:   	Arjun Suresh

;; Time-stamp: <Last changed 29-08-2012 10:45:08 by Arjun Suresh, sarjun>

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; what kind of system are we using? 
(defconst console-p (eq (symbol-value 'window-system) nil)
  "Are we running in a console (non-X) environment?")

(setq initial-scratch-message "")

;; Keyboard
;; ============
;;
(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)
(global-set-key [\C-home] 'beginning-of-buffer)
(global-set-key [\C-end] 'end-of-buffer)
(global-set-key [f7] 'next-error)
;;(global-set-key "\C-a" 'mark-whole-buffer) ;; C-a highlighting everything
;;(global-set-key "\C-z" 'undo)
;;(global-set-key "\C-v" 'yank)
(global-set-key (kbd "C-c c") 'comment-region)   ;; make C-c C-c and C-c C-u work 
(global-set-key (kbd "C-c u") 'uncomment-region) ;; for comment/uncomment region in all modes 
(global-set-key [(control next)] 'scroll-other-window) ;; Make control+pageup/down scroll the other buffer
(global-set-key [(control prior)] 'scroll-other-window-down)

;; Make pair of {,[ and (
(setq skeleton-pair t)
(setq skeleton-pair-on-word t)
(global-set-key "(" 'skeleton-pair-insert-maybe)
(global-set-key "[" 'skeleton-pair-insert-maybe)
(global-set-key "{" 'skeleton-pair-insert-maybe)

;; Methods
(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down) 
(global-set-key [\C-tab]     'yic-next-buffer)  ;; Next buffer
(global-set-key [(shift tab)]  'yic-prev-buffer) 


;; Window colors
;; =============
;;
(setq default-frame-alist
  (append
  '((width             . 120)
	 (height            . 40)
	 (background-color  . "black")
	 (foreground-color  . "white")
	 (mouse-color       . "blue")
	 (cursor-color      . "red")
;    (face-color        . "black")
;    (face-backgound-color        . "#FFFFEEEECCCC")
	 ) default-frame-alist))


;; MISC SECTION
;; =============
;;

;syntax highlite
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;nxml-mode
(setq auto-mode-alist (cons '("\\.dtml$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.html$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.js$" . c-mode) auto-mode-alist))
;make the y or n suffice for a yes or no question
(fset 'yes-or-no-p 'y-or-n-p)
;; Show column-number in the mode line
(column-number-mode 1)
;; Turn on mouse wheel
(mouse-wheel-mode t)
;; show mark visually
(transient-mark-mode t) 
;; show parenthesis
(show-paren-mode t)

;; Don't show Toolbar
(tool-bar-mode)

;; highlight current line, only if not in console
;; (when (not console-p) 
;;   (global-hl-line-mode 1)
;;   (set-face-background 'highlight "#444")
;; )

;; copy-paste should work with other X clients
(setq x-select-enable-clipboard t) 
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
;; return to same line on a scroll back
(setq scroll-preserve-screen-position t)
;; Not display the initial message 
(setq inhibit-startup-message t)
;; autosave every 512 keyboard inputs
(setq auto-save-interval 512)  
;; autosave after 30 s idle
(setq auto-save-timeout 30)    
;; SavePlace- this puts the cursor in the last place you edited
;; a particular file. This is very useful for large files.
(require 'saveplace)
(setq-default save-place t)
;; replace highlighted text with what I type rather than just
;; inserting at a point
(delete-selection-mode t)


;; =============
;; Programing, scripts
;; =============
;;

;; Python mode
;; =============
;;
(load "~/.emacs.d/python-mode/python-mode.el")
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode)
interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)

(global-font-lock-mode t)
(setq font-lock-maximum-decoration t) 

;; LaTeX mode
;; =============
;;

;; (setq latex-mode-hook'(lambda ()
;; 	  (setq skeleton-pair-on-word t)
;; 	  (setq skeleton-pair t)
;; 	  (global-set-key "$" 'skeleton-pair-insert-maybe)
;; )		  
;; )


;; Matlab mode
;; download  http://www.mathworks.com/matlabcentral/files/104/matlab.el to emacs/matlab.el
;; =============
;;

;; (setq matlab-shell-command-switches '("-nosplash -nojvm"))
;; (autoload 'matlab-mode "~/emacs/matlab.el" "Enter MATLAB mode." t)
;; (setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
;; (autoload 'matlab-shell "~/emacs/matlab.el" "Interactive MATLAB mode." t)
;; ;; User Level customizations (You need not use them all):
;; (setq matlab-indent-function t)	; if you want function bodies indented
;; (setq matlab-verify-on-save-flag nil) ; turn off auto-verify on save
;; (defun my-matlab-mode-hook ()
;;   (setq fill-column 76))		; where auto-fill should wrap
;; (add-hook 'matlab-mode-hook 'my-matlab-mode-hook)
;; (defun my-matlab-shell-mode-hook ()
;;   '())
;; (add-hook 'matlab-shell-mode-hook 'my-matlab-shell-mode-hook)


;; =============
;; Methods
;; =============
;;

;; I hate tabs!
(setq-default indent-tabs-mode nil)

;; Prevent accidentally killing emacs.
(global-set-key [(control x) (control c)]
		'(lambda ()
		   (interactive)
		   (if (y-or-n-p-with-timeout "Do you really want to exit Emacs ? " 4 nil)
		       (save-buffers-kill-emacs))))


;; time-stamps  from http://www.djcbsoftware.nl/dot-emacs.html
;; when there is a "Time-stamp: <>" in the first 10 lines of the file,
;; emacs will write time-stamp information there when saving the file.
;; see the top of this file for an example... 
(setq 
  time-stamp-active t          ; do enable time-stamps
  time-stamp-line-limit 10     ; check first 10 buffer lines for Time-stamp: <>
  time-stamp-format "Last changed %02d-%02m-%04y %02H:%02M:%02S by %L, %u") ; date format
(add-hook 'write-file-hooks 'time-stamp) ; update when saving

;; Move current line up or down with M-up or M-down
(defun move-line (n)
   "Move the current line up or down by N lines."
   (interactive "p")
   (let ((col (current-column))
         start
         end)
     (beginning-of-line)
     (setq start (point))
     (end-of-line)
     (forward-char)
     (setq end (point))
     (let ((line-text (delete-and-extract-region start end)))
       (forward-line n)
       (insert line-text)
       ;; restore point to original column in moved line
       (forward-line -1)
       (forward-char col))))

(defun move-line-up (n)
   "Move the current line up by N lines."
   (interactive "p")
   (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
   "Move the current line down by N lines."
   (interactive "p")
   (move-line (if (null n) 1 n)))

;; ----------------------------------------------------------------------
;;     Original yic-buffer.el
;;     From: choo@cs.yale.edu (young-il choo)
;;     Date: 7 Aug 90 23:39:19 GMT
;;
;;     Modified 
;; ----------------------------------------------------------------------

(defun yic-ignore (str)
  (or
   ;;buffers I don't want to switch to 
   (string-match "\\*Buffer List\\*" str)
   (string-match "^TAGS" str)
   (string-match "^\\*Messages\\*$" str)
   (string-match "^\\*Completions\\*$" str)
   (string-match "^ " str)

   ;;Test to see if the window is visible on an existing visible frame.
   ;;Because I can always ALT-TAB to that visible frame, I never want to 
   ;;Ctrl-TAB to that buffer in the current frame.  That would cause 
   ;;a duplicate top-level buffer inside two frames.
   (memq str                
         (mapcar 
          (lambda (x) 
            (buffer-name 
             (window-buffer 
              (frame-selected-window x))))
          (visible-frame-list)))
   ))

(defun yic-next (ls)
  "Switch to next buffer in ls skipping unwanted ones."
  (let* ((ptr ls)
         bf bn go
         )
    (while (and ptr (null go))
      (setq bf (car ptr)  bn (buffer-name bf))
      (if (null (yic-ignore bn))        ;skip over
   (setq go bf)
        (setq ptr (cdr ptr))
        )
      )
    (if go
        (switch-to-buffer go))))

(defun yic-prev-buffer ()
  "Switch to previous buffer in current window."
  (interactive)
  (yic-next (reverse (buffer-list))))

(defun yic-next-buffer ()
  "Switch to the other buffer (2nd in list-buffer) in current window."
  (interactive)
  (bury-buffer (current-buffer))
  (yic-next (buffer-list)))
;;end of yic buffer-switching methods

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(normal-erase-is-backspace t)
 '(show-paren-mode t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify))))

;; autocomplete 
(add-to-list 'load-path "~/.emacs.d/auto-complete")    ; This may not be appeared if you have already added.
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete")
(auto-complete)

;;nerd tree
;;(add-to-list 'load-path "~/.emacs.d/emacs-nav")
;;(require 'ack)
;;(require 'nav)
;;(nav)

(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))


;;sql mode
(autoload 'sql-mode "sql-mode" "SQL Editing Mode" t)
(setq auto-mode-alist
      (append '(("\\.sql$" . sql-mode)
		("\\.zsql$" . sql-mode)
		("\\.tbl$" . sql-mode)
		("\\.sp$"  . sql-mode))
	      auto-mode-alist))


;;bookmark line visual studio style
(add-to-list 'load-path "~/.emacs.d")
(require 'bm)

    (global-set-key (kbd "<C-f2>") 'bm-toggle)
    (global-set-key (kbd "<f2>")   'bm-next)
    (global-set-key (kbd "<S-f2>") 'bm-previous)

;;js-mode
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;hide ^M in file
(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))


;; Trying Pep8
;; Mandatory
(load-file "~/.emacs.d/emacs-for-python/epy-init.el")
(add-to-list 'load-path "~/.emacs.d/emacs-for-python/") ;; tell where to load the various files

;; Each of them enables different parts of the system.
;; Only the first two are needed for pep8, syntax check.
(require 'epy-setup) ;; It will setup other loads, it is required!
(require 'epy-python) ;; If you want the python facilities [optional]
(require 'epy-completion) ;; If you want the autocompletion settings [optional]
(require 'epy-editing) ;; For configurations related to editing [optional]

;; Define f10 to previous error
;; Define f11 to next error
(require 'epy-bindings) ;; For my suggested keybindings [optional]

;; Some shortcut that do not collide with gnome-terminal,
;; otherwise, "epy-bindings" define f10 and f11 for them.
(global-set-key [f2] 'flymake-goto-prev-error)
(global-set-key [f3] 'flymake-goto-next-error)

;; Next two lines are the checks to do. You can add more if you wish.
;; (epy-setup-checker "/gsunil/ZeOmega/Selenium/jiva/bin/pyflakes %f") ;; For python syntax check
;; (epy-setup-checker "/gsunil/ZeOmega/Selenium/jiva/bin/pep8 -r --ignore W601,E501 %f") ;; For pep8 check


(put 'set-goal-column 'disabled nil)

;;full screen

(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
                         (if (equal 'fullboth current-value)
                             (if (boundp 'old-fullscreen) old-fullscreen nil)
                           (progn (setq old-fullscreen current-value)
                                  'fullboth)))))
(global-set-key [f11] 'toggle-fullscreen)

;;refreshes current file when changes on disk
(global-auto-revert-mode t)
