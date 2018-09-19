clc;
tch=50
cch=12
ach=tch-cch
prior = grand(38,1,"uin", 1,10);
c=1
d=1
for i=1:ach
if (prior(i)<=5) then
high_prior(c)=i
priorityh(c)=prior(i)
c=c+1
else
low_prior(d)=i
priorityl(d)=prior(i)

d=d+1
end
end
printf("high priority channels:");
for i=1:(c-1)
printf("%d)%d:%d\t",i,priorityh(i),high_prior(i));
end
printf("\n low priority channels:");
for i=1:(d-1)
printf("%d)%d:%d\t",i,priorityl(i),low_prior(i));
end
clust=input('Enter valid cluster size(upto 9): ')
call_total=0;
for i=1:clust
printf("Enter call demand for cell %d: ",i);
temp=scanf("%d");
call_dem(i)=temp;
call_total=call_total+temp;

end
no_hpch=19 / clust
rem_hpch=modulo(19,clust)

printf("\n%d,%d",no_hpch,rem_hpch);
indh=1
indl=1
cnt=1
disp(call_total)
for i=1:clust
percent_demand(i)=(call_dem(i)/call_total);
end
disp(percent_demand)
for i=1:clust
x=38*percent_demand(i)
printf("\n Printing cell allocated to cell %d:[ ",i);
y=ceil(x)
ach=ach-y;

if ach<0 then
ach=ach+y;
y=floor(x);
ach=ach-y;
end
for k=1:y
if cnt>=c | k>(y/2) then

printf("l%d:%d ",priorityl(indl),low_prior(indl));
indl=indl+1
cnt=cnt+1

elseif cnt>=37
printf("Extra")
elseif k<=(y/2)
printf("h%d:%d, ",priorityh(indh),high_prior(indh));
indh=indh+1
cnt=cnt+1
end
end
printf("]");
end