(defun insert-pdb ()
       (interactive)
       (newline)
       (insert "import pdb; pdb.set_trace()")
       (indent-according-to-mode)
       )

(defun prepare-log ()
       (interactive)
       (newline)
       (insert "from pprint import pformat\n")
       (insert "import logging\n")
       (insert "log = logging.getLogger(__name__)\n")
       (indent-according-to-mode)
       )

(defun insert-log ()
       (interactive)
       (newline)
       (insert "log.debug('%s' % data)")
       (indent-according-to-mode)
       )

(defun remove-pdb ()
  (interactive)
  (beginning-of-buffer)
  (search-forward "import pdb; pdb.set_trace()")
  (beginning-of-line)
  (kill-line)
  (kill-line)
  )

(defun remove-consolelog ()
  (interactive)
  (beginning-of-buffer)
  (search-forward "console.log(")
  (beginning-of-line)
  (kill-line)
  (kill-line)
  )

(defun mycleanup ()
       (interactive)
       (beginning-of-buffer)
       (setq startb (point-marker))
       (end-of-buffer)
       (setq endb (point-marker))
       (untabify startb endb)
       (indent-region startb endb)
       (save-buffer)
       (beginning-of-buffer)
       (while (re-search-forward "^$" nil t)
         (beginning-of-line)
         (kill-line))
       (save-buffer)
       )