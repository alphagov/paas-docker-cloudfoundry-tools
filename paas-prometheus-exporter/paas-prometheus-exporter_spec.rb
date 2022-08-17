require 'spec_helper'
require 'docker'
require 'serverspec'

describe "paas-prometheus-exporter" do
  before(:all) {
    set :docker_image, find_image_id(ENV['DOCKER_IMAGE'])
  }

  let(:version) { '0.0.4' }

  it "has the exporter in the $PATH" do
    cmd = command("paas-prometheus-exporter --help")
    expect(cmd.exit_status).to eq(0)
  end

  it "has the correct version installed" do
    cmd = command("cat /opt/paas-prometheus-exporter.version")
    expect(cmd.stdout.chomp).to eq(version)
  end
end
