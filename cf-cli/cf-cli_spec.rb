require 'spec_helper'
require 'docker'
require 'serverspec'

CF_CLI_VERSION="6.39.1"
SPRUCE_BIN = "/usr/local/bin/spruce"
SPRUCE_VERSION = "1.17.0"

describe "cf-cli image" do
  before(:all) {
    set :docker_image, find_image_id('cf-cli:latest')
  }

  it "has the expected version of the CF CLI" do
    expect(
      command("cf --version").stdout
    ).to match(/cf version #{CF_CLI_VERSION}/)
  end

  it "has blue-green-deploy plugin available" do
    cmd = command("cf blue-green-deploy --help")
    expect(cmd.exit_status).to eq(0)
  end

  it "has autopilot plugin available" do
    cmd = command("cf zero-downtime-push --help")
    expect(cmd.exit_status).to eq(0)
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

  it "has jq available" do
    cmd = command("jq --version")
    expect(cmd.exit_status).to eq(0)
    expect(cmd.stdout).to match(/^jq-1.5/)
  end

  it "has ruby 2.5 available" do
    cmd = command("ruby -v")
    expect(cmd.exit_status).to eq(0)
    expect(cmd.stdout).to match(/^ruby 2.5/)
  end

  it "has ruby json gem available" do
    cmd = command("ruby -e 'require \"json\"'")
    expect(cmd.exit_status).to eq(0)
  end

  it "has ruby yaml gem available" do
    cmd = command("ruby -e 'require \"yaml\"'")
    expect(cmd.exit_status).to eq(0)
  end

  it "checks if spruce binary exists and is a file" do
    expect(file(SPRUCE_BIN)).to be_file
  end

  it "checks if spruce binary is executable" do
    expect(file(SPRUCE_BIN)).to be_mode 755
  end

  it "has the spruce version #{SPRUCE_VERSION}" do
    spruce_version = command("spruce --version").stdout.strip
    expect(spruce_version).to match(/spruce - Version #{SPRUCE_VERSION}( \(master\))?/)
  end

  it "has `bash` available" do
    expect(
      command("bash --version").exit_status
    ).to eq(0)
  end
end
