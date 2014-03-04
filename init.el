(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(add-hook 'LaTeX-mode-hook
      (lambda()
        (local-set-key [C-tab] 'TeX-complete-symbol)))

(desktop-save-mode 1)

(global-auto-revert-mode t)

;; funciones de common-lisp
(require 'cl)

;; paquetes de melpa
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; autopep8 al salvar el modulo cada vez
(add-to-list 'load-path "/home/leonardo/.emacs.d/elpa/py-autopep8-20140224.1126")
(require 'py-autopep8)
(add-hook 'before-save-hook 'py-autopep8-before-save)

;; numero de linea
(global-linum-mode t)

;; elget repositories
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(autoload 'jedi:setup "jedi" nil t)

(add-hook 'python-mode-hook 'jedi:setup)
;;If auto-completion is all you need, use jedi:ac-setup instead:

(add-hook 'python-mode-hook 'jedi:ac-setup)
;;To setup recommended keybinds for Jedi.el, add this to your Emacs
;;configuration. Note that you must set jedi:setup-keys before loading
;;jedi.el. See its docstring (<f1> v jedi:setup-keys) for more
;;information.:

(setq jedi:setup-keys t)