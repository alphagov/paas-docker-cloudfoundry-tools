require 'spec_helper'
require 'docker'
require 'serverspec'

GO_VERSION="1.5.3"
CF_CLI_VERSION="6.15.0"

describe "cf-cli image" do
  before(:all) {
    set :docker_image, find_image_id('cf-cli:latest')
  }

  it "has the expected version of Go" do
    expect(
      command("go version").stdout
    ).to match(/go version go#{GO_VERSION}/)
  end

  it "has the expected version of the CF CLI" do
    expect(
      command("cf --version").stdout
    ).to match(/cf version #{CF_CLI_VERSION}/)
  end

  it "has curl available" do
    # Needed by the cf acceptance-test helpers
    expect(
      command("curl --version").exit_status
    ).to eq(0)
  end
end
