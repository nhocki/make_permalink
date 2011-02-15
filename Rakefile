require 'bundler'
Bundler::GemHelper.install_tasks

require 'rubygems'
require 'rake'
require 'rspec'
require 'rspec/core/rake_task'

spec_files = Rake::FileList["spec/**/*_spec.rb"]

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = ["-c", "-f n", "-r ./spec/spec_helper.rb"]
  t.pattern = 'spec/**/*_spec.rb'
end

task :default => :spec
