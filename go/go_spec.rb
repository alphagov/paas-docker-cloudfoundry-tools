require 'spec_helper'
require 'docker'
require 'serverspec'

GO_VERSION="1.9"

describe "go" do
  before(:all) {
    set :docker_image, find_image_id('go:latest')
  }

  it "has the expected version of Go" do
    expect(
      command("go version").stdout
    ).to match(/go version go#{GO_VERSION}/)
  end

  it "has dep available" do
    expect(
      command("dep version").exit_status
    ).to eq(0)

  end

  it "has Ginkgo available" do
    expect(
      command("ginkgo version").exit_status
    ).to eq(0)

  end
end
