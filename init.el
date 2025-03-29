;;; package --- Steve Bradley <stevebradley@gmail.com> Emacs config
;;; Commentary:
;;   - All of the configuration is within `configuration.org`
;;; Code:

(package-initialize)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'org)

;; This loads the actual configuration in literate org-mode elisp
(defun load-config()
  (interactive)
  (org-babel-load-file "~/.emacs.d/configuration.org"))

(load-config)

;;; init.el ends here
