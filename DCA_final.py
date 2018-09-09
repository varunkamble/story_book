import random
import math

def check_if_not_adjacent(rellocable_channel, channel_list):
    for item in channel_list:
        if(abs(item[0]-rellocable_channel[0])==1):
            return False
    return True

total_channels = int(input("Enter number of channels: "))
num_control_channels = int(input("enter number of control channels: "))
num_data_channels = total_channels - num_control_channels

cluster_size = int(input("Enter size of cluster(K): "))

traffic_channels = [[number+1] for number in range(num_data_channels)]

# Channnel allotment list
alloted_traffic_channels = []
for i in range(cluster_size):
    alloted_traffic_channels.append([[],[]])

channels_group_as_per_priority = [[],[]]
# Generate priority and Form groups as per priority
cell_no = 0
for i in range(len(traffic_channels)):
	if(cell_no >= cluster_size):
		cell_no = 0
	traffic_channels[i].append(random.randint(1,10))
	if(traffic_channels[i][1] <= 5):
		channels_group_as_per_priority[0].append(traffic_channels[i][0])
	else:
		channels_group_as_per_priority[1].append(traffic_channels[i][0])
	cell_no += 1


# Printing the channels as per priority
print("The high priority channels are: ", channels_group_as_per_priority[0])
print("The high priority channels are: ", channels_group_as_per_priority[1])

# Take input of call request
channel_request = []
for i in range(cluster_size):
	channel_request.append(int(input("Enter call requests of cell no "+str(i+1)+": ")))
total_channels_requests = sum(channel_request)

# Calculate channels to be alloted in each cell
channels_to_be_alloted_per_cell = []
hp_channels_to_be_alloted_per_cell = []
lp_channels_to_be_alloted_per_cell = []
for item in channel_request:
	channels_to_be_alloted_per_cell.append(math.floor(item*num_data_channels/total_channels_requests))
	hp_channels_to_be_alloted_per_cell.append(math.floor(item*len(channels_group_as_per_priority[0])/total_channels_requests))
	lp_channels_to_be_alloted_per_cell.append(math.floor(item*len(channels_group_as_per_priority[1])/total_channels_requests))
channels_remaining = num_data_channels - sum(channels_to_be_alloted_per_cell)
hp_channels_remaining = len(channels_group_as_per_priority[0]) - sum(hp_channels_to_be_alloted_per_cell)
lp_channels_remaining = len(channels_group_as_per_priority[1]) - sum(lp_channels_to_be_alloted_per_cell)
for i in range(channels_remaining):
	channels_to_be_alloted_per_cell[i] += 1 	
for i in range(hp_channels_remaining):
	hp_channels_to_be_alloted_per_cell[i] += 1 	
for i in range(lp_channels_remaining):
	lp_channels_to_be_alloted_per_cell[i] += 1 	
print("\nNumber of channels alloted per cell are: ",channels_to_be_alloted_per_cell, sum(channels_to_be_alloted_per_cell))
print("Number High Priority of channels alloted per cell are: ",hp_channels_to_be_alloted_per_cell, sum(hp_channels_to_be_alloted_per_cell))
print("Number Low Priority of channels alloted per cell are: ",lp_channels_to_be_alloted_per_cell, sum(lp_channels_to_be_alloted_per_cell))

# Assigning HP channels
cell_no = 0
i = 0
while(i < len(channels_group_as_per_priority[0])):
	if(cell_no>=cluster_size):
		cell_no=0
	if(len(alloted_traffic_channels[cell_no][0])<hp_channels_to_be_alloted_per_cell[cell_no]):
		alloted_traffic_channels[cell_no][0].append(channels_group_as_per_priority[0][i])
		i += 1
	cell_no += 1

# Assigning LP channels
cell_no = 0
i = 0
while(i < len(channels_group_as_per_priority[1])):
	if(cell_no>=cluster_size):
		cell_no=0
	if(len(alloted_traffic_channels[cell_no][1])<hp_channels_to_be_alloted_per_cell[cell_no]):
		alloted_traffic_channels[cell_no][1].append(channels_group_as_per_priority[1][i])
		i += 1
	cell_no += 1

for i in range(len(alloted_traffic_channels)):
	print("The High Priority Channnels alloted in cell",i, "are", alloted_traffic_channels[i][0])
	print("The Low Priority Channnels alloted in cell",i, "are", alloted_traffic_channels[i][1])
	print("-------------------------------------------------------------")


