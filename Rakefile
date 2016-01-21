namespace :build do

  desc "Build bosh-init image"
  task :bosh_init do
    system "cd bosh-init && docker build -t bosh-init ."
  end

  desc "Build spruce image"
  task :spruce do
    system "cd spruce && docker build -t spruce ."
  end

  desc "Build curl-ssl image"
  task :curl_ssl do
    system "cd curl-ssl && docker build -t curl-ssl ."
  end

  desc "Build mksecrets image"
  task :mksecrets do
    system "cd mksecrets && docker build -t mksecrets ."
  end

  desc "Build awscli image"
  task :awscli do
    system "cd awscli && docker build -t awscli ."
  end

end

require 'rspec/core/rake_task'

task :spec => ["spec:bosh-init", "spec:spruce", "spec:curl_ssl"]
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

  desc "Run all specs for curl-ssl"
  RSpec::Core::RakeTask.new("curl_ssl") do |t|
    t.pattern = "spec/curl-ssl/**/*_spec.rb"
  end

  desc "Run all specs for mksecrets"
  RSpec::Core::RakeTask.new("mksecrets") do |t|
    t.pattern = "spec/mksecrets/**/*_spec.rb"
  end

  desc "Run all specs for awscli"
  RSpec::Core::RakeTask.new("awscli") do |t|
    t.pattern = "spec/awscli/**/*_spec.rb"
  end
end
