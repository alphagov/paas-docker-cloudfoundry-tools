require 'spec_helper'
require 'docker'
require 'serverspec'

describe "paas-prometheus-exporter" do
  before(:all) {
    set :docker_image, find_image_id('paas-prometheus-exporter:latest')
  }

  let(:version) { '0.0.4' }

  it "has the exporter in the $PATH" do
    cmd = command("paas-prometheus-exporter --help")
    expect(cmd.exit_status).to eq(0)
  end

  it "has the correct version installed" do
    cmd = command(
      %(grep -q 'version[^=]*= "#{version}"' \
             /go/src/github.com/alphagov/paas-prometheus-exporter/main.go)
    )
    expect(cmd.exit_status).to eq(0)
  end
end
