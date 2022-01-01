function Ashlesh_bodePlot(num,den)
h=tf(num,den);
options = bodeoptions;
options.FreqUnits = 'Hz';
bode(h,options);                    
grid on;
end

