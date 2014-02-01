require 'spec_helper'

describe package('nginx') do
  it { should be_installed }
end

describe package('php5') do
  it { should be_installed }
end

describe package('mysql-server') do
  it { should be_installed }
end
