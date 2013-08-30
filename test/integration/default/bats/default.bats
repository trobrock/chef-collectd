#!/usr/bin/env bats

@test "should have collectd running" {
  service collectd status
}

@test "collectd configuration is valid" {
  collectd -T | grep -q "collectd: Stopping 5 read threads."
  collectd -T | grep -q "collectd: Stopping 5 write threads."
}
