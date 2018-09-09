clc;
N = input("Enter number of channels: ");
CC = input("Enter number of control channels: ");
VC = (N-CC);
K = input("Enter size of the cluster: ");
Matrix = zeros(K, ceil(N/K));

disp('Fixed Channel Allocation')

VCPC = floor(VC./K);
CCPC = floor(CC./K);

disp(VCPC,"Number of Voice channels per cell are")
disp(CCPC,"Number of Control channels per cell are ")
c = 1;


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
disp(Matrix)

for i = 1:K
    disp(i, "Channels allocated for cell :-");
    disp(Matrix(i,:));
end

