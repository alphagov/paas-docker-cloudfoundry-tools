require 'spec_helper'
require 'docker'
require 'serverspec'

describe "Terraform image" do
  before(:all) {
    set :docker_image, find_image_id('terraform:latest')
  }

  it "installs Alpine" do
    expect(command("cat /etc/issue | head -1").stdout).to include("Alpine Linux")
  end

  it "installs Root Certificates" do
    expect(file("/usr/share/ca-certificates/mozilla/GlobalSign_Root_CA.crt")).to be_file
  end

  it "has the expected Terraform version" do
    expect(
      command("terraform version").stdout
    ).to include("Terraform v0.7.10")
  end

  it "installs SSH" do
    expect(
      command("ssh -V").stderr.strip
    ).to include("OpenSSH")
  end

  it "installs dogapi gem v1.24.0" do
    expect(
      command("gem list").stdout.strip
    ).to include("dogapi (1.24.0)")  
  end

  it "should not have binary directory larger than 200M" do
    expect(
      Integer(command("du -m /usr/local/bin").stdout.split.first)
    ).to be < 200
  end
end
