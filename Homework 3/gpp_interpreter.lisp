(load "lexer.lisp")
(load "rules.lisp")

(defun print-table (table)
    (write 
        (maphash 
            #'(lambda (k v) (format t "~a => ~a~%" k v)) table)
    )
)

(defun rdc (rule tokens vars)
    (case rule
    (0 (list (cdr tokens) vars))
    (1 (rule-1 tokens vars))
    (2 (rule-2 tokens vars))
    (3 (rule-3 tokens vars))
    (4 (rule-4 tokens vars))
    (5 (rule-5 tokens vars))
    (6 (rule-6 tokens vars))
    (7 (rule-7 tokens vars))
    (8 (rule-8 tokens vars))
    (9 (rule-9 tokens vars))
    (10 (rule-10 tokens vars))
    (11 (rule-11 tokens vars))
    (12 (rule-12 tokens vars))
    (13 (rule-13 tokens vars))
    (14 (rule-14 tokens vars))
    (15 (rule-15 tokens vars))
    (16 (rule-16 tokens vars))
    (17 (rule-17 tokens vars))
    (18 (rule-18 tokens vars))
    (19 (rule-19 tokens vars))
    (20 (rule-20 tokens vars))
    (21 (rule-21 tokens vars))
    (22 (rule-22 tokens vars))
    (23 (rule-23 tokens vars))
    (24 (rule-24 tokens vars))
    (25 (rule-25 tokens vars))
    (26 (rule-26 tokens vars))
    (27 (rule-27 tokens vars))
    (28 (rule-28 tokens vars))
    (29 (rule-29 tokens vars))
    (30 (rule-30 tokens vars))
    (31 (rule-31 tokens vars))
    (32 (rule-32 tokens vars))
    (33 (rule-33 tokens vars))
    (34 (rule-34 tokens vars))
    (35 (rule-35 tokens vars))
    (36 (rule-36 tokens vars))
    (37 (rule-37 tokens vars))
    (38 (rule-38 tokens vars))
    (39 (rule-39 tokens vars))
    )
)

(defun shift (state tokens vars bff)
    (setf old-state state)
    (setf res (list tokens vars))
    (setf tbff (copy-list bff))
    (case state
    (0
		(when (equal 'KW_NIL (car bff)) (setf state 1) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_TRUE (car bff)) (setf state 2) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_FALSE (car bff)) (setf state 3) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_OP (car bff)) (setf state 4) (setf tbff (tkn-cdr bff)))
		(when (equal 'COMMENT (car bff)) (setf state 5) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'PROGRAM (car bff)) (setf state 8) (setf tbff (term-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 9) (setf tbff (term-cdr bff)))
		(when (equal 'EXPB (car bff)) (setf state 10) (setf tbff (term-cdr bff)))
		(when (equal 'EXPLI (car bff)) (setf state 11) (setf tbff (term-cdr bff)))
	)
	(1
		(setf res (rdc 34 tokens vars))
		(setf state 0)
	)
	(2
		(setf res (rdc 24 tokens vars))
		(setf state 0)
	)
	(3
		(setf res (rdc 25 tokens vars))
		(setf state 0)
	)
	(4
		(when (equal 'KW_AND (car bff)) (setf state 12) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_OR (car bff)) (setf state 13) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_NOT (car bff)) (setf state 14) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_EQUAL (car bff)) (setf state 15) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_LESS (car bff)) (setf state 16) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_LIST (car bff)) (setf state 17) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_APPEND (car bff)) (setf state 18) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_CONCAT (car bff)) (setf state 19) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_SET (car bff)) (setf state 20) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_FOR (car bff)) (setf state 21) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_IF (car bff)) (setf state 22) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_EXIT (car bff)) (setf state 23) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_LOAD (car bff)) (setf state 24) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_DISP (car bff)) (setf state 25) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_PLUS (car bff)) (setf state 26) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_MINUS (car bff)) (setf state 27) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_DIV (car bff)) (setf state 28) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_MULT (car bff)) (setf state 29) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_DBMULT (car bff)) (setf state 30) (setf tbff (tkn-cdr bff)))
	)
	(5
		(setf res (rdc 9 tokens vars))
		(setf state 0)
	)
	(6
		(setf res (rdc 13 tokens vars))
		(setf state 0)
	)
	(7
		(setf res (rdc 14 tokens vars))
		(setf state 0)
	)
	(8
		(when (equal '$END (car bff)) (setf state 31) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_NIL (car bff)) (setf state 1) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_TRUE (car bff)) (setf state 2) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_FALSE (car bff)) (setf state 3) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_OP (car bff)) (setf state 32) (setf tbff (tkn-cdr bff)))
		(when (equal 'COMMENT (car bff)) (setf state 33) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 34) (setf tbff (term-cdr bff)))
		(when (equal 'EXPB (car bff)) (setf state 35) (setf tbff (term-cdr bff)))
		(when (equal 'EXPLI (car bff)) (setf state 36) (setf tbff (term-cdr bff)))
	)
	(9
		(setf res (rdc 1 tokens vars))
		(setf state 0)
	)
	(10
		(setf res (rdc 3 tokens vars))
		(setf state 0)
	)
	(11
		(setf res (rdc 5 tokens vars))
		(setf state 0)
	)
	(12
		(when (equal 'KW_TRUE (car bff)) (setf state 2) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_FALSE (car bff)) (setf state 3) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_OP (car bff)) (setf state 37) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPB (car bff)) (setf state 38) (setf tbff (term-cdr bff)))
	)
	(13
		(when (equal 'KW_TRUE (car bff)) (setf state 2) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_FALSE (car bff)) (setf state 3) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_OP (car bff)) (setf state 37) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPB (car bff)) (setf state 39) (setf tbff (term-cdr bff)))
	)
	(14
		(when (equal 'KW_TRUE (car bff)) (setf state 2) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_FALSE (car bff)) (setf state 3) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_OP (car bff)) (setf state 37) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPB (car bff)) (setf state 40) (setf tbff (term-cdr bff)))
	)
	(15
		(when (equal 'KW_TRUE (car bff)) (setf state 2) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_FALSE (car bff)) (setf state 3) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_OP (car bff)) (setf state 41) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUES (car bff)) (setf state 42) (setf tbff (term-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 43) (setf tbff (term-cdr bff)))
		(when (equal 'EXPB (car bff)) (setf state 44) (setf tbff (term-cdr bff)))
	)
	(16
		(when (equal 'OP_OP (car bff)) (setf state 45) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUES (car bff)) (setf state 46) (setf tbff (term-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 43) (setf tbff (term-cdr bff)))
	)
	(17
		(when (equal 'OP_OP (car bff)) (setf state 45) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_CP (car bff)) (setf state 47) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUES (car bff)) (setf state 48) (setf tbff (term-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 43) (setf tbff (term-cdr bff)))
	)
	(18
		(when (equal 'OP_OP (car bff)) (setf state 45) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUES (car bff)) (setf state 49) (setf tbff (term-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 43) (setf tbff (term-cdr bff)))
	)
	(19
		(when (equal 'KW_NIL (car bff)) (setf state 1) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_OP (car bff)) (setf state 50) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPLI (car bff)) (setf state 51) (setf tbff (term-cdr bff)))
	)
	(20
		(when (equal 'IDENTIFIER (car bff)) (setf state 52) (setf tbff (tkn-cdr bff)))
	)
	(21
		(when (equal 'KW_TRUE (car bff)) (setf state 2) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_FALSE (car bff)) (setf state 3) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_OP (car bff)) (setf state 37) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPB (car bff)) (setf state 53) (setf tbff (term-cdr bff)))
	)
	(22
		(when (equal 'KW_TRUE (car bff)) (setf state 2) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_FALSE (car bff)) (setf state 3) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_OP (car bff)) (setf state 37) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPB (car bff)) (setf state 54) (setf tbff (term-cdr bff)))
	)
	(23
		(when (equal 'OP_CP (car bff)) (setf state 55) (setf tbff (tkn-cdr bff)))
	)
	(24
		(when (equal 'STRING (car bff)) (setf state 56) (setf tbff (tkn-cdr bff)))
	)
	(25
		(when (equal 'KW_NIL (car bff)) (setf state 1) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_TRUE (car bff)) (setf state 2) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_FALSE (car bff)) (setf state 3) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_OP (car bff)) (setf state 57) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUES (car bff)) (setf state 58) (setf tbff (term-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 43) (setf tbff (term-cdr bff)))
		(when (equal 'EXPB (car bff)) (setf state 59) (setf tbff (term-cdr bff)))
		(when (equal 'EXPLI (car bff)) (setf state 60) (setf tbff (term-cdr bff)))
	)
	(26
		(when (equal 'OP_OP (car bff)) (setf state 45) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUES (car bff)) (setf state 61) (setf tbff (term-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 43) (setf tbff (term-cdr bff)))
	)
	(27
		(when (equal 'OP_OP (car bff)) (setf state 45) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUES (car bff)) (setf state 62) (setf tbff (term-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 43) (setf tbff (term-cdr bff)))
	)
	(28
		(when (equal 'OP_OP (car bff)) (setf state 45) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUES (car bff)) (setf state 63) (setf tbff (term-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 43) (setf tbff (term-cdr bff)))
	)
	(29
		(when (equal 'OP_OP (car bff)) (setf state 45) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUES (car bff)) (setf state 64) (setf tbff (term-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 43) (setf tbff (term-cdr bff)))
	)
	(30
		(when (equal 'OP_OP (car bff)) (setf state 45) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUES (car bff)) (setf state 65) (setf tbff (term-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 43) (setf tbff (term-cdr bff)))
	)
	(31
		(setf state 0)
	)
	(32
		(when (equal 'KW_AND (car bff)) (setf state 12) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_OR (car bff)) (setf state 13) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_NOT (car bff)) (setf state 14) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_EQUAL (car bff)) (setf state 15) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_LESS (car bff)) (setf state 16) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_LIST (car bff)) (setf state 17) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_APPEND (car bff)) (setf state 18) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_CONCAT (car bff)) (setf state 19) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_SET (car bff)) (setf state 20) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_FOR (car bff)) (setf state 21) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_IF (car bff)) (setf state 22) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_EXIT (car bff)) (setf state 66) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_LOAD (car bff)) (setf state 24) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_DISP (car bff)) (setf state 25) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_PLUS (car bff)) (setf state 26) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_MINUS (car bff)) (setf state 27) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_DIV (car bff)) (setf state 28) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_MULT (car bff)) (setf state 29) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_DBMULT (car bff)) (setf state 30) (setf tbff (tkn-cdr bff)))
	)
	(33
		(setf res (rdc 10 tokens vars))
		(setf state 0)
	)
	(34
		(setf res (rdc 2 tokens vars))
		(setf state 0)
	)
	(35
		(setf res (rdc 4 tokens vars))
		(setf state 0)
	)
	(36
		(setf res (rdc 6 tokens vars))
		(setf state 0)
	)
	(37
		(when (equal 'KW_AND (car bff)) (setf state 12) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_OR (car bff)) (setf state 13) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_NOT (car bff)) (setf state 14) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_EQUAL (car bff)) (setf state 15) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_LESS (car bff)) (setf state 16) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_LOAD (car bff)) (setf state 24) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_DISP (car bff)) (setf state 67) (setf tbff (tkn-cdr bff)))
	)
	(38
		(when (equal 'KW_TRUE (car bff)) (setf state 2) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_FALSE (car bff)) (setf state 3) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_OP (car bff)) (setf state 37) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPB (car bff)) (setf state 68) (setf tbff (term-cdr bff)))
	)
	(39
		(when (equal 'KW_TRUE (car bff)) (setf state 2) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_FALSE (car bff)) (setf state 3) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_OP (car bff)) (setf state 37) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPB (car bff)) (setf state 69) (setf tbff (term-cdr bff)))
	)
	(40
		(when (equal 'OP_CP (car bff)) (setf state 70) (setf tbff (tkn-cdr bff)))
	)
	(41
		(when (equal 'KW_AND (car bff)) (setf state 12) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_OR (car bff)) (setf state 13) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_NOT (car bff)) (setf state 14) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_EQUAL (car bff)) (setf state 15) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_LESS (car bff)) (setf state 16) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_SET (car bff)) (setf state 20) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_FOR (car bff)) (setf state 21) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_IF (car bff)) (setf state 22) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_LOAD (car bff)) (setf state 24) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_DISP (car bff)) (setf state 71) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_PLUS (car bff)) (setf state 26) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_MINUS (car bff)) (setf state 27) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_DIV (car bff)) (setf state 28) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_MULT (car bff)) (setf state 29) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_DBMULT (car bff)) (setf state 30) (setf tbff (tkn-cdr bff)))
	)
	(42
		(when (equal 'OP_OP (car bff)) (setf state 45) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_CP (car bff)) (setf state 72) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 73) (setf tbff (term-cdr bff)))
	)
	(43
		(setf res (rdc 11 tokens vars))
		(setf state 0)
	)
	(44
		(when (equal 'KW_TRUE (car bff)) (setf state 2) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_FALSE (car bff)) (setf state 3) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_OP (car bff)) (setf state 37) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPB (car bff)) (setf state 74) (setf tbff (term-cdr bff)))
	)
	(45
		(when (equal 'KW_SET (car bff)) (setf state 20) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_FOR (car bff)) (setf state 21) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_IF (car bff)) (setf state 22) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_DISP (car bff)) (setf state 75) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_PLUS (car bff)) (setf state 26) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_MINUS (car bff)) (setf state 27) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_DIV (car bff)) (setf state 28) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_MULT (car bff)) (setf state 29) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_DBMULT (car bff)) (setf state 30) (setf tbff (tkn-cdr bff)))
	)
	(46
		(when (equal 'OP_OP (car bff)) (setf state 45) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_CP (car bff)) (setf state 76) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 73) (setf tbff (term-cdr bff)))
	)
	(47
		(setf res (rdc 35 tokens vars))
		(setf state 0)
	)
	(48
		(when (equal 'OP_OP (car bff)) (setf state 45) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_CP (car bff)) (setf state 77) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 73) (setf tbff (term-cdr bff)))
	)
	(49
		(when (equal 'KW_NIL (car bff)) (setf state 1) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_OP (car bff)) (setf state 78) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 73) (setf tbff (term-cdr bff)))
		(when (equal 'EXPLI (car bff)) (setf state 79) (setf tbff (term-cdr bff)))
	)
	(50
		(when (equal 'KW_LIST (car bff)) (setf state 17) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_APPEND (car bff)) (setf state 18) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_CONCAT (car bff)) (setf state 19) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_DISP (car bff)) (setf state 80) (setf tbff (tkn-cdr bff)))
	)
	(51
		(when (equal 'KW_NIL (car bff)) (setf state 1) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_OP (car bff)) (setf state 50) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPLI (car bff)) (setf state 81) (setf tbff (term-cdr bff)))
	)
	(52
		(when (equal 'OP_OP (car bff)) (setf state 45) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUES (car bff)) (setf state 82) (setf tbff (term-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 43) (setf tbff (term-cdr bff)))
	)
	(53
		(when (equal 'OP_OP (car bff)) (setf state 45) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUES (car bff)) (setf state 83) (setf tbff (term-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 43) (setf tbff (term-cdr bff)))
	)
	(54
		(when (equal 'OP_OP (car bff)) (setf state 45) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUES (car bff)) (setf state 84) (setf tbff (term-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 43) (setf tbff (term-cdr bff)))
	)
	(55
		(setf res (rdc 7 tokens vars))
		(setf state 0)
	)
	(56
		(when (equal 'OP_CP (car bff)) (setf state 85) (setf tbff (tkn-cdr bff)))
	)
	(57
		(when (equal 'KW_AND (car bff)) (setf state 12) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_OR (car bff)) (setf state 13) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_NOT (car bff)) (setf state 14) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_EQUAL (car bff)) (setf state 15) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_LESS (car bff)) (setf state 16) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_LIST (car bff)) (setf state 17) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_APPEND (car bff)) (setf state 18) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_CONCAT (car bff)) (setf state 19) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_SET (car bff)) (setf state 20) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_FOR (car bff)) (setf state 21) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_IF (car bff)) (setf state 22) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_LOAD (car bff)) (setf state 24) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_DISP (car bff)) (setf state 25) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_PLUS (car bff)) (setf state 26) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_MINUS (car bff)) (setf state 27) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_DIV (car bff)) (setf state 28) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_MULT (car bff)) (setf state 29) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_DBMULT (car bff)) (setf state 30) (setf tbff (tkn-cdr bff)))
	)
	(58
		(when (equal 'OP_OP (car bff)) (setf state 45) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_CP (car bff)) (setf state 86) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 73) (setf tbff (term-cdr bff)))
	)
	(59
		(when (equal 'OP_CP (car bff)) (setf state 87) (setf tbff (tkn-cdr bff)))
	)
	(60
		(when (equal 'OP_CP (car bff)) (setf state 88) (setf tbff (tkn-cdr bff)))
	)
	(61
		(when (equal 'OP_OP (car bff)) (setf state 45) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_CP (car bff)) (setf state 89) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 73) (setf tbff (term-cdr bff)))
	)
	(62
		(when (equal 'OP_OP (car bff)) (setf state 45) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_CP (car bff)) (setf state 90) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 73) (setf tbff (term-cdr bff)))
	)
	(63
		(when (equal 'OP_OP (car bff)) (setf state 45) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_CP (car bff)) (setf state 91) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 73) (setf tbff (term-cdr bff)))
	)
	(64
		(when (equal 'OP_OP (car bff)) (setf state 45) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_CP (car bff)) (setf state 92) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 73) (setf tbff (term-cdr bff)))
	)
	(65
		(when (equal 'OP_OP (car bff)) (setf state 45) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_CP (car bff)) (setf state 93) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 73) (setf tbff (term-cdr bff)))
	)
	(66
		(when (equal 'OP_CP (car bff)) (setf state 94) (setf tbff (tkn-cdr bff)))
	)
	(67
		(when (equal 'KW_TRUE (car bff)) (setf state 2) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_FALSE (car bff)) (setf state 3) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_OP (car bff)) (setf state 37) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPB (car bff)) (setf state 59) (setf tbff (term-cdr bff)))
	)
	(68
		(when (equal 'OP_CP (car bff)) (setf state 95) (setf tbff (tkn-cdr bff)))
	)
	(69
		(when (equal 'OP_CP (car bff)) (setf state 96) (setf tbff (tkn-cdr bff)))
	)
	(70
		(setf res (rdc 26 tokens vars))
		(setf state 0)
	)
	(71
		(when (equal 'KW_TRUE (car bff)) (setf state 2) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_FALSE (car bff)) (setf state 3) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_OP (car bff)) (setf state 41) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUES (car bff)) (setf state 58) (setf tbff (term-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 43) (setf tbff (term-cdr bff)))
		(when (equal 'EXPB (car bff)) (setf state 59) (setf tbff (term-cdr bff)))
	)
	(72
		(setf res (rdc 30 tokens vars))
		(setf state 0)
	)
	(73
		(setf res (rdc 12 tokens vars))
		(setf state 0)
	)
	(74
		(when (equal 'OP_CP (car bff)) (setf state 97) (setf tbff (tkn-cdr bff)))
	)
	(75
		(when (equal 'OP_OP (car bff)) (setf state 45) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUES (car bff)) (setf state 58) (setf tbff (term-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 43) (setf tbff (term-cdr bff)))
	)
	(76
		(setf res (rdc 31 tokens vars))
		(setf state 0)
	)
	(77
		(setf res (rdc 36 tokens vars))
		(setf state 0)
	)
	(78
		(when (equal 'KW_LIST (car bff)) (setf state 17) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_APPEND (car bff)) (setf state 18) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_CONCAT (car bff)) (setf state 19) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_SET (car bff)) (setf state 20) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_FOR (car bff)) (setf state 21) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_IF (car bff)) (setf state 22) (setf tbff (tkn-cdr bff)))
		(when (equal 'KW_DISP (car bff)) (setf state 98) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_PLUS (car bff)) (setf state 26) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_MINUS (car bff)) (setf state 27) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_DIV (car bff)) (setf state 28) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_MULT (car bff)) (setf state 29) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_DBMULT (car bff)) (setf state 30) (setf tbff (tkn-cdr bff)))
	)
	(79
		(when (equal 'OP_CP (car bff)) (setf state 99) (setf tbff (tkn-cdr bff)))
	)
	(80
		(when (equal 'KW_NIL (car bff)) (setf state 1) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_OP (car bff)) (setf state 50) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPLI (car bff)) (setf state 60) (setf tbff (term-cdr bff)))
	)
	(81
		(when (equal 'OP_CP (car bff)) (setf state 100) (setf tbff (tkn-cdr bff)))
	)
	(82
		(when (equal 'OP_OP (car bff)) (setf state 45) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_CP (car bff)) (setf state 101) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 73) (setf tbff (term-cdr bff)))
	)
	(83
		(when (equal 'OP_OP (car bff)) (setf state 45) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_CP (car bff)) (setf state 102) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 73) (setf tbff (term-cdr bff)))
	)
	(84
		(when (equal 'OP_OP (car bff)) (setf state 45) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_CP (car bff)) (setf state 103) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 73) (setf tbff (term-cdr bff)))
	)
	(85
		(setf res (rdc 33 tokens vars))
		(setf state 0)
	)
	(86
		(setf res (rdc 23 tokens vars))
		(setf state 0)
	)
	(87
		(setf res (rdc 32 tokens vars))
		(setf state 0)
	)
	(88
		(setf res (rdc 39 tokens vars))
		(setf state 0)
	)
	(89
		(setf res (rdc 15 tokens vars))
		(setf state 0)
	)
	(90
		(setf res (rdc 16 tokens vars))
		(setf state 0)
	)
	(91
		(setf res (rdc 17 tokens vars))
		(setf state 0)
	)
	(92
		(setf res (rdc 18 tokens vars))
		(setf state 0)
	)
	(93
		(setf res (rdc 19 tokens vars))
		(setf state 0)
	)
	(94
		(setf res (rdc 8 tokens vars))
		(setf state 0)
	)
	(95
		(setf res (rdc 28 tokens vars))
		(setf state 0)
	)
	(96
		(setf res (rdc 27 tokens vars))
		(setf state 0)
	)
	(97
		(setf res (rdc 29 tokens vars))
		(setf state 0)
	)
	(98
		(when (equal 'KW_NIL (car bff)) (setf state 1) (setf tbff (tkn-cdr bff)))
		(when (equal 'OP_OP (car bff)) (setf state 78) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUE (car bff)) (setf state 6) (setf tbff (tkn-cdr bff)))
		(when (equal 'IDENTIFIER (car bff)) (setf state 7) (setf tbff (tkn-cdr bff)))
		(when (equal 'VALUES (car bff)) (setf state 58) (setf tbff (term-cdr bff)))
		(when (equal 'EXPI (car bff)) (setf state 43) (setf tbff (term-cdr bff)))
		(when (equal 'EXPLI (car bff)) (setf state 60) (setf tbff (term-cdr bff)))
	)
	(99
		(setf res (rdc 38 tokens vars))
		(setf state 0)
	)
	(100
		(setf res (rdc 37 tokens vars))
		(setf state 0)
	)
	(101
		(setf res (rdc 20 tokens vars))
		(setf state 0)
	)
	(102
		(setf res (rdc 22 tokens vars))
		(setf state 0)
	)
	(103
		(setf res (rdc 21 tokens vars))
		(setf state 0)
	)
    )
    (when (= old-state state)
        (print "SYNTAX_ERROR")
		(write state)
		(write bff)
        (bye)
    )
    (setf bff (copy-list tbff))
    (append (list state) res (list bff))
)

(defun interpret (tokens vars bff &optional state)
    (when (null state) (setf state 0))
    (setf res (shift state tokens vars bff))
    (setf state (nth 0 res))
    (setf tokens (nth 1 res))
    (setf vars (nth 2 res))
    (setf bff (nth 3 res))
	(when (= 8 state)
		(setf tokens (copy-list bff))
	)
    (when (= 31 state)
        (return-from interpret (list vars state bff))
    )
    (when (and (null bff) (or (= 0 state) (= 8 state)))
        (return-from interpret (list vars state bff))
    )
    (when (or (null bff) (= 0 state))
        (setf bff (copy-list tokens))
    )
    (interpret tokens vars bff state)
)

(defun gppinterpreter (vars &optional filename tokens)
    (when (null vars) (setf vars (make-hash-table :test 'equal)))
    (when (null tokens) (setf tokens NIL))
    (when (not (null filename))
        (setf content (reader filename))
		(setf content (subseq content 0 (- (length content) 0)))
        (setf tokens (lexer content tokens))
        (setf bff (copy-list tokens))
        (setf tmp (interpret tokens vars bff))
        (setf vars (nth 0 tmp))
        (when (= 8 (nth 1 tmp))
			(setf tokens NIL)
		)
		(gppinterpreter vars NIL tokens)
    )
	(when (null tokens)
		(terpri)
		(setf ln (read-line))
		(when (= 0 (length ln)) (gppinterpreter vars))
		(setf tokens (lexer (concatenate 'string ln (string #\NEWLINE)) tokens))
	)
    (setf bff (copy-list tokens))
    (setf tmp (interpret tokens vars bff))
    (setf vars (nth 0 tmp))
    (when (= 8 (nth 1 tmp))
        (setf tokens NIL)
    )
    (gppinterpreter vars NIL tokens)
)

(defun main ()
    (if (null *args*)
        (gppinterpreter NIL)
        (gppinterpreter NIL (car *args*))
    )
)

(main)