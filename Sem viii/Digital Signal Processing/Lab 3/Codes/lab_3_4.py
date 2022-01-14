import numpy as np
from matplotlib import pyplot as plt
t = np.linspace(-100, 100, 1000)
x = np.where(np.logical_and(t>=1,t<=100), 1, 0)
tau=float(input('Enter value of τ: '))
Tp=50
h = 2*tau/Tp*np.sinc(t*2*tau/Tp)
y = np.convolve(x, h, mode='same')
plt.plot(t, y)
plt.title('Response of LTI system with sinc function as impulse response\nwith τ={:.2f} \n(PUL074BEX007)'.format(tau))
plt.xlabel('t')
plt.ylabel('y(t)')
plt.savefig('../Figures/lab_3_4_py.eps', format='eps')
plt.show()

