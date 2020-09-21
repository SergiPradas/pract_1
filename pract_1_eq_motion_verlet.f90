!      EQUATION OF MOTION WITH DIFFERENT METHODS
      PROGRAM pract_1_eq_motion_euler_verlet
        IMPLICIT NONE

        INTEGER :: i, j, l
        REAL*8, DIMENSION(2001) :: vect_t, x_t, v_t, a_t, K_t, U_t
        REAL*8 :: m = 0.2, K = 2
        REAL*8 :: delta_t = 0.02
        REAL*8 :: x_0 = 0.05 , v_0 = 0

        !Assignem els valors inicials i la primera iteració::
        x_t(1) = x_0
        v_t(1) = v_0
        a_t(1) = -x_t(1)*K/m
        K_t(1) = (1.d0/2.d0)*(v_t(1))**2.d0
        U_t(1) = (1.d0/2.d0)*K*(x_t(1))**2.d0

        x_t(2) = x_t(1) + v_t(1)*delta_t + (1.d0/2.d0)*a_t(1)*(delta_t)**(2.d0)
        v_t(2) = v_t(1) + a_t(1)*delta_t
        a_t(2) = -x_t(2)*K/m
        K_t(2) = (1.d0/2.d0)*(v_t(2))**2.d0
        U_t(2) = (1.d0/2.d0)*K*(x_t(2))**2.d0

        vect_t = (/(delta_t*j,j=0,2000,1)/)
        !Obrim el fitxer on guardarem els resultats:
          DO i=3, size(vect_t)
            x_t(i) = 2.d0*x_t(i-1) - x_t(i-2) + a_t(i-1)*(delta_t)**(2.d0)
            v_t(i) = (x_t(i) - x_t(i-2))/(2*delta_t)
            a_t(i) = -x_t(i)*K/m
            K_t(i) = (1.d0/2.d0)*(v_t(i))**2.d0
            U_t(i) = (1.d0/2.d0)*K*(x_t(i))**2.d0
          END DO
         OPEN(17,file ='results_eq_motion_verlet.dat', status ='unknown')
         DO i=1, size(vect_t)
          WRITE(17,'(6F17.8)') vect_t(i), x_t(i), v_t(i), a_t(i), K_t(i), U_t(i)
        END DO
        CLOSE(17)
      STOP
    END PROGRAM pract_1_eq_motion_euler_verlet
