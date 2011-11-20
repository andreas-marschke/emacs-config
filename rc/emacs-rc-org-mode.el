;;; emacs-rc-org-mode.el ---

;; Copyright (C) 2004 Alex Ott
;;
;; Author: xxtjaxx@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet
;; (require 'org-install)
(require 'org)

(setq org-startup-folded t)
; (setq org-log-done t)
(setq org-hide-leading-stars nil)
(setq org-agenda-include-diary t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-include-all-todo t)
(setq org-use-property-inheritance t)
;; (setq org-enforce-todo-dependencies t)
(setq org-special-ctrl-a/e t)
;; (setq org-special-ctrl-k t)
;; (setq org-blank-before-new-entry (quote ((heading . auto) (plain-list-item))))
;; (setq org-agenda-dim-blocked-tasks 'invisible)
;; (setq org-enforce-todo-checkbox-dependencies t)
;; (setq diary-file "~/projects/OrgMode/diary")

(setq calendar-mark-diary-entries-flag t)
(setq org-todo-keywords '((sequence "TODO" "|" "WAITING" "|" "DONE" )))


(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|/TODO\\)$" . org-mode))
(add-to-list 'file-coding-system-alist (cons "\\.\\(org\\|org_archive\\|/TODO\\)$"  'utf-8))

;; (define-key global-map "\C-cl" 'org-store-link)
;; (define-key global-map "\C-ca" 'org-agenda)
;; (define-key global-map "\C-cb" 'org-iswitchb)

;; link abbrevs
(add-to-list 'org-link-abbrev-alist '("emacswiki" . "http://www.emacswiki.org/cgi-bin/wiki/"))
(add-to-list 'org-link-abbrev-alist '("google" . "http://www.google.com/search?q="))


;; remember mode
(org-remember-insinuate)
;; (setq org-directory "~/.emacs.d/OrgMode")
(setq org-default-notes-file "~/.todo.org")
(define-key global-map "\C-cr" 'org-remember)

;; icalendar
(autoload 'icalendar-import-buffer "icalendar" "Import iCalendar data from current buffer" t)

;; Export to to PDF latex Classes
;;; The standard ones are okay for normal publications but
;;; they lack the beamer class

;;; allow for export=>beamer by placing
;; #+LaTeX_CLASS: beamer
;; #+MACRO: BEAMERMODE presentation
;; #+MACRO: BEAMERTHEME Antibes
;; #+MACRO: BEAMERCOLORTHEME lily
;; #+MACRO: BEAMERSUBJECT RMRF
;; #+MACRO: BEAMERINSTITUTE Miskatonic University, Astrology Dept.
;; #+TITLE: Presentation with Org-Mode and Beamer
;; #+AUTHOR: Someone

(setq org-export-latex-classes
      '(("beamer"
	 "\\documentclass[11pt]{beamer}\n \\mode<{{{beamermode}}}>\n \\usetheme{{{{beamertheme}}}}\n \\usecolortheme{{{{beamercolortheme}}}}\n \\beamertemplateballitem\n \\setbeameroption{show notes} \\usepackage[utf8]{inputenc}\n \\usepackage[T1]{fontenc}\n \\usepackage{hyperref}\n \\usepackage{color} \\usepackage{listings} \\lstset{numbers=none,language=[ISO]C++,tabsize=4,frame=single,basicstyle=\\small,showspaces=false,showstringspaces=false,showtabs=false,keywordstyle=\\color{blue}\\bfseries,commentstyle=\\color{red},}\n \\usepackage{verbatim}\n \\institute{{{{beamerinstitute}}}}\n\\subject{{{{beamersubject}}}}\n"
	 ("\\section{%s}" . "\\section*{%s}")
	 ("\\begin{frame}[fragile]\\frametitle{%s}"
	  "\\end{frame}"
	  "\\begin{frame}[fragile]\\frametitle{%s}"
	  "\\end{frame}")
	 )
	("article" "\\documentclass[11pt]{article}\n\\usepackage[utf8]{inputenc}\n\\usepackage[T1]{fontenc}\n\\usepackage{graphicx}\n\\usepackage{longtable}\n\\usepackage{float}\n\\usepackage{wrapfig}\n\\usepackage{soul}\n\\usepackage{amssymb}\n\\usepackage{hyperref}"
	 ("\\section{%s}" . "\\section*{%s}")
	 ("\\subsection{%s}" . "\\subsection*{%s}")
	 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	 ("\\paragraph{%s}" . "\\paragraph*{%s}")
	 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
	 )
	("report" "\\documentclass[11pt]{report}\n\\usepackage[utf8]{inputenc}\n\\usepackage[T1]{fontenc}\n\\usepackage{graphicx}\n\\usepackage{longtable}\n\\usepackage{float}\n\\usepackage{wrapfig}\n\\usepackage{soul}\n\\usepackage{amssymb}\n\\usepackage{hyperref}"
	 ("\\part{%s}" . "\\part*{%s}")
	 ("\\chapter{%s}" . "\\chapter*{%s}")
	 ("\\section{%s}" . "\\section*{%s}")
	 ("\\subsection{%s}" . "\\subsection*{%s}")
	 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	 )
      	("book" "\\documentclass[11pt]{book}\n\\usepackage[utf8]{inputenc}\n\\usepackage[T1]{fontenc}\n\\usepackage{graphicx}\n\\usepackage{longtable}\n\\usepackage{float}\n\\usepackage{wrapfig}\n\\usepackage{soul}\n\\usepackage{amssymb}\n\\usepackage{hyperref}"
	 ("\\part{%s}" . "\\part*{%s}")
	 ("\\chapter{%s}" . "\\chapter*{%s}")
	 ("\\section{%s}" . "\\section*{%s}")
	 ("\\subsection{%s}" . "\\subsection*{%s}")
	 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	 )
	("letter"
	 "\\documentclass[11pt]{letter}\n\\usepackage[utf8]{inputenc}\n\\usepackage[T1]{fontenc}\n\\usepackage{color}\n\\usepackage{xspace}\\n\\usepackage{ragged2e}\\n\\usepackage[T1]{fontenc}\\n\\usepackage{mathptmx}\\n\\usepackage{lmodern}\\n\\\n"
	 ("\\section{%s}" . "\\section*{%s}")
	 ("\\subsection{%s}" . "\\subsection*{%s}")
	 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	 ("\\paragraph{%s}" . "\\paragraph*{%s}")
	 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
	("credativ"
	 "\\documentclass[paper=a4,pagesize=auto,titlepage,11pt,ngerman]{scrartcl}\n\\setlength{\\headheight}{38pt}\n\\tolerance=1000\n\\usepackage[T1]{fontenc}\n\\usepackage[babel,german=quotes]{csquotes}\n\\usepackage[ngerman]{babel}\n\\usepackage[pdftex,\n	    colorlinks,\n	    linkcolor=black,\n	    citecolor=black,\n	    urlcolor=black,\n	    filecolor=black,\n	    plainpages=false]{hyperref}\n\\usepackage[utf8]{inputenc}\n\\usepackage{amssymb}\n\\usepackage{booktabs}\n\\usepackage{eurosym}\n\\usepackage{fancyhdr}\n\\usepackage{fancyvrb}\n\\usepackage{fixltx2e}\n\\usepackage{floatrow}\n\\usepackage{float}\n\\usepackage{hyperref}\n\\usepackage{latexsym}\n\\usepackage{listings}\n\\usepackage{lmodern}\n\\usepackage{longtable}\n\\usepackage{marvosym}\n\\usepackage{mathptmx}\n\\usepackage{multirow}\n\\usepackage{ngerman}\n\\usepackage{ragged2e}\n\\usepackage{soul}\n\\usepackage{tabularx}\n\\usepackage{graphicx}\n\\usepackage{textcomp}\n\\usepackage{tikz}\n\\usepackage{upquote}\n\\usepackage{wasysym}\n\\usepackage{wrapfig}\n\\usepackage{xspace}\n\\pagestyle{fancy}\n"
	 ("\\section{%s}" . "\\section*{%s}")
	 ("\\subsection{%s}" . "\\subsection*{%s}")
	 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	 ("\\paragraph{%s}" . "\\paragraph*{%s}")
	 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))
(setq org-export-html-auto-postamble nil)
(setq org-export-html-auto-preamble  nil)
(setq org-export-html-table-use-header-tags-for-first-column t)


;; emacs-rc-org-mode.el ends here




