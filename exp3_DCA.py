'''
Author: Swapnil Masurekar
'''
import random
import math

total_channels = 50         #int(input("Enter number of channels: "))
num_control_channels = 12   #int(input("enter number of control channels: "))
num_data_channels = total_channels - num_control_channels

cluster_size = 7            #int(input("Enter size of cluster(K): "))

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
		alloted_traffic_channels[cell_no][0].append(traffic_channels[i])
	else:
		channels_group_as_per_priority[1].append(traffic_channels[i][0])
		alloted_traffic_channels[cell_no][1].append(traffic_channels[i])
	cell_no += 1

for i in range(len(alloted_traffic_channels)):
	print("High priority Channels alloted cell "+str(i+1)+" are:", alloted_traffic_channels[i][0])
	print("Low priority Channels alloted cell "+str(i+1)+" are:", alloted_traffic_channels[i][1])
	print("------------------------------------------------------")

# Printing the channels as per priority
print("The high priority channels are: ", channels_group_as_per_priority[0])
print("The high priority channels are: ", channels_group_as_per_priority[1])

# Take input of call request
channel_request = []
for i in range(cluster_size):
	channel_request.append(int(input("Enter call requests of cell no "+str(i+1)+": ")))
total_channels_requests = sum(channel_request)

# Calculate channels to to alloted in each cell
channels_to_be_alloted_per_cell = []
for item in channel_request:
	channels_to_be_alloted_per_cell.append(round(item*num_data_channels/total_channels_requests))
	hp_channels_to_be_alloted_per_cell.append(round(item*sum(channels_group_as_per_priority[0])/total_channels_requests))
	lp_channels_to_be_alloted_per_cell.append(round(item*sum(channels_group_as_per_priority[1])/total_channels_requests))
channels_remaining = num_data_channels - sum(channels_to_be_alloted_per_cell)
for i in range(channels_remaining):
	channels_to_be_alloted_per_cell[i] += 1 	
print(channels_to_be_alloted_per_cell, sum(channels_to_be_alloted_per_cell))









