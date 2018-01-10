require 'spec_helper'
require 'docker'
require 'serverspec'

describe "Terraform image" do
  before(:all) {
    set :docker_image, find_image_id('terraform:latest')
    @terraform_version_output = command("terraform version").stdout
  }

  it "installs Alpine" do
    expect(command("cat /etc/issue | head -1").stdout).to include("Alpine Linux")
  end

  it "installs Root Certificates" do
    expect(file("/usr/share/ca-certificates/mozilla/GlobalSign_Root_CA.crt")).to be_file
  end

  it "has the expected Terraform version" do
    expect(@terraform_version_output).to include("Terraform v0.11.2")
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

  context "providers checks" do

    it "has the cloudflare provider" do
      expect(@terraform_version_output).to include("provider.cloudflare v0.1.0")
    end

    it "has the local provider" do
      expect(@terraform_version_output).to include("provider.local v1.0.0")
    end

    it "has the openstack provider" do
      expect(@terraform_version_output).to include("provider.openstack v1.1.0")
    end

    it "has the powerdns provider" do
      expect(@terraform_version_output).to include("provider.powerdns v0.1.0")
    end

    it "has the credhub provider" do
      expect(@terraform_version_output).to include("provider.credhub v0.10.0")
    end

    it "has the cloudfoundry provider" do
      expect(@terraform_version_output).to include("provider.cloudfoundry v0.9.1")
    end

    it "has enough providers" do
      expect(@terraform_version_output.scan('provider.').length).to eq(6)
    end

  end

end
