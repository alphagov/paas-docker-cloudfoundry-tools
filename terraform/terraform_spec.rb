require 'spec_helper'
require 'docker'
require 'serverspec'

describe "Terraform image" do
  before(:all) {
    set :docker_image, find_image_id('terraform:latest')
    @providers_count = 0
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
    ).to include("Terraform v0.10.2")
  end

  it "installs SSH" do
    expect(
      command("ssh -V").stderr.strip
    ).to include("OpenSSH")
  end

  it "should not have binary directory larger than 200M" do
    expect(
      Integer(command("du -m /usr/local/bin").stdout.split.first)
    ).to be < 200
  end

  context "providers checks" do
    let(:terraform_shared_dir) { File.join('', 'root','.terraform.d','providers','linux_amd64') }
    # minus 2 to exclude . and ..
    let(:expected_terraform_providers_count) { Dir.entries(terraform_shared_dir).length-2 }

    it "has the terraform provider" do
      expect(file(File.join(terraform_shared_dir,'terraform-provider-terraform_v1.0.2_x4'))).to be_file
      @providers_count += 1
    end

    it "has the cloudflare provider" do
      expect(file(File.join(terraform_shared_dir,'terraform-provider-cloudflare_v0.1.0_x4'))).to be_file
      @providers_count += 1
    end

    it "has the local provider" do
      expect(file(File.join(terraform_shared_dir,'terraform-provider-local_v1.0.0_x4'))).to be_file
      @providers_count += 1
    end

    it "has the openstack provider" do
      expect(file(File.join(terraform_shared_dir,'terraform-provider-openstack_v1.1.0_x4'))).to be_file
      @providers_count += 1
    end

    it "has the powerdns provider" do
      expect(file(File.join(terraform_shared_dir,'terraform-provider-powerdns_v0.1.0_x4'))).to be_file
      @providers_count += 1
    end

    it "has the credhub provider" do
      expect(file(File.join(terraform_shared_dir,'terraform-provider-credhub_0.10_linux_amd64'))).to be_file
      @providers_count += 1
    end

    it "has the cloudfoundry provider" do
      expect(file(File.join(terraform_shared_dir,'terraform-provider-cloudfoundry_0.10_linux_amd64'))).to be_file
      @providers_count += 1
    end

    it "has enough providers" do
      expect(@providers_count).to eq(expected_terraform_providers_count)
    end

  end

end
