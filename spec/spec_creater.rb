#!/usr/bin/env ruby

require 'fileutils'
require 'aws-sdk'
require 'yaml'

#
config = YAML.load(File.read("#{ENV['HOME']}/path/to/config.yml"))
AWS.config(config)

orig = "../template"
servers = AWS.ec2.instances.select {|i| i.tags[:Name] == 'setup' && i.status == :running}.map(&:dns_name)
servers.each do |server|
  FileUtils.cp_r("#{orig}",server) unless FileTest.exist?(server)
end
