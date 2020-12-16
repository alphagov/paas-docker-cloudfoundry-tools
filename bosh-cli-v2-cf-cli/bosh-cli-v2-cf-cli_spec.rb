require 'spec_helper'
require 'docker'
require 'serverspec'

BOSH_CLI_VERSION="6.4.1-35ce8438-2020-10-20T16:04:13Z"
CREDHUB_VERSION='2.8.0'
CF_CLI_VERSION="7.2.0"
SPRUCE_BIN = "/usr/local/bin/spruce"
SPRUCE_VERSION = "1.27.0"
BOSH_ENV_DEPS = "build-essential zlibc zlib1g-dev openssl libxslt1-dev libxml2-dev \
    libssl-dev libreadline7 libreadline-dev libyaml-dev libsqlite3-dev sqlite3"
CF_ENV_DEPS = "unzip curl openssl ca-certificates git libc6 bash jq gettext make"

describe "bosh-cli-v2-cf-cli image" do
  before(:all) {
    set :docker_image, find_image_id('bosh-cli-v2-cf-cli:latest')
  }

  it "installs required bosh packages" do
    BOSH_ENV_DEPS.split(' ').each do |package|
      expect(package(package)).to be_installed
    end
  end

  it "installs required cf packages" do
    CF_ENV_DEPS.split(' ').each do |package|
      expect(package(package)).to be_installed
    end
  end

  it "has the expected version of the Bosh CLI" do
    expect(
        command("bosh -v").stdout.strip
    ).to eq("version #{BOSH_CLI_VERSION}")
  end

  it "has the expected version of the CF CLI (#{CF_CLI_VERSION})" do
    expect(
      command("cf --version").stdout
    ).to match(/cf version #{CF_CLI_VERSION}/)
  end

  it "has curl available" do
    expect(
      command("curl --version").exit_status
    ).to eq(0)
  end

  it "has make available" do
    expect(
      command("make --version").exit_status
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

  it "has `jq` available" do
    expect(
      command("jq --help").exit_status
    ).to eq(0)
  end
end
