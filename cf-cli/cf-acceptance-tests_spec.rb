require 'spec_helper'
require 'docker'
require 'serverspec'

CF_CLI_VERSION="6.16.1"

describe "cf-cli image" do
  before(:all) {
    set :docker_image, find_image_id('cf-cli:latest')
  }

  it "has the expected version of the CF CLI" do
    expect(
      command("cf --version").stdout
    ).to match(/cf version #{CF_CLI_VERSION}/)
  end

  it "has curl available" do
    expect(
      command("curl --version").exit_status
    ).to eq(0)
  end

  it "has unzip available" do
    expect(
      command("unzip -v").exit_status
    ).to eq(0)
  end

  it "has git available" do
    expect(
      command("git --version").exit_status
    ).to eq(0)
  end
end
