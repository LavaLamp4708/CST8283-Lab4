      ******************************************************************
      * Author: Peter Stainforth
      * Date: 2024-06-15
      * Purpose: Lab4 Q1
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LAB4-WITH-88.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-EOF PIC 9(1).
       01 WS-PRICE PIC $$$$9.99.
       01 WS-TOTAL PIC 9(5)V99.

       01 WS-CATEGORY PIC A(1).
           88 FAMILY       VALUE "F".
           88 ADULT        VALUE "A".
           88 STUDENT      VALUE "S".
           88 YOUTH        VALUE "Y".
           88 CHILD        VALUE "C".
           88 MILITARY     VALUE "M".

       01 WS-PRICING.
           05 WS-FAMILY-PRICE      PIC 9(2)V99 VALUE 80.00.
           05 WS-ADULT-PRICE       PIC 9(2)V99 VALUE 25.00.
           05 WS-STUDENT-PRICE     PIC 9(2)V99 VALUE 19.00.
           05 WS-YOUTH-PRICE       PIC 9(2)V99 VALUE 16.00.
           05 WS-MILITARY-PRICE    PIC 9(2)V99 VALUE 12.50.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "Family symbol:    F".
           DISPLAY "Adult symbol:     A".
           DISPLAY "Student symbol:   S".
           DISPLAY "Youth symbol:     Y".
           DISPLAY "Child symbol:     C".
           DISPLAY "Military symbol:  M".
           DISPLAY SPACES.
           DISPLAY "ENTER SYMBOL: " WITH NO ADVANCING
           ACCEPT WS-CATEGORY.
           IF FAMILY
               MOVE WS-FAMILY-PRICE TO WS-PRICE
               ADD WS-FAMILY-PRICE TO WS-TOTAL
               DISPLAY "PRICE: " WS-PRICE
           ELSE IF ADULT
               MOVE WS-ADULT-PRICE TO WS-PRICE
               ADD WS-ADULT-PRICE TO WS-TOTAL
               DISPLAY "PRICE: " WS-PRICE
           ELSE IF STUDENT
               MOVE WS-STUDENT-PRICE TO WS-PRICE
               ADD WS-STUDENT-PRICE TO WS-TOTAL
               DISPLAY "PRICE: " WS-PRICE
           ELSE IF YOUTH
               MOVE WS-YOUTH-PRICE TO WS-PRICE
               ADD WS-YOUTH-PRICE TO WS-TOTAL
               DISPLAY "PRICE: " WS-PRICE
           ELSE IF CHILD
               DISPLAY "PRICE: FREE"
           ELSE IF MILITARY
               MOVE WS-MILITARY-PRICE TO WS-PRICE
               ADD WS-MILITARY-PRICE TO WS-TOTAL
               DISPLAY "PRICE: " WS-PRICE
           ELSE
               MOVE 1 TO WS-EOF
               MOVE WS-TOTAL TO WS-PRICE.
               DISPLAY "Total: " WS-PRICE.

           STOP RUN.
       END PROGRAM LAB4-WITH-88.
