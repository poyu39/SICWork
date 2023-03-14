MAIN	START	0
	LDX	#0
HEADP	LDCH	HEAD, X
	WD	OUTPUT
	TIX	#28
	JLT	HEADP
	LDA	#10	.換行
	WD	OUTPUT
.
YLOOP	LDA	NUMY
	ADD	#48	.0
	WD	OUTPUT
	LDA	#1
	STA	NUMX
XLOOP	LDA	NUMX
	MUL	NUMY
	STA 	RESAULT
	JSUB	WF
WE	JSUB	PP_X
	COMP	#10
	JLT	XLOOP
	LDA	#10	.換行
	WD	OUTPUT
	JSUB	PP_Y
	COMP	#10
	JLT	YLOOP
	J	EXIT
.
WF	COMP	#10
	JLT	DIGIT	.個位數
	LDA	#32
	WD	OUTPUT
	LDA	RESAULT
	DIV	#10
	STA	TEMP
	ADD	#48	
	WD	OUTPUT
	LDA	TEMP
	MUL	#10
	STA	TEMP
	LDA	RESAULT
	SUB	TEMP
	ADD	#48	.0
	WD	OUTPUT
	RSUB
DIGIT	LDA	#32
	WD	OUTPUT
	WD	OUTPUT
	LDA	RESAULT
	ADD	#48	.0
	WD	OUTPUT
	J	WE
.
PP_X	LDA	NUMX
	ADD	#1
	STA	NUMX
	LDA	NUMX
	RSUB
.
PP_Y	LDA	NUMY
	ADD	#1
	STA	NUMY
	LDA	NUMY
	RSUB
.
EXIT 	END 	MAIN
.
OUTPUT	BYTE	X'F2'
HEAD	BYTE	C'   1  2  3  4  5  6  7  8  9'
NUMX	WORD	1
NUMY	WORD	1
TEMP	WORD	0
RESAULT	WORD	0