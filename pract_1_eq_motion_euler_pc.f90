!      EQUATION OF MOTION WITH DIFFERENT METHODS
      PROGRAM pract_1_eq_motion_euler_pc
        IMPLICIT NONE

        INTEGER :: i, j, l
        REAL*8, DIMENSION(2001) :: vect_t, x_pred_t, x_cor_t, v_t, a_t, a_est_t, K_t, U_t
        REAL*8 :: m = 0.2, K = 2
        REAL*8 :: delta_t = 0.02
        REAL*8 :: x_0 = 0.05 , v_0 = 0

        !Assignem els valors inicials:
        x_pred_t(1) = x_0
        x_cor_t(1) = x_0
        v_t(1) = v_0
        a_t(1) = -x_pred_t(1)*K/m
        K_t(1) = (1.d0/2.d0)*(v_t(1))**2.d0
        U_t(1) = (1.d0/2.d0)*K*(x_cor_t(1))**2.d0
        vect_t = (/(delta_t*j,j=0,2000,1)/)
        !Obrim el fitxer on guardarem els resultats:
          DO i=2, size(vect_t)
            x_pred_t(i) = x_pred_t(i-1) + v_t(i-1)*delta_t + (1.d0/2.d0)*a_t(i-1)*(delta_t)**(2.d0)
            a_t(i) = -x_pred_t(i)*K/m

            a_est_t(i) = (1.d0/2.d0)*(a_t(i-1) + a_t(i))
            x_cor_t(i) = x_cor_t(i-1) + v_t(i-1)*delta_t + (1.d0/2.d0)*a_est_t(i)*(delta_t)**(2.d0)
            v_t(i) = v_t(i-1) + a_est_t(i)*delta_t
            K_t(i) = (1.d0/2.d0)*(v_t(i))**2.d0
            U_t(i) = (1.d0/2.d0)*K*(x_cor_t(i))**2.d0
          END DO
        OPEN(16,file ='results_eq_motion_euler_pc.dat', status ='unknown')
        DO i=1, size(vect_t)
          WRITE(16,'(5F17.8)') vect_t(i), x_cor_t(i), v_t(i), K_t(i), U_t(i)
        END DO
        CLOSE(16)
      STOP
    END PROGRAM pract_1_eq_motion_euler_pc
