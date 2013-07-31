node.set["collectd"]["install_type"] = "source"

include_recipe "collectd"

collectd_plugin "load"
