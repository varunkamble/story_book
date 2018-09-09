clc;
total_ch = 50;
control_ch = 12;
traffic_ch = 38;
prior(1:38) = grand(38,1,"uin",1,10);
x = zeros(1,38);

for i = 1:38
    x(i) = prior(i);
end

count_high = 1;
count_low = 1;

for i = 1:traffic_ch
    if (x(i) <= 5) then
        high_index(count_high) = i;
        high_priority(count_high) = prior(i);
        count_high = count_high + 1;
    else
        low_index(count_low) = i;
        low_priority(count_low) = prior(i);
        count_low = count_low + 1;
    end
end

printf("High priority channels:\n");
for i = 1:(count_high - 1)
    printf("Ch num :%d, priorty : %d\n", high_index(i), high_priority(i));
end

printf("\nLow priority channels:\n");
for i = 1:(count_low - 1)
    printf("Ch num :%d, priorty :%d\n", low_index(i), low_priority(i));
end


disp('Enter valid cluster size(upto 9): ');
clust = input("");

call_demand = zeros(1, clust);
total_demand = 0;

for i = 1:clust
    printf("Enter call demand for cell %d: ",i);
    temp = input("");
    call_demand(i) = temp;
    total_demand = total_demand + temp;
end

for i = 1:clust
    percent_demand(i) = ( (call_demand(i))/ (total_demand) );
end

for i = 1:clust
    num_channels(i) = traffic_ch * percent_demand(i);
end

disp(call_demand);
disp(total_demand);
disp(percent_demand);
disp(num_channels);
indh = 1
indl = 1
cnt = 1

for i = 1:clust
    printf("\n Printing cell allocated to cell %d:\n[",i);
    x = ceil(num_channels(i));
    traffic_ch = traffic_ch - x;
    if traffic_ch < 0 then
        traffic_ch = traffic_ch + x;
        x = floor(num_channels(i));
        traffic_ch = traffic_ch - x;
    end

    for k = 1:x
        if cnt >= count_high then
            printf("low %d:%d, ", low_index(indl),low_priority(indl));
            indl = indl + 1;
            cnt = cnt + 1;
        else
            printf("high %d:%d, ", high_index(indh),high_priority(indh));
            indh = indh + 1;
            cnt = cnt + 1;
        end
    end
    printf("]");
end
