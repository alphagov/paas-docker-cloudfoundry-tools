require 'spec_helper'
require 'docker'
require 'serverspec'

describe "awscli image" do
  before(:all) {
    set :docker_image, find_image_id('awscli:latest')
  }

  it "installs the right version of Alpine Linux" do
    expect(os_version).to include("Alpine Linux 3.3")
  end

  def os_version
    command("cat /etc/issue | head -1").stdout
  end

  it "checks if 'aws' binary exists and is a file" do
    expect(file(AWSCLI_BIN)).to be_file
  end

  it "checks if 'aws' binary is executable" do
    expect(file(AWSCLI_BIN)).to be_mode 755
  end

  it "has the 'aws' version #{AWSCLI_VERSION}" do
    expect(awscli_version).to match(/aws-cli\/#{AWSCLI_VERSION} /)
  end

  def awscli_version
    command("aws --version").stderr.strip
  end
end
