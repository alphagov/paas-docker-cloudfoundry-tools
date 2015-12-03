require 'spec_helper'
require 'docker'
require 'serverspec'

describe "bosh-init image" do
  before(:all) {
    @image = Docker::Image.all().detect{|i| i.info['RepoTags'].include? 'bosh-init:latest' }
    set :docker_image, @image.id
  }

  it "should be availble" do
    expect(@image).to_not be_nil
  end

  it "installs the right version of Ubuntu" do
    expect(os_version).to include("Ubuntu 14")
  end

  def os_version
    command("lsb_release -a").stdout
  end

  it "installs required packages" do
    BOSH_INIT_PACKAGES.split(' ').each do |package|
      expect(package(package)).to be_installed
    end
  end

  it "checks if bosh-init binary exists and is a file" do
    expect(file(BOSH_INIT_BIN)).to be_file
  end

  it "checks if bosh-init binary is executable" do
    expect(file(BOSH_INIT_BIN)).to be_mode 755
  end

  it "has the bosh-init version #{BOSH_INIT_VERSION}" do
    expect(bosh_init_version).to eq("version #{BOSH_INIT_VERSION}")
  end

  def bosh_init_version
    command("bosh-init --version").stdout.strip
  end
end
