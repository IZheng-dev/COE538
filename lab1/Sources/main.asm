********************************************************************
* Multiplication Program                                           *
* This program illustrates how to use the assembler.               *
* It adds together multiplies 8 bit numbers and leaves the result  *
* in the 'product' location.                                       *
* This is an unsigned multiply operation                           *
* Author: Isaac Zheng                                              *
********************************************************************

; export symbols
         XDEF Entry, _Startup   ; export ‘Entry’ symbol
         ABSENTRY Entry         ; for absolute assembly: mark this as application entry point

; Include derivative-specific definitions
         INCLUDE 'derivative.inc'

********************************************************************
* Code section                                                     *
********************************************************************
         ORG $3000
  
MULTIPLICAND FCB 01              ; First Number
MULTIPLIER   FCB 02              ; Second Number
PRODUCT      RMB 2               ; Result of Multiplication

********************************************************************
* The actual program starts here                                   *
********************************************************************
         ORG $4000
Entry:
_Startup:
         LDAA MULTIPLICAND      ; Get the first number into ACCA
         LDAB MULTIPLIER        ; Get the second number into ACCB
         
         MUL                    ; Multiply ACCA with ACCB
         STD PRODUCT            ; store the product into ACCD (comb of A and B)
         SWI                    ; break to the monitor

********************************************************************
* Interrupt Vectors                                                *
********************************************************************
         ORG $FFFE
         FDB Entry              ; Reset Vector



