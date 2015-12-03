require 'spec_helper'

describe "Terraform image" do
before(:all) do
    @image = Docker::Image.all().detect{|i| i.info['RepoTags'].include? 'terraform:latest' }
    set :docker_image, @image.id
end
    
    it "should be availble" do
        expect(@image).to_not be_nil
    end

    it "installs the right version of Ubuntu" do
        expect(os_version).to include("Ubuntu 14")
    end

    def os_version
        command("lsb_release -a").stdout
    end

    it "installs openssh-client" do
        expect(package("openssh-client")).to be_installed
    end

    it "checks if terraform binary is executable" do
         expect(file("/usr/local/bin/terraform")).to be_mode 775
    end

    it "has the Terraform version 0.6.8" do
        expect(terraform_version).to include("Terraform v0.6.8")
    end

    def terraform_version
        command("terraform version").stdout.strip
    end
end
