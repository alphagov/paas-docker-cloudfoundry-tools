require 'spec_helper'
require 'docker'
require 'serverspec'

PACKAGES = "git openssh-client ca-certificates gnupg"
GIT_VERSION = "2.6.4"
OPENSSH_VERSION = "7.2p2"

describe "image" do
  before(:all) {
    set :docker_image, find_image_id(ENV['DOCKER_IMAGE'])
  }

  it "installs Alpine" do
    expect(command("cat /etc/issue | head -1").stdout).to include("Alpine Linux")
  end

  it "installs required packages" do
    PACKAGES.split(' ').each do |package|
      expect(command("apk -vv info | grep #{package}").exit_status).to eq(0)
    end
  end

  it "can run git" do
    expect(command('git --version').exit_status).to eq(0)
  end

  it "can run curl" do
    expect(command('curl --version').exit_status).to eq(0)
  end

  it "can run openssl" do
    expect(command('openssl version').exit_status).to eq(0)
  end

  it "has ca-certificates installed" do
    expect(command('apk list ca-certificates').stdout).to contain('installed')
  end

  it "can run ssh" do
    expect(command('ssh -V').exit_status).to eq(0)
  end

  it "can run bash" do
    expect(command('bash --version').exit_status).to eq(0)
  end

  it "/root/.ssh exists" do
    expect(file('/root/.ssh')).to be_directory
  end

  it "/root/.gitconfig contains user and email" do
    expect(file('/root/.gitconfig')).to contain 'name ='
    expect(file('/root/.gitconfig')).to contain 'email ='
  end
end
