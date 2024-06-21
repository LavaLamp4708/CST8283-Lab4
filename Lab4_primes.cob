      ******************************************************************
      * Author: Peter Stainforth
      * Date: 2024-06-15
      * Purpose: Lab4 Q6
      * Tectonics: cobc
      ******************************************************************
       PROGRAM-ID. LAB-4-ADD-PRIMES.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-EOF PIC 9(1) VALUE 0.

       01 WS-NUMBER-INPUT              PIC 9(5).
       01 WS-PRIMES-SUM                PIC 9(5).
       01 WS-PRIMES-SUM-OUTPUT         PIC ZZZZ9.
       01 WS-CHECK-IF-PRIME            PIC 9(5).
       01 WS-DENOMINATOR               PIC 9(5).
       01 WS-REMAINDER                 PIC 9(5).
       01 WS-ZERO-REMAINDER-COUNT      PIC 9(1) VALUE 0.
       01 WS-DIVIDE-RESULT             PIC 9(5).


       PROCEDURE DIVISION.
       PRIMES.
           PERFORM GET-USER-INPUT.
      *    Iterates through each number until the number input is
      *    reached.
           PERFORM CHECK-IF-PRIME
               VARYING WS-CHECK-IF-PRIME
                   FROM 1
                   BY 1
                   UNTIL WS-CHECK-IF-PRIME = WS-NUMBER-INPUT.
           PERFORM DISPLAY-PRIMES-SUM.
           STOP RUN.
       GET-USER-INPUT.
           DISPLAY "Enter number:".
           ACCEPT WS-NUMBER-INPUT.
      *    If the count of remainders that are equal to 0 go above 2,
      *    the loop breaks and the next number in the CHECK-IF-PRIME
      *    loop is read.
       CHECK-IF-PRIME.
           MOVE 0 TO WS-ZERO-REMAINDER-COUNT.
           PERFORM
               VARYING WS-DENOMINATOR
                   FROM 1
                   BY 1
                   UNTIL WS-DENOMINATOR > WS-CHECK-IF-PRIME
                       OR WS-ZERO-REMAINDER-COUNT > 2
                   DIVIDE WS-CHECK-IF-PRIME BY WS-DENOMINATOR
                       GIVING WS-DIVIDE-RESULT
                       REMAINDER WS-REMAINDER
                   IF WS-REMAINDER = 0
                       ADD 1 TO WS-ZERO-REMAINDER-COUNT
           END-PERFORM.
           IF WS-ZERO-REMAINDER-COUNT = 2
               ADD WS-CHECK-IF-PRIME TO WS-PRIMES-SUM.
       DISPLAY-PRIMES-SUM.
           MOVE WS-PRIMES-SUM TO WS-PRIMES-SUM-OUTPUT.
           DISPLAY "Primes sum: " WS-PRIMES-SUM-OUTPUT.
       END PROGRAM LAB-4-ADD-PRIMES.
