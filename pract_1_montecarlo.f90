! CODI PRACT 1: INTEGRACIO DE MONTECARLO
      PROGRAM pract_1_montecarlo
        IMPLICIT NONE
        INTEGER :: i,j,k,l !Variables para contar
        !Haremos 100 integrales de Montecarlo con vec_N puntos equiespaciados
        !de 100 a 10^7:
        INTEGER :: M = 100 !Nº de veces que integramos con una cierta N.
        !Esta M nos sirve para hacer analisis estadistico de cada N
        INTEGER, DIMENSION(6):: vec_N !Hacemos 10², 10³,10⁴,10⁵,10⁶ y 10⁷.
        INTEGER :: n !Puntos que caen dentro
        !Definimos el array en el que guardaremos los valores de la integral
        REAL*8, DIMENSION(100,6):: A
        !Y el enunciado nos proporciona el valor exacto de la integral:
        REAL*8 :: A_exact = 13.5916
        !Definimos los arrays en los que guardamos (el valor medio(mean_A) y
        !la standard deviation(std_A):
        REAL*8, DIMENSION(6) :: mean_A, std_A
        REAL*8 :: temp_std_A !Variable temporal que usamos para std_A
        !Para los puntos elegidos aleatorios:
        REAL*8 :: x, y
        !Definimos los valores de los limites dentro de los cuales queremos
        !sacar numeros:
        REAL*8 :: x_min = -1, x_max = 1, y_min = -11, y_max = 11

      !Para generar una secuencia diferente de numeros aleatorios cada vez que
      !corremos el codigo:
      !CALL INIT_RANDOM_SEED()
      !INTEGER :: seed_size
      !INTEGER, ALLOCATABLE :: seed(:) !Allocatable porque el tamaño cambia
      CALL RANDOM_SEED() !Inicializamos con la seed generada por el sistema
      !CALL RANDOM_SEED(size=seed_size) !Miramos el tamaño de la seed
      !ALLOCATE(seed(seed_size))
      !CALL RANDOM_SEED(get=seed) !Sacamos la seed generada por el sistema.

      !Definimos como tal el numero de puntos que usaremos:
      vec_N = (/100,1000,10000,100000,1000000,10000000/)

      !Ahora que ya tenemos definidas las variables empezamos a 'tirar' puntos:
      DO k=1, size(vec_N)
      DO i=1,M
        n=0 !Inicializamos los puntos que caen dentro
        A(i,k) = 0 !Inicializamos el valor de la integral
        DO j=1, vec_N(k)

          !Generacion de los puntos aleatorios
          CALL RANDOM_NUMBER(x) !Esto lo genera entre 0 i 1.
          x = x_min + (x_max - x_min)*x
          CALL RANDOM_NUMBER(y)
          y = y_min + (y_max - y_min)*y

          !Y ahora empezamos a comprobar si han caido dentro o no:
          IF ((x .GT. 0.d0) .AND. (y .GT. -1.d0/x) .AND. (y .LT. 1.d0/x)) THEN
            n = n + 1
          ELSE IF ((x.LT.0.d0) .AND. (y.LT.-1.d0/x) .AND. (y.GT.1.d0/x)) THEN
            n = n + 1
          ELSE
          !Aqui no hace nada, ya que han caido fuera.
          END IF

          A(i,k) = (x_max - x_min)*(y_max-y_min)*n/vec_N(k)
        END DO

      END DO
      END DO

      !Y ahora que hemos acabado ese bucle ya tenemos todos los valores necesa-
      !rios para hacer el analisis estadistico que buscamos:
      DO i=1, size(vec_N)
        mean_A(i) = 0 !Las inicializamos por si acaso.
        temp_std_A = 0
        std_A(i) = 0
        DO j=1, M
          mean_A(i) = mean_A(i) + A(j,i)
          temp_std_A = temp_std_A + (A(j,i)-A_exact)**2.d0
        END DO
        mean_A(i) = mean_A(i)/M
        std_A(i) = sqrt(temp_std_A/M)
      END DO

      !Y ahora guardamos los resultados en los ficheros correspondientes:
      OPEN(10,file = 'results_A.dat',status='unknown')
      DO i=1, size(vec_N)
        WRITE(10,'(I8,2F32.16)') vec_N(i), mean_A(i), std_A(i)
      END DO
      CLOSE(10)

      STOP
      END PROGRAM
