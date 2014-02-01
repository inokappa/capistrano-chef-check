#!/usr/bin/env ruby

require 'fileutils'
require 'aws-sdk'
require 'yaml'

#
config = YAML.load(File.read("#{ENV['HOME']}/config/deploy/config.yml"))
AWS.config(config)
#
ORIG = "./spec_template"
SPEC = "./spec"
#
servers = AWS.ec2.instances.select {|i| i.tags[:Name] == 'setup' && i.status == :running}.map(&:dns_name)
servers.each do |server|
  puts "Created #{SPEC}/#{server}/check_spec.rb"
  FileUtils.cp_r("#{ORIG}","#{SPEC}""/""#{server}") unless FileTest.exist?(server)
end
