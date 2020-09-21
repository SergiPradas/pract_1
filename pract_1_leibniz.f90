! CODI DE LA PRACT 1: LEIBNIZ FORMULA
      PROGRAM pract_1_leibniz
       IMPLICIT NONE
       INTEGER :: i = 0
       REAL*8, PARAMETER :: pi = 3.1415926535897932384626433
       REAL*8 :: suma = 0 !Aquesta sera la var. de la suma

       DO WHILE (abs(suma - pi/4.d0) .gt. 0.00001)
         suma = suma + ((-1.d0)**i)/(2.d0*i+1.d0)
         i = i + 1
       END DO

       PRINT*, 'suma =', suma, 'iteracions:', i

       STOP
      END PROGRAM pract_1_leibniz
