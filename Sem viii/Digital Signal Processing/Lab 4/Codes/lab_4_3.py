import numpy as np
from scipy import signal
from plot_zplane import zplane
from matplotlib import pyplot as plt
b = np.array([1,2,1])
a1 = np.array([1,-1.2686,0.7051])
a2 = np.array([1,-1.0106,0.3583])
a3 = np.array([1,-0.9044,0.2155])
sos=np.vstack((np.hstack((0.0007378*b,a1)),np.hstack((b,a2)),np.hstack((b,a3))))
z1, p1, k1=signal.sos2zpk(sos)
b_tf,a_tf=signal.sos2tf(sos)
z2,p2,gain=signal.tf2zpk(b_tf,a_tf)
fig, (ax1, ax2) = plt.subplots(1,2,constrained_layout=True)
zplane(z1,p1,ax1)
ax1.set_title('From cascade sections')
ax1.set_ylabel('Imaginary part')
ax1.set_xlabel('Real part')
zplane(z2,p2,ax2)
ax2.set_title('From transfer function')
ax2.set_ylabel('Imaginary part')
ax2.set_xlabel('Real part')
fig.suptitle('Poles and zeros plot of system',fontsize='xx-large')
plt.show()