dockerfiles = Dir.glob(File.join("*", "Dockerfile"))
containers = dockerfiles.map { |f| File.dirname(f) }

namespace :build do |ns|
  containers.each { |container|
    desc "Build #{container} image"
    task container.to_sym do
      system "cd #{container} && docker build -t #{container} ."
    end
  }
  desc "Build all containers"
  task :all do
    ns.tasks.each { |t| t.invoke }
  end
end

namespace :spec do |ns|
  require 'rspec/core/rake_task'

  containers.each { |container|
    spec_pattern = File.join("spec", container, "**", "*_spec.rb")
    if Dir.glob(spec_pattern).any?
      desc "Run all specs for #{container}"
      RSpec::Core::RakeTask.new(container) do |t|
        t.pattern = spec_pattern
      end
    end
  }
  desc "Run all containers spec"
  task :all do
    ns.tasks.each { |t| t.invoke }
  end
end

task :default => "spec:all"
