!      EQUATION OF MOTION WITH DIFFERENT METHODS
      PROGRAM pract_1_eq_motion_euler
        IMPLICIT NONE

        INTEGER :: i, j, l
        REAL*8, DIMENSION(2001) :: vect_t, x_t, v_t, a_t, K_t, U_t
        REAL*8 :: m = 0.2, K = 2
        REAL*8, DIMENSION(3) :: vec_delta_t = (/0.001,0.01,0.02/)
        REAL*8 :: delta_t
        REAL*8 :: x_0 = 0.05 , v_0 = 0

        !Assignem els valors inicials:
        x_t(1) = x_0
        v_t(1) = v_0
        a_t(1) = -x_t(1)*K/m
        K_t(1) = (1.d0/2.d0)*(v_t(1))**2.d0
        U_t(1) = (1.d0/2.d0)*K*(x_t(1))**2.d0

        !Obrim el fitxer on guardarem els resultats:
        OPEN(15,file ='results_eq_motion_euler.dat', status ='unknown')
        DO l=1, size(vec_delta_t)
          WRITE(15,'(6F17.8)') vect_t(1), x_t(1), v_t(1), a_t(1), K_t(1), U_t(1)
          delta_t = vec_delta_t(l)
          vect_t = (/(delta_t*j,j=0,2000,1)/)
          !PRINT*, vect_t
          DO i=2, size(vect_t)
            x_t(i) = x_t(i-1) + v_t(i-1)*delta_t + (1.d0/2.d0)*a_t(i-1)*(delta_t)**(2.d0)
            v_t(i) = v_t(i-1) + a_t(i-1)*delta_t
            a_t(i) = -x_t(i)*K/m
            K_t(i) = (1.d0/2.d0)*(v_t(i))**2.d0
            U_t(i) = (1.d0/2.d0)*K*(x_t(i))**2.d0

            WRITE(15,'(6F17.8)') vect_t(i), x_t(i), v_t(i), a_t(i), K_t(i), U_t(i)
          END DO
        END DO
        CLOSE(15)
      STOP
    END PROGRAM pract_1_eq_motion_euler
