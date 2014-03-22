(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; usar por defecto encoding utf8
(prefer-coding-system 'utf-8)

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

;; marmalade, gestor de paquetes de emacs
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; autopep8 al salvar el modulo cada vez
(add-to-list 'load-path "~/.emacs.d/elpa/py-autopep8-20140224.1126")
(require 'py-autopep8)
(add-hook 'before-save-hook 'py-autopep8-before-save)

;; numero de linea
(global-linum-mode t)


(autoload 'jedi:setup "jedi" nil t)

;;Setup All you need to do is to call jedi:setup in python buffer. To
;;do that, add the following in your Emacs configuration:

(add-hook 'python-mode-hook 'jedi:setup)
;;If auto-completion is all you need, use jedi:ac-setup instead:

(add-hook 'python-mode-hook 'jedi:ac-setup)
;;To setup recommended keybinds for Jedi.el, add this to your Emacs
;;configuration. Note that you must set jedi:setup-keys before loading
;;jedi.el. See its docstring (<f1> v jedi:setup-keys) for more
;;information.:

(setq jedi:setup-keys t)

;;elpy
(elpy-enable)
;; set backend
(put 'upcase-region 'disabled nil)

;; para que las variables de entorno de la shell de Emacs sean las
;; mismas de Mac OSX s
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; setear el interprete de anaconda solo cuando estoy en mac
(if (eq system-type 'darwin)
 '(elpy-rpc-python-command "~/anaconda/bin/python")
 '(python-shell-interpreter "~/anaconda/bin/python")) )
