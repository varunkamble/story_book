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



//////OUTDOOR PROPAGATION MODEL HATA MODEL///////
d=[1:1:dist]'
Ch=0.8 + (1.1*log10(f1)-0.7)*hm - 1.56*log10(f1)
Lp1 = 69.55 + 26.16*log10(f1) - 13.82*log10(hb) - Ch + [44.9 - 6.55*log10(hb)]*log10(d)
Ch=0.8 + (1.1*log10(f2)-0.7)*hm - 1.56*log10(f2)
Lp2 = 69.55 + 26.16*log10(f2) - 13.82*log10(hb) - Ch + [44.9 - 6.55*log10(hb)]*log10(d)
Ch=0.8 + (1.1*log10(f3)-0.7)*hm - 1.56*log10(f3)
Lp3 = 69.55 + 26.16*log10(f3) - 13.82*log10(hb) - Ch + [44.9 - 6.55*log10(hb)]*log10(d)
Ch=0.8 + (1.1*log10(f4)-0.7)*hm - 1.56*log10(f4)
Lp4 = 69.55 + 26.16*log10(f4) - 13.82*log10(hb) - Ch + [44.9 - 6.55*log10(hb)]*log10(d)
Ch=0.8 + (1.1*log10(f5)-0.7)*hm - 1.56*log10(f5)
Lp5 = 69.55 + 26.16*log10(f5) - 13.82*log10(hb) - Ch + [44.9 - 6.55*log10(hb)]*log10(d)

figure;
plot(d,[Lp1 Lp2 Lp3 Lp4 Lp5]);
xlabel('x--> D (distance in Km)','fontsize',4); 
ylabel('y--> Lp (path loss)','fontsize',4); 
title('Hata model','fontsize',7);

hl=legend(["200MHZ","400MHZ","600MHZ","800MHZ","1000MHZ"],4);
