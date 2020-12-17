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
    expect(@terraform_version_output).to match("Terraform v0.11.14$")
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
    let(:expected_plugin_error_message) { "This binary is a plugin. These are not meant to be executed directly.\nPlease execute the program that consumes these plugins, which will\nload any plugins automatically" }

    it "validates provider binaries execution" do
      provider_binaries=command("cd /.terraform/plugins/linux_amd64; ls terraform-provider-*").stdout.strip
      provider_binaries.each_line do |provider|
        provider_execution= command("cd /.terraform/plugins/linux_amd64;./#{provider}").stderr.strip
        expect(provider_execution).to eq(expected_plugin_error_message)
      end
    end

    it "has the cloudflare provider" do
      expect(@terraform_version_output).to include("provider.cloudflare v1.7.0")
    end

    it "has the local provider" do
      expect(@terraform_version_output).to include("provider.local v1.4.0")
    end

    it "has the openstack provider" do
      expect(@terraform_version_output).to include("provider.openstack v1.25.0")
    end

    it "has the cloudstack provider" do
      expect(@terraform_version_output).to include("provider.cloudstack v0.3.0")
    end

    it "has the powerdns provider" do
      expect(@terraform_version_output).to include("provider.powerdns v1.3.0")
    end

    it "has the credhub provider" do
      expect(@terraform_version_output).to include("provider.credhub v0.13.0")
    end

    it "has the cloudfoundry provider" do
      expect(@terraform_version_output).to include("provider.cloudfoundry v0.11.2")
    end

    it "has the kubernetes provider" do
      expect(@terraform_version_output).to include("provider.kubernetes v1.11.4")
    end

    it "has the uaa provider" do
      expect(@terraform_version_output).to include("provider.uaa v0.9")
    end

    it "has the flexibleengine provider" do
      expect(@terraform_version_output).to include("provider.flexibleengine v1.11.1")
    end

    it "has enough providers" do
      EXPECTED_PROVIDER_COUNT = 17
      expect(@terraform_version_output.scan('provider.').length).to eq(EXPECTED_PROVIDER_COUNT)
    end
  end
end
