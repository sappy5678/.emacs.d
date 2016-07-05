(package-initialize)
(elpy-enable)
;;掃描~/.emacs.d目錄
(add-to-list 'load-path "~/.emacs.d/rc")
(require 'rc-windcycle)  ;;a windows控制

;; package.el 相關設定
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("elpy" . "https://jorgenschaefer.github.io/packages/"))
;;ido-mode 設置
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-use-filename-at-point 'guess)

;;把F5綁在js2-mode上面
(eval-after-load 'js3-mode  ;;再載入js2-mode前不要載入這個熱鍵
'(define-key js3-mode-map (kbd "<f5>") 'run-buffer-with-nodejs-interpreter)
)

(eval-after-load 'elpy  ;;再載入js2-mode前不要載入這個熱鍵
'(define-key elpy-mode-map (kbd "<f5>") 'elpy-test)
)

(defun run-buffer-with-nodejs-interpreter ()
  (interactive)
  (save-buffer)
  (getenv "SHELL")
   ;; (shell-command (format "ls" )) 
  ;;(shell-command (format "nvm use 6.2.2" )) 
  (shell-command (format "node %s" (file-name-nondirectory buffer-file-name)))  ;;相對路徑
  ;;(shell-command (format "node %s" (buffer-file-name))) ;;絕對路徑

   )


(add-hook 'js2-mode-hook 'ac-js2-mode) ;;use ac-js2




