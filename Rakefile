#!/usr/bin/env rake
require "bundler/gem_tasks"

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec')

Dir.glob(File.join('tasks', '*.rake')).each { |r| import r }

task :default => :spec
