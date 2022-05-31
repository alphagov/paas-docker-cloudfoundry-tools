require 'spec_helper'
require 'docker'
require 'serverspec'

SPRUCE_BIN = "/usr/local/bin/spruce"
SPRUCE_VERSION = "1.27.0"
ALPINE_VERSION = "3.13"

describe "spruce image" do
  before(:all) {
    set :docker_image, find_image_id(ENV['DOCKER_IMAGE'])
  }

  it "installs the right version of Alpine Linux" do
    expect(os_version).to include("Alpine Linux #{ALPINE_VERSION}")
  end

  def os_version
    command("cat /etc/issue | head -1").stdout
  end

  it "checks if spruce binary exists and is a file" do
    expect(file(SPRUCE_BIN)).to be_file
  end

  it "checks if spruce binary is executable" do
    expect(file(SPRUCE_BIN)).to be_mode 755
  end

  it "has the spruce version #{SPRUCE_VERSION}" do
    expect(spruce_version).to match(/spruce - Version #{SPRUCE_VERSION}( \(master\))?/)
  end

  def spruce_version
    command("spruce --version").stdout.strip
  end
end
