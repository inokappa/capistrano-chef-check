require 'spec_helper'

describe package('elasticsearch') do
  it { should be_installed }
end

describe package('td-agent') do
  it { should be_installed }
end

describe package('libssl0.9.8') do
  it { should be_installed }
end

describe command('/usr/lib/fluent/ruby/bin/gem list | grep fluent-plugin-elasticsearch') do
  it { should return_exit_status 0 }
end

describe command('/usr/lib/fluent/ruby/bin/gem list | grep fluent-plugin-typecast') do
  it { should return_exit_status 0 }
end

describe service ('td-agent') do
  it { should be_running }
end

describe service ('elasticsearch') do
  it { should be_running }
end
