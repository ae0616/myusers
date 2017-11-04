#
# Cookbook:: myusers
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

search("groups", "platform:#{node['platform']}").each do |group_data|
	if node['platform'] == 'windows'
		group group_data['id'] do
			group_name group_data['id']
			action :create
		end
	else
		group group_data['id'] do
			group_name group_data['id']
			gid group_data['gid']
			action :create
		end
	end
end
