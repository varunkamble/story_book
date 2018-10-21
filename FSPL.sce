clc;
for i=10:10:100
    f=input('Enter Frequency of operation in MHz');
    
//d1=input('Enter distance in Km');
d=10:1:100
f=20*log10(f);
FSPL=32.44+f+(20*log10(d));
//FSPL=32.44+f1+d1;

disp('FSPL for the given distance in dB');
disp(FSPL);
title('Free space path loss');
xlabel('Distance');
ylabel('Free space Propagation Loss in dB')
plot(d,FSPL);
captions(f,'in_upper_right');
end
