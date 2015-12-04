namespace :build do

  desc "Build bosh-init image"
  task :bosh_init do
    system "cd bosh-init && docker build -t bosh-init ."
  end

  desc "Build spruce image"
  task :spruce do
    system "cd spruce && docker build -t spruce ."
  end

end

require 'rspec/core/rake_task'

task :spec => ["spec:bosh-init", "spec:spruce"]
task :default => :spec

namespace :spec do

  desc "Run all specs for bosh-init"
  RSpec::Core::RakeTask.new("bosh-init") do |t|
    t.pattern = "spec/bosh-init/**/*_spec.rb"
  end

  desc "Run all specs for spruce"
  RSpec::Core::RakeTask.new("spruce") do |t|
    t.pattern = "spec/spruce/**/*_spec.rb"
  end

end
