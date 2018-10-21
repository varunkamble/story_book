clc;
clear all;
hb=input("Enter the height of base station antenna:")
hm=input("Enter the height of mobile station antenna:")
Gt=input("Gain of the transmitting antenna:")
Gr=input("Gain of the receiving antenna:")
dist=input("Enter the distance between transmitting and receiving antenna:")
Amu=24

f1=input("Enter the first frequency value:")
f2=input("Enter the second frequency value:")
f3=input("Enter the third frequency value:")
f4=input("Enter the fourth frequency value:")
f5=input("Enter the fifth frequency value:")
d=[1:1:dist]'


//////OUTDOOR PROPAGATION MODEL-OKUMURA MODEL////
Lfs = 32.45 + 20*log10(d) + 20*log10(f1) - 10*log10(Gt) - 10*log10(Gr)
Lp1 = Lfs + Amu + hb + hm
Lfs = 32.45 + 20*log10(d) + 20*log10(f2) - 10*log10(Gt) - 10*log10(Gr)
Lp2 = Lfs + Amu + hb + hm
Lfs = 32.45 + 20*log10(d) + 20*log10(f3) - 10*log10(Gt) - 10*log10(Gr)
Lp3 = Lfs + Amu + hb + hm
Lfs = 32.45 + 20*log10(d) + 20*log10(f4) - 10*log10(Gt) - 10*log10(Gr)
Lp4 = Lfs + Amu + hb + hm
Lfs = 32.45 + 20*log10(d) + 20*log10(f5) - 10*log10(Gt) - 10*log10(Gr)
Lp5 = Lfs + Amu + hb + hm

figure;
plot(d,[Lp1 Lp2 Lp3 Lp4 Lp5]);
xlabel('x--> D (distance in Km)','fontsize',4); 
ylabel('y--> Lp (path loss)','fontsize',4); 
title('Okumura model','fontsize',7);

hl=legend(["200MHZ","400MHZ","600MHZ","800MHZ","1000MHZ"],4);
