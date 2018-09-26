{\rtf1\ansi\ansicpg1251\cocoartf1561\cocoasubrtf600
{\fonttbl\f0\fnil\fcharset0 HelveticaNeue;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl280\partightenfactor0

\f0\fs24 \cf2 \expnd0\expndtw0\kerning0
(write-line "Andrii Zozulia IP-63 Lab2(var 8)")\
\
(DEFUN list_n_elements(lst n)\'a0\
\'a0 \'a0\'a0\
\'a0 \'a0 (COND ((> n 0)\
\'a0 \'a0 \'a0 \'a0 (CONS (CAR lst)(list_n_elements (CDR lst) (- n 1))))\
\'a0 \'a0 )\
)\
(FORMAT t " Task 1 ~C Result: ~S~% " #\\linefeed (list_n_elements '(1 2 3 4 5) '2 ))\
\
(DEFUN insertion (lst x)\
\'a0 \'a0(COND ((NULL lst) (LIST x))\
\'a0 \'a0 \'a0 \'a0 \'a0((> (CAR lst) x) (CONS x lst))\
\'a0 \'a0 \'a0 \'a0 \'a0(t (CONS (CAR lst) (insertion (CDR lst) x)))))\
\
(DEFUN isort (x &optional (s nil))\
\'a0 \'a0(COND ((NULL x) s)\
\'a0 \'a0 \'a0 \'a0 \'a0(t (isort (CDR x) (insertion s (CAR x))))))\
\
(DEFUN shell_sort (lst gap finalLIST)\
\'a0(COND ((NULL lst) finalLIST)\
\'a0(T (COND ((> gap (LENGTH lst)) (APPEND finalLIST (isort lst)))\
\
\'a0 (T (APPEND finalLIST (isort (subseq lst 0 gap)) (shell_sort (subseq lst gap (LENGTH lst)) gap finalLIST)))))\
\'a0))\
\
(DEFUN shellSort (lst gaps)\'a0\
\'a0(COND ((NULL (CDR gaps)) (shell_sort lst (CAR gaps) '()))\
\'a0 (T (shellSort (shell_sort lst (CAR gaps) '()) (CDR gaps)))))\
\
(DEFUN SedgewickGaps (len finalLIST)\'a0\
\'a0'(1 8 23 77 281 1073 4193 16577 65921 262913 1050113 4197377 16783361\'a0\
\'a0 \'a067121153 268460033 1073790977 4295065601 17180065793 68719869953 274878693377\'a0\
\'a0 \'a01099513200641 4398049656833 17592192335873 70368756760577)\
)\
\
(DEFUN sortWithShellAndSedgewick (lst)\'a0\
\'a0(shellSort lst (SedgewickGaps (LENGTH lst) '(1)))\
\'a0)\
\
(FORMAT t " Task 2 ~C Result: ~S~% " #\\linefeed \'a0(sortWithShellAndSedgewick '(1 8 4 8)))\
\
(DEFUN LIST< (a b)\
\'a0 (COND\
\'a0 \'a0 ((or (NULL a)(NULL b)) NIL)\
\'a0 \'a0 (( < a (CAR b)) (LIST< a (CDR b)))\
\'a0 \'a0 (t(CONS (CAR b) (LIST< a (CDR b))))))\
\
(DEFUN LIST>= (a b)\
\'a0 (COND\
\'a0 \'a0 ((or (NULL a)(NULL b)) NIL)\
\'a0 \'a0 (( >= a (CAR b)) (LIST>= a (CDR b)))\
\'a0 \'a0 (T (CONS (CAR b) (LIST>= a (CDR b))))))\
\
\
(DEFUN qsort (L)\
\'a0 (COND\
\'a0 \'a0 ((NULL L) nil)\
\'a0 \'a0 (T (APPEND\
\'a0 \'a0 \'a0 \'a0 (qsort (LIST< (CAR L) (CDR L)))\
\'a0 \'a0 \'a0 \'a0 (CONS (CAR L) nil)\'a0\
\'a0 \'a0 \'a0 \'a0 (qsort (LIST>= (CAR L) (CDR L)))))))\
\
(FORMAT t " Task 3 ~C Result: ~S~% " #\\linefeed\'a0\
\'a0 \'a0 \'a0 \'a0 (qsort '(1 5 3 8 2)))\
\'a0 \'a0 \'a0 \'a0\'a0\
(DEFUN merge_LISTs\'a0\
\'a0 \'a0 (LIST1 LIST2)\
\'a0 \'a0 (COND ((NULL LIST1) LIST2)\
\'a0 \'a0 \'a0 \'a0 \'a0 ((NULL LIST2) LIST1)\
\'a0 \'a0 \'a0 \'a0 \'a0 ((> (CAR LIST1) (CAR LIST2)) (CONS (CAR LIST2) (merge_LISTs LIST1 (CDR LIST2))))\
\'a0 \'a0 \'a0 \'a0 \'a0 (T (CONS (CAR LIST1) (merge_LISTs (CDR LIST1) LIST2)))\
\'a0 \'a0 \'a0)\
)\
\'a0\
(FORMAT t " Task 4 ~C Result: ~S~% " #\\linefeed\'a0\
\'a0 \'a0 \'a0 \'a0 (merge_LISTs '(1 2 3 4 5) '(1 5 6 7)))\
\
\
\'a0 \'a0 \'a0 \'a0\'a0\
(defun depth (list)\
\'a0 (if (atom list)\
\'a0 \'a0 \'a0 0\
\'a0 \'a0 \'a0 (+ 1 (apply 'max\
\'a0 \'a0 \'a0 \'a0 \'a0 (mapcar #'depth list))))\
)\
\
\
(FORMAT t " Task 5 ~C Result: ~S~% " #\\linefeed\'a0\
\'a0 \'a0 \'a0 \'a0 (depth '(1 2 (3 4 (51 (2 6) 5) 6) 7 (6 8))))\
\
\'a0 \'a0 \'a0 \'a0 \'a0\'a0\
\'a0 \'a0 \'a0 \'a0 \'a0\
\'a0\
\
}