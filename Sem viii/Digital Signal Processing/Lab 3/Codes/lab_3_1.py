import numpy as np
from matplotlib import pyplot as plt
x1 = np.array([1, 1, 1, 1, 1])
n1 = np.arange(start=-2, stop=3)
x2 = np.array([1, 0, 0, 0, 0, 0, 0, 0, 0, 0])
n2 = np.arange(start=-4, stop=6)
n_min = min(np.amin(n1), np.amin(n2))
n = np.arange(start=n_min, stop=n_min+n1.size+n2.size-2+1)
prod = np.transpose(np.column_stack(x1))*x2
y = np.zeros(n.size)
for i in range(0, x1.size):
    y[i:i+x2.size] = y[i:i+x2.size]+prod[i, :]
plt.stem(n, y)
plt.title('Convolution using basic convolution formula\n(PUL074BEX007)')
plt.xlabel('n')
plt.ylabel('Value')
plt.savefig('../Figures/lab_3_1_py.eps', format='eps')
plt.show()
