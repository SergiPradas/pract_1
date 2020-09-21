###  CODI PER FER LES GRÀF, K_eu[2001:4002]IQUES DE LA PRACT 1: EQUATION OF MOTION
#---------------------------------------------------------------------------------------------------------------------------------------------------------
import matplotlib.pyplot as plt
import numpy as np

## DADES DEL METODE DE EULER
t_eu, x_eu, v_eu, a_eu, K_eu, U_eu = np.loadtxt('results_eq_motion_euler.dat',unpack=True)
#D'aquest fitxer recordar que tenim els de diferents pasos de temps:
t_eu_001, x_eu_001,v_eu_001, a_eu_001, K_eu_001, U_eu_001= t_eu[:2001], x_eu[:2001], v_eu[:2001], a_eu[:2001], K_eu[:2001], U_eu[:2001]
t_eu_01, x_eu_01,v_eu_01, a_eu_01, K_eu_01, U_eu_01 = t_eu[2001:4002], x_eu[2001:4002], v_eu[2001:4002], a_eu[2001:4002], K_eu[2001:4002], U_eu[2001:4002]
t_eu_02, x_eu_02,v_eu_02, a_eu_02, K_eu_02, U_eu_02 = t_eu[4002:6003], x_eu[4002:6003], v_eu[4002:6003], a_eu[4002:6003], K_eu[4002:6003], K_eu[4002:6003]

#DADES DEL METODE DE EULER PREDICTOR-CORRECTOR
t_eupc, x_eupc, v_eupc, K_eupc, U_eupc = np.loadtxt('results_eq_motion_euler_pc.dat',unpack=True)

#DADES DEL METODE DE VERLET
t_verlet, x_verlet, v_verlet, a_verlet, K_verlet, U_verlet = np.loadtxt('results_eq_motion_verlet.dat',unpack=True)

#DADES DELS RESULTATS REALS
t_an, x_an, v_an, a_an, K_an, U_an = np.loadtxt('results_eq_motion_analytic.dat',unpack=True)

#---------------------------------------------------------------------------------------------------------------------------------------------------------
#GRAFICA DE COMPARACIO DELS TRES DELTA_T DEL METODE DE EULER
fig = plt.figure()
ax = plt.axes()
ax.set_title('EULER MODEL',fontsize = 15)
ax.set_xlabel('time t (s)',fontsize = 15)
ax.set_ylabel('x(t) (m)',fontsize = 15)
ax.set_xlim(t_eu_001[0],t_eu_001[-1])
ax.set_ylim(-0.1,0.1)
ax.plot(t_eu_001,x_eu_001,'-r',linewidth=2,label='$\Delta t=0.001$ s')
ax.plot(t_eu_01,x_eu_01,'-b',linewidth=2,label='$\Delta t=0.01$ s')
ax.plot(t_eu_02,x_eu_02,'-g',linewidth=2,label='$\Delta t=0.02$ s')
ax.grid()
ax.legend()
plt.savefig('Euler_eq_motion.png')

#GRAFICA DE COMPARACION DE LOS TRES METODOS CON DELTA_T = 0.02s
fig = plt.figure()
ax = plt.axes()
ax.set_title('THREE MODEL COMPARISON WITH $\Delta t=0.02$ s',fontsize = 15)
ax.set_xlabel('time t (s)',fontsize = 15)
ax.set_ylabel('x(t) (m)',fontsize = 15)
ax.set_xlim(t_eu_02[0],t_eu_02[-1])
#ax.set_ylim(-0.1,0.1)
ax.plot(t_eu_02,x_eu_02,'-r',linewidth=2,label='Euler')
ax.plot(t_eupc,x_eupc,'-b',linewidth=2,label='Euler p-c')
ax.plot(t_verlet,x_verlet,'-g',linewidth=2,label='Verlet')
ax.plot(t_an,x_an,'-k',linewidth=2,label='Analytic')
ax.grid()
ax.legend()
plt.savefig('Three_methods_eq_motion.png')

#COMPUTACIO DE L'ERROR PER AQUESTS TRES METODES AMB DELTA_T = 0.02s
fig, (ax1, ax2) = plt.subplots(2, 1)
ax1.set_title('THREE MODEL ERROR COMPARISON WITH $\Delta t=0.02$ s',fontsize = 15)
ax1.set_ylabel('x_error(t) (m)',fontsize = 15)
ax1.xaxis.set_ticklabels([])
ax1.plot(t_eu_02,abs(np.subtract(x_eu_02,x_an)),'--r',linewidth=1,label='Euler')
ax1.grid()
ax1.legend()

ax2.set_xlabel('time t (s)',fontsize = 15)
ax2.set_ylabel('x_error(t) (m)',fontsize = 15)
ax2.plot(t_eupc,abs(np.subtract(x_eupc,x_an)),'--b',linewidth=1,label='Euler p-c')
ax2.plot(t_verlet,abs(np.subtract(x_verlet,x_an)),'--g',linewidth=1,label='Verlet')
ax2.grid()
ax2.legend()
plt.savefig('Error_eq_motion.png')

#ENERGIA CINETICA PER AQUESTS TRES METODES
fig, (ax1, ax2) = plt.subplots(2, 1)
ax1.set_title('KINETIC ENERGY COMPARISON WITH $\Delta t=0.02$ s',fontsize = 15)
ax1.set_ylabel('K(t) (J)',fontsize = 15)
ax1.xaxis.set_ticklabels([])
ax1.plot(t_an,K_an,'--k',linewidth=1,label='Analytic')
ax1.plot(t_eu_02,K_eu_02,'--r',linewidth=1,label='Euler')
ax1.grid()
ax1.legend()

ax2.set_xlabel('time t (s)',fontsize = 15)
ax2.set_ylabel('K(t) (J)',fontsize = 15)
ax2.plot(t_eupc,K_eupc,'--b',linewidth=1,label='Euler p-c')
ax2.plot(t_verlet,K_verlet,'--g',linewidth=1,label='Verlet')
ax2.plot(t_an,K_an,'--k',linewidth=1,label='Analytic')
ax2.grid()
ax2.legend()
plt.savefig('K_eq_motion.png')

#ENERGIA POTENTIAL PER AQUESTS TRES METODES
fig, (ax1, ax2) = plt.subplots(2, 1)
ax1.set_title('POTENTIAL ENERGY COMPARISON WITH $\Delta t=0.02$ s',fontsize = 15)
ax1.set_ylabel('K(t) (J)',fontsize = 15)
ax1.xaxis.set_ticklabels([])
ax1.plot(t_eu_02,U_eu_02,'--r',linewidth=1,label='Euler')
ax1.plot(t_an,U_an,'--k',linewidth=1,label='Analytic')
ax1.grid()
ax1.legend()

ax2.set_xlabel('time t (s)',fontsize = 15)
ax2.set_ylabel('U(t) (J)',fontsize = 15)
ax2.plot(t_eupc,U_eupc,'--b',linewidth=1,label='Euler p-c')
ax2.plot(t_verlet,U_verlet,'--g',linewidth=1,label='Verlet')
ax2.plot(t_an,U_an,'--k',linewidth=1,label='Analytic')
ax2.grid()
ax2.legend()
plt.savefig('U_eq_motion.png')

#ENERGIA TOTAL PER AQUESTS TRES METODES
fig, (ax1, ax2) = plt.subplots(2, 1)
ax1.set_title('TOTAL ENERGY COMPARISON WITH $\Delta t=0.02$ s',fontsize = 15)
ax1.set_ylabel('E(t) (J)',fontsize = 15)
ax1.xaxis.set_ticklabels([])
ax1.plot(t_eu_02,K_eu_02 + U_eu_02,'--r',linewidth=1,label='Euler')
ax1.plot(t_an,K_an + U_an,'--k',linewidth=1,label='Analytic')
ax1.grid()
ax1.legend()

ax2.set_xlabel('time t (s)',fontsize = 15)
ax2.set_ylabel('E(t) (J)',fontsize = 15)
ax2.plot(t_eupc,K_eupc + U_eupc,'--b',linewidth=1,label='Euler p-c')
ax2.plot(t_verlet,K_eupc + U_verlet,'--g',linewidth=1,label='Verlet')
ax2.plot(t_an,K_an + U_an,'--k',linewidth=1,label='Analytic')
ax2.grid()
ax2.legend()

plt.savefig('E_eq_motion.png')


#ERRORS EN L'ENERGIA CINETICA
fig, (ax1, ax2) = plt.subplots(2, 1)
ax1.set_title('KINETIC ENERGY ERROR COMPARISON WITH $\Delta t=0.02$ s',fontsize = 15)
ax1.set_ylabel('K_error(t) (J)',fontsize = 15)
ax1.xaxis.set_ticklabels([])
ax1.plot(t_an,abs(np.subtract(K_eu_02,K_an)),'--r',linewidth=1,label='Euler')
ax1.grid()
ax1.legend()

ax2.set_xlabel('time t (s)',fontsize = 15)
ax2.set_ylabel('K_error(t) (J)',fontsize = 15)
ax2.plot(t_eupc,abs(np.subtract(K_eupc,K_an)),'--b',linewidth=1,label='Euler p-c')
ax2.plot(t_verlet,abs(np.subtract(K_verlet,K_an)),'--g',linewidth=1,label='Verlet')
ax2.grid()
ax2.legend()
plt.savefig('K_error_eq_motion.png')

#ERRORS EN L'ENERGIA POTENCIAL
fig, (ax1, ax2) = plt.subplots(2, 1)
ax1.set_title('POTENTIAL ENERGY ERROR COMPARISON WITH $\Delta t=0.02$ s',fontsize = 15)
ax1.set_ylabel('U_error(t) (J)',fontsize = 15)
ax1.xaxis.set_ticklabels([])
ax1.plot(t_an,abs(np.subtract(U_eu_02,U_an)),'--r',linewidth=1,label='Euler')
ax1.grid()
ax1.legend()

ax2.set_xlabel('time t (s)',fontsize = 15)
ax2.set_ylabel('U_error(t) (J)',fontsize = 15)
ax2.plot(t_eupc,abs(np.subtract(U_eupc,U_an)),'--b',linewidth=1,label='Euler p-c')
ax2.plot(t_verlet,abs(np.subtract(U_verlet,U_an)),'--g',linewidth=1,label='Verlet')
ax2.grid()
ax2.legend()
plt.savefig('U_error_eq_motion.png')

#ERRORS EN L'ENERGIA TOTAL
E_eu_02 = K_eu_02 + U_eu_02
E_eupc = K_eupc + U_eupc
E_verlet = K_verlet + U_verlet
E_an = K_an + U_an
fig, (ax1, ax2) = plt.subplots(2, 1)
ax1.set_title('TOTAL ENERGY ERROR COMPARISON WITH $\Delta t=0.02$ s',fontsize = 15)
ax1.set_ylabel('E_error(t) (J)',fontsize = 15)
ax1.xaxis.set_ticklabels([])
ax1.plot(t_an,abs(np.subtract(E_eu_02,E_an)),'--r',linewidth=1,label='Euler')
ax1.grid()
ax1.legend()

ax2.set_xlabel('time t (s)',fontsize = 15)
ax2.set_ylabel('E_error(t) (J)',fontsize = 15)
ax2.plot(t_eupc,abs(np.subtract(E_eupc,E_an)),'--b',linewidth=1,label='Euler p-c')
ax2.plot(t_verlet,abs(np.subtract(E_verlet,E_an)),'--g',linewidth=1,label='Verlet')
ax2.grid()
ax2.legend()
plt.savefig('E_error_eq_motion.png')



plt.show()
