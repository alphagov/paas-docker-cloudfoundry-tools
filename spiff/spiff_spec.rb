require 'spec_helper'
require 'docker'
require 'serverspec'

SPIFF_BIN = "/usr/local/bin/spiff"
SPIFF_VERSION = "1.0.8"
ALPINE_VERSION = "3.4"

describe "spiff image" do
  before(:all) {
    set :docker_image, find_image_id('spiff:latest')
  }

  it "installs the right version of Alpine Linux" do
    expect(os_version).to include("Alpine Linux #{ALPINE_VERSION}")
  end

  def os_version
    command("cat /etc/issue | head -1").stdout
  end

  it "checks if spiff binary exists and is a file" do
    expect(file(SPIFF_BIN)).to be_file
  end

  it "checks if spiff binary is executable" do
    expect(file(SPIFF_BIN)).to be_mode 755
  end

  it "has the spiff version #{SPIFF_VERSION}" do
    expect(spiff_version).to match(/spiff version #{SPIFF_VERSION}( \(master\))?/)
  end

  def spiff_version
    command("spiff --version").stdout.strip
  end
end
