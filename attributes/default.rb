#
# Cookbook Name:: collectd
# Attributes:: default
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

default['collectd']['interval'] = 10
default['collectd']['read_threads'] = 5
default['collectd']['version'] = "5.3.1"
default['collectd']['fqdn_lookup'] = "false"
default['collectd']['server_role'] = "collectd-server"
default['collectd']['install_type'] = "package"
default['collectd']['source_tar_name_prefix'] = "collectd-"
default['collectd']['source_tar_name_extension'] = ".tar.gz"
default['collectd']['source_url_prefix'] = "http://collectd.org/files/"
default['collectd']['checksum'] = "0b3fb2214ddeee3e8c6aabb7f3f231612f778645b2cb1bf3431b46844ec29359"
default['collectd']['log_level'] = "error"
default['collectd']['log_file'] = "collectd.log"
default['collectd']['log_timestamp'] = "true"
default['collectd']['log_print_severity'] = "false"
default['collectd']['ulimit']['file_descriptors'] = "65536"
case node["platform_family"]
when "debian"
  default['collectd']['build_prereq_pkgs'] = %w(librrd2-dev libsnmp-dev)
when "rhel", "fedora", "suse"
  default['collectd']['build_prereq_pkgs'] = %w(
    rrdtool-devel net-snmp-devel perl-ExtUtils-MakeMaker
  )
else
  default['collectd']['build_prereq_pkgs'] = %w()
end
default['collectd']['autoconf_opts'] = nil
default['collectd']['graphite_prefix'] = "collectd."

default['collectd']['prefix_dir'] = "/usr"
default['collectd']['sysconf_dir'] = "/etc/collectd"
default['collectd']['plugconf_dir'] = "/etc/collectd/plugins"
default['collectd']['bin_dir'] = "/usr/bin"
default['collectd']['sbin_dir'] = "/usr/sbin"
default['collectd']['log_dir'] = "/var/log/collectd/"

ubuntu_precise = (node['platform'] == "ubuntu" and node['platform_version'].to_f >= 12.04)

if node['kernel']['machine'] == 'x86_64' and not ubuntu_precise
  default['collectd']['plugin_dir'] = "/usr/lib64/collectd"
else
  default['collectd']['plugin_dir'] = "/usr/lib/collectd"
end

default['collectd']['types_db'] = "/usr/share/collectd/types.db"
default['collectd']['src_dir'] = "/opt/src-collectd"
