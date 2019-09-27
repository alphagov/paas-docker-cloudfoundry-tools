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
    ).to match("Terraform v0.11.1$")
  end

  it "installs SSH" do
    expect(
      command("ssh -V").stderr.strip
    ).to include("OpenSSH")
  end

  it "has the plugins already downloaded" do
    expect(
      command("cd /tmp && terraform init").stdout.strip
    ).to_not include("Downloading")
  end

  it "disables interactive Terraform use" do
    expect(
      command("printenv TF_INPUT").stdout.strip
    ).to eq("0")
  end
end
