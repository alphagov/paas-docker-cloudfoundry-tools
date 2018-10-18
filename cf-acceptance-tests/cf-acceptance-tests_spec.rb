require 'spec_helper'
require 'docker'
require 'serverspec'

GO_VERSION="1.9"
CF_CLI_VERSION="6.39.1"
LOG_CACHE_CLI_VERSION="1.1.0"

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

  it "has the CF_PLUGIN_HOME variable set" do
    expect(
      command("env").stdout
    ).to match(/^CF_PLUGIN_HOME=\/root/)
  end

  it "has the network-policy plugin" do
    # Needed by the cf acceptance-test suite network polices
    plugins_output = command("cf plugins").stdout

    expect(plugins_output).to match(/^network-policy +[^ ]+ +allow-access /)
    expect(plugins_output).to match(/^network-policy +[^ ]+ +deny-access /)
    expect(plugins_output).to match(/^network-policy +[^ ]+ +list-access /)
    expect(plugins_output).to match(/^network-policy +[^ ]+ +remove-access /)
  end

  it "has the log-cache plugin" do
    # Needed by the cf acceptance-test with log-cache mode
    plugins_output = command("cf plugins").stdout
    expect(plugins_output).to match(/^log-cache +#{LOG_CACHE_CLI_VERSION} +log-meta/)
    expect(plugins_output).to match(/^log-cache +#{LOG_CACHE_CLI_VERSION} +tail /)
  end
end
