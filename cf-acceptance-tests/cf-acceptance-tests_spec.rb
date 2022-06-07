require 'spec_helper'
require 'docker'
require 'serverspec'

GO_VERSION="1.17"
CF_CLI_VERSION="7.4.0"
LOG_CACHE_CLI_VERSION="2.1.0"

describe "cf-acceptance-tests image" do
  before(:all) {
    set :docker_image, find_image_id(ENV['DOCKER_IMAGE'])
  }

  it "has the expected version of Go" do
    expect(
      command("go version").stdout
    ).to match(/go version go#{GO_VERSION}/)
  end

  it "has Ginkgo available" do
    expect(
      command("ginkgo version").exit_status
    ).to eq(0)
  end

  %w[git bzr fossil hg svn].each do |version_control_tool|
    it "has #{version_control_tool} available" do
      arg = version_control_tool == 'svn' ? '--version' : 'version'
      expect(
        command("#{version_control_tool} #{arg}").exit_status
      ).to eq(0)
    end
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

  it "has jq available" do
    expect(
      command("jq --version").exit_status
    ).to eq(0)
  end

  it "has the CF_PLUGIN_HOME variable set" do
    expect(
      command("env").stdout
    ).to match(/^CF_PLUGIN_HOME=\/root/)
  end

  it "has the log-cache plugin" do
    # Needed by the cf acceptance-test with log-cache mode
    plugins_output = command("cf plugins").stdout
    expect(plugins_output).to match(/^log-cache +#{LOG_CACHE_CLI_VERSION} +log-meta/)
    expect(plugins_output).to match(/^log-cache +#{LOG_CACHE_CLI_VERSION} +tail /)

    cf_tail_help = command("cf tail -h").stdout
    expect(cf_tail_help).to match(/envelope-class/)
  end

  it "has AWS CLI available" do
    expect(
      command("aws --version").exit_status
    ).to eq(0)
  end

end
