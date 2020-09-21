      program practice1_2
        IMPLICIT NONE
        INTEGER :: N,K
        REAL :: err, approx_pi

        approx_pi=0.
        K=0
 8      N=K+1 !es el numero de iteraciones

        approx_pi=approx_pi + 4*((-1.d0)**K)/(1 + 2*K)
        K=K+1 !per si s'ha de fer una altra iteracio
        err = 3.14159 - approx_pi

        if (abs(err) .gt. 0.001) then
            goto 8
        else
            print *, approx_pi
            print *, 'The number of iterations required was ', N
        endif

      endprogram practice1_2
