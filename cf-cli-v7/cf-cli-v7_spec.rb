require 'spec_helper'
require 'docker'
require 'serverspec'

CF_CLI_VERSION="7.0.0-beta.25"
SPRUCE_BIN = "/usr/local/bin/spruce"
SPRUCE_VERSION = "1.22.0"

describe "cf-cli-v7 image" do
  before(:all) {
    set :docker_image, find_image_id('cf-cli-v7:latest')
  }

  it "has the expected version of the CF CLI" do
    expect(
      command("cf --version").stdout
    ).to match(/cf version #{CF_CLI_VERSION}/)
  end

  it "has the CF CLI available with the alias cf7" do
    expect(
      command("cf7 --version").stdout
    ).to match(/cf7 version #{CF_CLI_VERSION}/)
  end

  it "has conduit plugin available" do
    cmd = command("cf conduit --help")
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
  end

  it "has ruby 2.7 available" do
    cmd = command("ruby -v")
    expect(cmd.exit_status).to eq(0)
    expect(cmd.stdout).to match(/^ruby 2.7/)
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

  it "has `envsubst` available" do
    expect(
      command("envsubst --help").exit_status
    ).to eq(0)
  end
end
