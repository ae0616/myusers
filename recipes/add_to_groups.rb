#
# Cookbook:: myusers
# Recipe:: add_to_groups
#
# Copyright:: 2017, The Authors, All Rights Reserved.

search("groups", "platform:#{node['platform']}").each do |group_data|
	if node['platform'] == 'windows'
		group group_data['id'] do
			group_name group_data['id']
			members group_data['members']
			append true
			action :modify
		end
	else
		group group_data['id'] do
			group_name group_data['id']
			members group_data['members']
			gid group_data['gid']
			append true
			action :modify
		end
	end
end
