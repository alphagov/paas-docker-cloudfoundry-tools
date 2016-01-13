require 'spec_helper'
require 'docker'
require 'serverspec'

describe "bosh-init image" do
  before(:all) {
    set :docker_image, find_image_id('bosh-init:latest')
  }

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

  it "contains the compiled CPI packages" do
    installation_path = '/root/.bosh_init/installations/44f01911-a47a-4a24-6ca3-a3109b33f058'
    packages_file = file("#{installation_path}/compiled_packages.json")
    expect(packages_file).to exist
    compiled_packages = JSON.parse(packages_file.content)
    compiled_packages.each do |package|
      expect(file("#{installation_path}/blobs/#{package["Value"]["BlobID"]}")).to exist
    end

    cpi_package = compiled_packages.find {|p| p["Key"]["PackageName"] == "bosh_aws_cpi" }
    expect(cpi_package).to be

    expect(file("#{installation_path}/packages/bosh_aws_cpi/bin/aws_cpi")).to be_executable
  end

  def bosh_init_version
    command("bosh-init --version").stdout.strip
  end
end
