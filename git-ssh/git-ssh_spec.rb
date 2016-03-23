require 'spec_helper'
require 'docker'
require 'serverspec'

PACKAGES = "git openssh-client ca-certificates gnupg"
GIT_VERSION = "2.6.4"
OPENSSH_VERSION = "7.2p2"

describe "image" do
  before(:all) {
    set :docker_image, find_image_id('git-ssh:latest')
  }

  it "installs Alpine" do
    expect(command("cat /etc/issue | head -1").stdout).to include("Alpine Linux")
  end

  it "installs required packages" do
    PACKAGES.split(' ').each do |package|
      expect(command("apk -vv info | grep #{package}").exit_status).to eq(0)
    end
  end

  it "can run git" do
    expect(command('git --version').exit_status).to eq(0)
  end

  it "can run ssh" do
    expect(command('ssh -V').exit_status).to eq(0)
  end

end
