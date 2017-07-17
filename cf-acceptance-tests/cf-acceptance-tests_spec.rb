require 'spec_helper'
require 'docker'
require 'serverspec'

GO_VERSION="1.8.3"
CF_CLI_VERSION="6.26.0"

describe "cf-acceptance-tests image" do
  before(:all) {
    set :docker_image, find_image_id('cf-acceptance-tests:latest')
  }

  it "has the expected version of Go" do
    expect(
      command("go version").stdout
    ).to match(/go version go#{GO_VERSION}/)
  end

  it "has godep available" do
    expect(
      command("godep version").exit_status
    ).to eq(0)

  end

  it "has Ginkgo available" do
    expect(
      command("ginkgo version").exit_status
    ).to eq(0)

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

  it "has unzip available" do
    # Needed by the cf acceptance-test helpers
    expect(
      command("unzip -v").exit_status
    ).to eq(0)
  end
end
