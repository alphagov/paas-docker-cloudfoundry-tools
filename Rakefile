namespace :build do
  desc "Build bosh-init image"
  task :bosh_init do
    system "cd bosh-init && docker build -t bosh-init ."
  end
end

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new

task :default => :spec

namespace :spec do

  desc "Run all specs for bosh-init"
  RSpec::Core::RakeTask.new("bosh-init") do |t|
    t.pattern = "spec/bosh-init/**/*_spec.rb"
  end

end
