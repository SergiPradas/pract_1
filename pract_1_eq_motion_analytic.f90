!      EQUATION OF MOTION WITH DIFFERENT METHODS
      PROGRAM pract_1_eq_motion_analytic
        IMPLICIT NONE

        INTEGER :: i, j, l
        REAL*8, DIMENSION(2001) :: vect_t, x_t, v_t, a_t, K_t, U_t
        REAL*8 :: m = 0.2, K = 2, A, omega
        REAL*8 :: delta_t = 0.02
        REAL*8 :: x_0 = 0.05 , v_0 = 0

        omega = sqrt(K/m)
        vect_t = (/(delta_t*j,j=0,2000,1)/)
        A = x_0

        !Assignem els valors inicials:
        x_t(1) = x_0
        v_t(1) = v_0
        a_t(1) = -A*((omega)**2.d0)*cos(omega*vect_t(1))
        K_t(1) = (1.d0/2.d0)*(v_t(1))**2.d0
        U_t(1) = (1.d0/2.d0)*K*(x_t(1))**2.d0

        DO i=2, size(vect_t)
            x_t(i) = A*cos(omega*vect_t(i))
            v_t(i) = -A*omega*sin(omega*vect_t(i))
            a_t(i) = -A*((omega)**2.d0)*cos(omega*vect_t(1))
            K_t(i) = (1.d0/2.d0)*(v_t(i))**2.d0
            U_t(i) = (1.d0/2.d0)*K*(x_t(i))**2.d0
        END DO
          !Obrim el fitxer on guardarem els resultats:
        OPEN(18,file ='results_eq_motion_analytic.dat', status ='unknown')
        DO l=1,size(vect_t)
         WRITE(18,'(6F17.8)') vect_t(l),x_t(l),v_t(l),a_t(l),K_t(l),U_t(l)
       END DO
        CLOSE(18)
      STOP
    END PROGRAM pract_1_eq_motion_analytic
