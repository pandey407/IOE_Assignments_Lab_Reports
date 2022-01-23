import numpy as np
from scipy import signal
from matplotlib import pyplot as plt

b = np.array([0.0663, 0.1989, 0.1989, 0.0663])
a = np.array([1, -0.9349, 0.5668, -0.1015])
w, h = signal.freqz(b, a)
h_mag = 20 * np.log10(abs(h))
h_phase = np.unwrap(np.arctan2(np.imag(h), np.real(h)))
cutoffMag = max(h_mag)-3
cutoffFreq = np.interp(cutoffMag, np.flipud(h_mag), np.flipud(w))/np.pi
cutOffMagDisplay='$K_c=$ {:.3f}'.format(cutoffMag)
cutOffFreqDisplay='$\omega_c=$ {:.5f}'.format(cutoffFreq)
fig=plt.figure(constrained_layout=True)
(subfig1, subfig2)=fig.subfigures(1,2)
(axleft1,axleft2)=subfig1.subplots(2,1,sharex=True)
axleft1.plot(w/np.pi, h_mag)
axleft1.grid()
axleft1.set_title('Magnitude plot')
axleft1.set_ylabel('Magnitude (dB)',)
axleft1.axhline(cutoffMag, color='red', linestyle='--', linewidth=1)
axleft1.text(cutoffFreq, cutoffMag, cutOffMagDisplay, horizontalalignment='right',
         verticalalignment='top',rotation=60,color='red')
axleft1.axvline(cutoffFreq, color='green', linestyle='--', linewidth=1)
axleft1.text(cutoffFreq, 0, cutOffFreqDisplay, horizontalalignment='left',
         verticalalignment='bottom',rotation=60,transform=axleft1.get_xaxis_transform(),color='green')
axleft2.plot(w/np.pi, h_phase*180/np.pi)
axleft2.grid()
axleft2.set_title('Phase plot')
axleft2.set_ylabel('Phase (degree)')
axRight=subfig2.subplots(1,1)
axRight.plot(w/np.pi,abs(h))
axRight.grid()
axRight.set_title('Linearized form')
axRight.set_ylabel('Gain')
fig.suptitle('Frequency Response of the system\n(PUL074BEX007)')
fig.supxlabel('Normalized Frequency ($\\times \pi$ rad/sample)')
plt.savefig('../Figures/lab_4_1_py.pdf', format='pdf')
plt.show()
