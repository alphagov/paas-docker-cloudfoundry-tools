require 'spec_helper'

describe "Terraform image" do
before(:all) do
    @image = Docker::Image.all().detect{|i| i.info['RepoTags'].include? 'terraform:latest' }
    set :docker_image, @image.id
end
    
    it "should be availble" do
        expect(@image).to_not be_nil
    end

    it "installs the Alpine linux" do
         expect(file("/etc/alpine-release")).to be_file
    end

    it "installs Root Certificates" do
         expect(file("/usr/share/ca-certificates/mozilla/GlobalSign_Root_CA.crt")).to be_file
    end

    it "checks if terraform binary is executable" do
         expect(file("/usr/local/bin/terraform")).to be_mode 755
    end

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
end
