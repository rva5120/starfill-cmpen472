*************************************************************************
*
* Title:        StarFill (in Memory Lane)
*
* Objective:    CMPEN 472 Homework 1 in class demonstration
*               program
*
* Revision:     V1.4
*
* Date:         Aug. 28, 2015
*
* Programmer:   Raquel Alvarez
*
* Company:      The Pennsylvania State University
*               Department of Computer Science and Engineering
*
* Algorithm:    Simple while-loop demo
*
* Register Use: A: character data to be filled
*               B: counter, number of filled locations
*               X: memeory address pointer
*
* Memory Use:   RAM locations from $3000 to $3009
*
* Input:        Parameters hard coded in the program
*
* Output:       Data filled in memory locations
*               from $3000 to $3009 changed
*
* Observation:  This is a program designed for instruction purpose.
*               This program can be used as a loop template.
*
* Note:         This is a good example of program comments.
*               All homework programs MUST have comments similar
*               to this Homework 1 program. So, please use this
*               comment format for all your subsequent CMPEN 472
*               Homework programs.
*
*               Adding more explanatins and comments help you and
*               others understand your program later.
*
* Comments:     This program is developed and simulated using CodeWarrior
*               development software.
*
*************************************************************************
* Parameter Declatation Section
*
* Export Symbols
            XDEF        pgstart     ; export 'pgstart' symbol
            ABSENTRY    pgstart     ; for assembly entry point
            
* Symbols and Macros
PORTA       EQU         $0000       ; i/o port addresses
PORTB       EQU         $0001
DDRA        EQU         $0002
DDRB        EQU         $0003

*************************************************************************
* Data Section
*
            ORG         $3000       ; reserved memory starting address, in RAM
here        rmb         $0e         ; 14 memory locations reserved for stars
count       fcb         $0e         ; constant, star count = 10 (stored at $300a)

*
*************************************************************************
* Program Section
*
            ORG         $3100       ; program start address, in RAM
pgstart     ldaa       #$2a         ; load '*' ($2a) into accumulator A
            ldab        $300e       ; load star count into B
            ldx        #$3000       ; load starting address into X
            
loop        staa        0,x         ; put a star
            inx                     ; point to the next location
            decb                    ; decrease counter
            bne         loop        ; if not done, repeat
            
done        bra         done        ; task finished,
                                    ;   do nothing

*
* Add any subroutine here
*

            end                     ; last line of a file                                     