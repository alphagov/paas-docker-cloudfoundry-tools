require 'spec_helper'
require 'docker'
require 'serverspec'

REQUIRED_BINARIES = %w{
  terraform
  terraform-provider-aws
  terraform-provider-null
  terraform-provider-template
  terraform-provider-tls
  terraform-provider-postgresql
  terraform-provisioner-file
  terraform-provisioner-local-exec
  terraform-provisioner-remote-exec
}

describe "Terraform image" do
  before(:all) {
    set :docker_image, find_image_id('terraform:latest')
  }

  it "installs the Alpine linux" do
    expect(file("/etc/alpine-release")).to be_file
  end

  it "installs Root Certificates" do
    expect(file("/usr/share/ca-certificates/mozilla/GlobalSign_Root_CA.crt")).to be_file
  end

  it "checks if terraform binary is executable" do
    expect(file("/usr/local/bin/terraform")).to be_mode 755
  end

  it "installs all the whitelisted binaries" do
    command("echo $BINARY_WHITELIST").stdout.split.each { |f|
      expect(file("/usr/local/bin/#{f}")).to be_mode 755
    }
  end

  REQUIRED_BINARIES.each { |binary|
    it "required binary '#{binary}' is in path and executable" do
      command_path = command("which #{binary}").stdout.strip
      expect(command_path).not_to be_empty
      expect(file(command_path)).to be_mode 755
    end
  }

  it "has the Terraform version 0.6.10" do
    expect(terraform_version).to include("Terraform v0.6.10")
  end

  def terraform_version
    command("terraform version").stdout.strip
  end

  it "installs SSH" do
    expect(ssh_version).to include("OpenSSH")
  end

  def ssh_version
    command("ssh -V").stderr.strip
  end

  it "should not have binary directory larger than 200M" do
    expect(binaries_size).to be < 200
  end

  def binaries_size
    Integer(command("du -m /usr/local/bin").stdout.split.first)
  end
end
