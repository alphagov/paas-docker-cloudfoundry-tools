require 'spec_helper'
require 'docker'
require 'serverspec'

PACKAGES = "git openssh-client ca-certificates"
GIT_VERSION = "2.6.4"
OPENSSH_VERSION = "7.1p2"

describe "image" do
  before(:all) {
    set :docker_image, find_image_id('git-ssh:latest')
  }

  it "installs the right version of Alpine" do
    expect(os_version).to include("Alpine Linux 3.3")
  end

  def os_version
    command("cat /etc/issue | head -1").stdout
  end

  it "installs required packages" do
    PACKAGES.split(' ').each do |package|
      expect(command("apk -vv info | grep #{package}").exit_status).to eq(0)
    end
  end

  it "can run git" do
    expect(command('git --version').exit_status).to eq(0)
  end

  it "has the right git version" do
    expect(command("git --version").stdout.strip).to include(GIT_VERSION)
  end

  it "can run ssh" do
    expect(command('ssh -V').exit_status).to eq(0)
  end

  it "has the right ssh version" do
    expect(command("ssh -V").stderr.strip).to include(OPENSSH_VERSION)
  end

end
