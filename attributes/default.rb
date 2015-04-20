default[:wp_cli][:path] = '/usr/local/bin/wp'
default[:wp_cli][:user][:name] = 'wp'

case node[:platform_family]
when 'mac_os_x'
  default[:wp_cli][:user][:home] = "/Users/#{node[:wp_cli][:user][:name]}"
  default[:wp_cli][:user][:group] = 'staff'
else
  default[:wp_cli][:user][:home] = "/home/#{node[:wp_cli][:user][:name]}"
  default[:wp_cli][:user][:group] = node[:wp_cli][:user][:name]
end

default[:wp_cli][:community_packages] = []
