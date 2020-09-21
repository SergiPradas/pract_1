! CODI PRACT 1: ESPECTRAL LINES (VIA CORRELATION)
      PROGRAM  pract_1_correlation
        IMPLICIT NONE

        REAL*8, DIMENSION(2001) :: t, C_t
        REAL*8 :: omega, delta_t
        REAL*8 :: fint !funcio intermitja per fer la integral
        REAL*8, DIMENSION(100001) :: vec_omega,S_omega
        INTEGER :: i, j, k
        INTEGER :: i_om = 1 !Per contar la posicio de S_omega en el loop

        OPEN(10,file = 'corr.dat',status='old')
        DO i=1,2001
           READ(10,*) t(i), C_t(i)
        END DO
        CLOSE(10)


        delta_t = (t(2)-t(1))

        DO i_om=1,size(vec_omega)
          vec_omega(i_om) = (i_om - 1)*0.001
          omega = vec_omega(i_om)
          S_omega(i_om) = 0
          DO j=1,2001
            IF ((j == 1) .or. (j == size(t))) THEN
              fint = C_t(j)*cos(omega*t(j))
            ELSE IF (mod(j,2) .gt. 0) THEN !index senars
              fint = 4.d0*C_t(j)*cos(omega*t(j))
            ELSE !index parells
              fint = 2.d0*C_t(j)*cos(omega*t(j))
            END IF
          S_omega(i_om) = S_omega(i_om) + fint
          END DO
          S_omega(i_om) = S_omega(i_om)*delta_t/3.d0
        END DO

        OPEN(11, file = 's_omega.dat',status = 'unknown')
        DO k=1, size(S_omega)
          WRITE(11,'(F7.3,F17.8)') vec_omega(k), S_omega(k)
        END DO
        CLOSE(11)

        STOP
      END PROGRAM pract_1_correlation
