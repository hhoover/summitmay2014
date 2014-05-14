#
# Cookbook Name:: minecraft
# Attributes:: default
#
# Copyright 2013, Greg Fitzgerald.
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['minecraft']['user']                = 'mcserver'
default['minecraft']['group']               = 'mcserver'
default['minecraft']['install_dir']         = '/srv/minecraft'
# Currently vanilla, bukkit, spligot
default['minecraft']['install_type']        = 'vanilla'

case node['minecraft']['install_type']
when 'vanilla'
  default['minecraft']['url']                 = 'https://s3.amazonaws.com/Minecraft.Download/versions/1.7.9/minecraft_server.1.7.9.jar'
  default['minecraft']['checksum']            = 'f7b9150d05c2cf8c48541527de310557e6bd9bde73e8ac9479e8ffe722c60a21'
when 'bukkit'
  default['minecraft']['url']                 = 'http://dl.bukkit.org/downloads/craftbukkit/get/02389_1.6.4-R2.0/craftbukkit.jar'
  default['minecraft']['checksum']            = '29c26ec69dcaf8c1214f90f5fa5609fc451aae5fe0d22fd4ce37a505684545b3'
when 'spigot'
  default['minecraft']['url']                 = 'http://ci.md-5.net/view/Spigot/job/Spigot/lastStableBuild/artifact/Spigot-Server/target/spigot.jar'
  default['minecraft']['checksum']            = '13abb884cb8f1bc8dfcd110fa3616f03b7ec5e23eb4b2e903b054c0ad23c4ac5'
end

# Defaults to 40% of your total memory.
default['minecraft']['xms']                 = "#{(node['memory']['total'].to_i * 0.4).floor / 1024}M"
# Defaults to 60% of your total memory.
default['minecraft']['xmx']                 = "#{(node['memory']['total'].to_i * 0.6).floor / 1024}M"

# Additional options to be passed to java, for runit only
default['minecraft']['java-options']        = ''
default['minecraft']['init_style']          = 'runit'

default['minecraft']['ops']                 = []
default['minecraft']['banned-ips']          = []
default['minecraft']['banned-players']      = []
default['minecraft']['white-list']          = []

# See the readme for an explanation
default['minecraft']['autorestart'] = true
