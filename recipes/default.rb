#
# Cookbook Name:: wp-cli
# Recipe:: default
#
# Copyright 2014, Makoto Kawasaki
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

remote_file node[:wp_cli][:path] do
  source 'https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar'
  mode 00755
end

# install community packages
# https://github.com/wp-cli/wp-cli/wiki/Community-Packages
if node[:wp_cli][:community_packages]
  directory "#{node[:wp_cli][:user][:home]}/.wp-cli/commands" do
    owner node[:wp_cli][:user][:name]
    group node[:wp_cli][:user][:group]
    mode 00755
    recursive true
    action :create
    only_if { Dir.exists?(node[:wp_cli][:user][:home]) }
  end

  node[:wp_cli][:community_packages].each do | package |
    git "#{node[:wp_cli][:user][:home]}/.wp-cli/commands/#{package[:name]}" do
      repository package[:repository]
      revision package[:revision] if package[:revision]
      user node[:wp_cli][:user][:name]
      group node[:wp_cli][:user][:group]
      only_if { Dir.exists?("#{node[:wp_cli][:user][:home]}/.wp-cli/commands") }
    end
  end

  template "#{node[:wp_cli][:user][:home]}/.wp-cli/config.yml" do
    source 'config.yml.erb'
    owner node[:wp_cli][:user][:name]
    group node[:wp_cli][:user][:group]
    mode 00644
    only_if { Dir.exists?("#{node[:wp_cli][:user][:home]}/.wp-cli") }
  end

end
