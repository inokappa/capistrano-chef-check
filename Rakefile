require 'rake'
require 'rspec/core/rake_task'
#
require 'fileutils'
require 'aws-sdk'
require 'yaml'
#
task :genspec do
  config = YAML.load(File.read("#{ENV['HOME']}/path/to/config/deploy/config.yml"))
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
end
#
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*/*_spec.rb'
end
