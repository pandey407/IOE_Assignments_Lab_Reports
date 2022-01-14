import numpy as np
from matplotlib import pyplot as plt
n1 = np.arange(start=0, stop=5)
x = np.where(np.logical_and(n1 >= 0, n1 <= 4), 1, 0)
n2 = np.arange(start=0, stop=7)
h = np.where(np.logical_and(n2 >= 0, n2 <= 6), 2**n2, 0)
n_min = min(np.amin(n1), np.amin(n2))
n = np.arange(start=n_min, stop=n_min+n1.size+n2.size-2+1)
y = np.convolve(x, h)
plt.stem(n, y)
plt.title('Response of LTI system\n(PUL074BEX007)')
plt.xlabel('n')
plt.ylabel('Value')
plt.savefig('../Figures/lab_3_3_py.eps', format='eps')
plt.show()
