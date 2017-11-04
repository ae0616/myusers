#
# Cookbook:: myusers
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

search("users", "platform:#{node['platform']}").each do |user_data|
	if node['platform'] == 'windows'
		user user_data['id'] do
			comment user_data['comment']
			action :create
		end
	else
		user user_data['id'] do
			comment user_data['comment']
			uid user_data['uid']
			gid user_data['gid']
			home user_data['home']
			shell user_data['shell']
			action :create
		end
	end
end
