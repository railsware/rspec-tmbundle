# This is based on Florian Weber's TDDMate
require 'rubygems'

ENV['TM_PROJECT_DIRECTORY'] ||= File.dirname(ENV['TM_FILEPATH'])
rspec_rails_plugin = File.join(ENV['TM_PROJECT_DIRECTORY'],'vendor','plugins','rspec','lib')

if File.directory?(rspec_rails_plugin)
  $LOAD_PATH.unshift(rspec_rails_plugin)
elsif ENV['TM_RSPEC_HOME']
  rspec_lib = File.join(ENV['TM_RSPEC_HOME'], 'lib')
  unless File.directory?(rspec_lib)
    raise "TM_RSPEC_HOME points to a bad location: #{ENV['TM_RSPEC_HOME']}"
  end
  $LOAD_PATH.unshift(rspec_lib)
end

begin
  require 'spec/autorun'
rescue LoadError => e
  puts "<pre>"
  puts "Cannot load spec/autorun gem. Please make sure you have rspec gem installed."
  puts "  Ruby version : #{VERSION}."
  puts "  Load Path:"
  $LOAD_PATH.each{|lp| puts "     #{lp}"}
  puts "</pre>"
  exit
end

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/..')
require 'spec/mate/runner'
require 'spec/mate/switch_command'
