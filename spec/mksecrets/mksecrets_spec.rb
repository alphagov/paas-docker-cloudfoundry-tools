require 'spec_helper'
require 'docker'
require 'serverspec'

MKSECRETS_PACKAGES = "pwgen"
MKPASSWD_BIN = "/usr/bin/mkpasswd"

describe "mksecrets image" do
  before(:all) {
    set :docker_image, find_image_id('mksecrets:latest')
  }

  it "installs the right version of Alpine" do
    expect(os_version).to include("Alpine Linux 3.3")
  end

  def os_version
    command("cat /etc/issue | head -1").stdout
  end

  it "installs required packages" do
    MKSECRETS_PACKAGES.split(' ').each do |package|
      expect(command("apk -vv info | grep #{package}").exit_status).to eq(0)
    end
  end

  it "can run mkpasswd" do
    expect(command('echo mysecret | mkpasswd').exit_status).to eq(0)
  end

end
