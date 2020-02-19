require 'spec_helper'
require 'docker'
require 'serverspec'

BOSH_CLI_VERSION="5.5.1-7850ac98-2019-05-21T22:28:36Z"
CREDHUB_VERSION='2.5.3'
CF_CLI_VERSION="6.46.1"
SPRUCE_BIN = "/usr/local/bin/spruce"
SPRUCE_VERSION = "1.17.0"


BOSH_ENV_DEPS = "build-essential zlibc zlib1g-dev openssl libxslt1-dev libxml2-dev \
    libssl-dev libreadline7 libreadline-dev libyaml-dev libsqlite3-dev sqlite3"

describe "bosh-cli-v2-cf-cli image" do
  before(:all) {
    set :docker_image, find_image_id('bosh-cli-v2-cf-cli:latest')
  }

  it "installs required packages" do
    BOSH_ENV_DEPS.split(' ').each do |package|
      expect(package(package)).to be_installed
    end
  end

  it "has the expected version of the Bosh CLI" do
    expect(
      command("bosh -v").stdout.strip
    ).to eq("version #{BOSH_CLI_VERSION}")
  end

  it "has `file` available" do
    expect(
      command("file --version").exit_status
    ).to eq(0)
  end

  it "has ssh available" do
    expect(
      command("ssh -V").exit_status
    ).to eq(0)
  end

  it "can run git" do
    expect(command('git --version').exit_status).to eq(0)
  end

  it "can run credhub" do
    cmd = command('credhub --version')
    expect(cmd.exit_status).to eq(0)
    expect(cmd.stdout.match?(/#{CREDHUB_VERSION}/)).to eq(true)
  end

  it "has `bash` available" do
    expect(
      command("bash --version").exit_status
    ).to eq(0)
  end

  it "has a new enough version of openssl available" do
    # wget (from busybox) requires openssl to be able to connect to https sites.

    # See https://github.com/nahi/httpclient/blob/v2.7.1/lib/httpclient/ssl_config.rb#L441-L452
    # (httpclient is a dependency of bosh_cli)
    # With an older version of openssl, bosh_cli spits out warnings.
    cmd = command("openssl version")
    expect(cmd.exit_status).to eq(0)

    ssl_version_str = cmd.stdout.strip
    if ssl_version_str.start_with?('OpenSSL 1.0.1')
      expect(ssl_version_str).to be >= 'OpenSSL 1.0.1p'
    else
      expect(ssl_version_str).to be >= 'OpenSSL 1.0.2d'
    end
  end

  it "has ruby 2.6 available" do
    cmd = command("ruby -v")
    expect(cmd.exit_status).to eq(0)
    expect(cmd.stdout).to match(/^ruby 2.6/)
  end

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

  it "has ruby 2.6 available" do
    cmd = command("ruby -v")
    expect(cmd.exit_status).to eq(0)
    expect(cmd.stdout).to match(/^ruby 2.6/)
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
