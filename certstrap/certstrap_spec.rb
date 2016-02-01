require 'spec_helper'
require 'docker'
require 'serverspec'

CERTSTRAP_BIN = "/usr/local/bin/certstrap"
CERTSTRAP_VERSION = "0.1.0"
CERTSTRAP_PACKAGES = "openssl"

describe "certstrap image" do
  before(:all) {
    set :docker_image, find_image_id('certstrap:latest')
  }

  it "installs the right version of Alpine Linux" do
    expect(os_version).to include("Alpine Linux 3.3")
  end

  def os_version
    command("cat /etc/issue | head -1").stdout
  end

  it "checks if certstrap binary exists and is a file" do
    expect(file(CERTSTRAP_BIN)).to be_file
  end

  it "checks if certstrap binary is executable" do
    expect(file(CERTSTRAP_BIN)).to be_mode 755
  end

  it "has the certstrap version #{CERTSTRAP_VERSION}" do
    expect(certstrap_version).to match(/certstrap version #{CERTSTRAP_VERSION}/)
  end

  def certstrap_version
    command("certstrap --version").stdout.strip
  end

  it "installs required packages" do
    CERTSTRAP_PACKAGES.split(' ').each do |package|
      expect(command("apk -vv info | grep #{package}").exit_status).to eq(0)
    end
  end
end
