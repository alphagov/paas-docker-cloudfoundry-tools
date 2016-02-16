require 'spec_helper'
require 'docker'
require 'serverspec'

BOSH_CLI_VERSION="1.3192.0"

describe "bosh-cli image" do
  before(:all) {
    set :docker_image, find_image_id('bosh-cli:latest')
  }

  it "has the expected version of the Bosh CLI" do
    expect(
      command("bosh --version").stdout.strip
    ).to eq("BOSH #{BOSH_CLI_VERSION}")
  end

  it "has ssh available" do
    expect(
      command("ssh -V").exit_status
    ).to eq(0)
  end
end
