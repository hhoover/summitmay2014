# Encoding: utf-8

require_relative 'spec_helper'

describe package('openjdk-6-jdk') do
  it { should be_installed }
end

describe port(25565) do
  it { should be_listening }
end
