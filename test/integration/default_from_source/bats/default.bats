#!/usr/bin/env bats

@test "should have collectd running" {
  service collectd status
}

@test "collectd configuration is valid" {
  collectd -T 2>&1 | grep -q "collectd: Stopping 5 read threads."
  collectd -T 2>&1 | grep -q "collectd: Stopping 5 write threads."
}

@test "should have the correct version of collectd installed" {
  collectd -h | grep -q '5.3.1'
}
