require 'spec_helper'
require 'docker'
require 'serverspec'

CERTSTRAP_BIN = "/usr/local/bin/certstrap"
CERTSTRAP_VERSION = "1.2.0"
CERTSTRAP_PACKAGES = "openssl curl"

describe "certstrap image" do
  before(:all) {
    set :docker_image, find_image_id(ENV['DOCKER_IMAGE'])
  }

  it "installs the right version of Ubuntu Linux" do
    expect(os_version).to include("Ubuntu 20.04")
    expect(os_version).to include("LTS")
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
      expect(command("dpkg --get-selections | grep #{package}").exit_status).to eq(0)
    end
  end
end
