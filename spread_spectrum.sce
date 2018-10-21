clc;
clear;
data_bits = input("Enter the input sequence: ");
//data_bits = [1,0,1,1]
ln=length(data_bits);

// Converting bits to 1 and -1
for i=1:ln
    if data_bits(i)==0
        data_bits(i)=-1;
    end
end   

// Generating the bit sequence with each bit 8 samples long
k=1;
for i=1:ln
   for j=1:8
       data_levels(k)=data_bits(i);
       j=j+1;
       k=k+1;
   end
    i=i+1;
end
len=length(data_levels);
figure();
subplot(411);
a = gca () ;
a.x_location = "origin";
a.y_location = "origin";
a.data_bounds = [0,-2;20,2];
xlabel ('t')
title ('Data')
plot2d2(data_levels);

// Generating the pseudo random noise pattern for spreading
pn_sig=round(rand(1,len));
for i=1:len
    if pn_sig(i)==0
        pn_sig(i)=-1;
    end
end  
subplot(412);
a = gca () ;
a.x_location = "origin";
a.y_location = "origin";
a.data_bounds = [0,-2;20,2];
xlabel ('t')
title ('PN Sequence')
plot2d2(pn_sig);

// Multiplying bit sequence with Pseudorandom Sequence
pn_data = prbs_a(len, len)
subplot(413);
a = gca () ;
a.x_location = "origin";
a.y_location = "origin";
a.data_bounds = [0,-2;20,2];
xlabel ('t')
title ('Data Multiplied with PN Sequence')
plot2d2(pn_data);

// BPSK Modulation
dsss=[];
t=0:1/10:2*%pi;   
c1=cos(t);
c2=cos(t+%pi);

for k=1:len
    if pn_data(k)==-1
        dsss=[dsss c1];
    else
        dsss=[dsss c2];
    end
end
subplot(414);
a = gca () ;
a.x_location = "origin";
a.y_location = "origin";
a.data_bounds = [0,-2;20,2];
xlabel ('t')
title ('BPSK Signal')
plot(dsss);
