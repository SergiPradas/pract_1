! CODI DE LA PRACT 1: SUMAR NUMERO REAL I INTEGER
      BEGIN PROGRAM pract_1

        REAL*8 :: A = 3.8, S
        INTEGER :: I = 2

        OPEN(file = 1, 'pract_1-1.dat')
        S = A + I
        WRITE(10,*) S
      STOP
      END PROGRAM pract_1
