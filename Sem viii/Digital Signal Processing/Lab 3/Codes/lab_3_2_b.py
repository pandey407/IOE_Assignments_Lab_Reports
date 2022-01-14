import numpy as np
from matplotlib import pyplot as plt
a = 1
t = np.linspace(-5, 5, 1000)
x = np.where(t >= 0, 1, 0)
h = x*np.exp(-a*t)
y = np.convolve(x, h, mode='same')
fig, (ax1, ax2, ax3) = plt.subplots(3,1,constrained_layout=True)
fig.suptitle('CT convolution using convolve function\n(PUL074BEX007)')
fig.supxlabel('t')
fig.supylabel('Amplitude')
ax1.plot(t, x)
ax1.set_ylabel('$x(t)$')
ax2.plot(t, h)
ax2.set_ylabel('$h(t)$')
ax3.plot(t, y)
ax3.set_ylabel('$y(t)$')
plt.savefig('../Figures/lab_3_2_b_py.eps', format='eps')
plt.show()
