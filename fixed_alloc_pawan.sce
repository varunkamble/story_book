clc;
N = input("Enter number of channels: ");
cc = input("Enter number of control channels: ");
vc = (N-cc);
K = input("Enter size of the cluster: ");
Matrix = zeros(K, ceil(N/K));
disp('Fixed Channel Allocation')
vcpc = floor(vc./K);
ccpc = floor(cc./K);
disp(vcpc,"Number of Voice channels per cell are")
disp(ccpc,"Number of Control channels per cell are ")
c = 1;
x=1;
k1=K-cc
if K<=cc then
for j = 1:ceil(N/K)
for i = 1:K
if c > N then
Matrix(i,j) = 0;
else
Matrix(i,j) = c;
end
c = c + 1;
end
end
else
if k1<=3 then
//disp("true");
for j = 1:ceil(N/K)
for i = 1:K
if c > N then
Matrix(i,j) = x;
x=x+1;
else
Matrix(i,j) = c;
end
c = c + 1;
end
end
else
//disp("false");
disp("The control channels cannot be allocated");
end
end
disp(c)
//disp(Matrix)
for i = 1:K
disp(i,"Channels allocated for cell :-");
disp(Matrix(i,:));
end
