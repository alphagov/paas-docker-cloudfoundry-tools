require 'spec_helper'
require 'docker'
require 'serverspec'

describe "bosh-init image" do
  before(:all) {
    @image = Docker::Image.all().detect{|i| i.info['RepoTags'].include? 'curl-ssl:latest' }
    set :docker_image, @image.id
  }

  it "should be available" do
    expect(@image).to_not be_nil
  end

  it "installs the right version of Alpine" do
    expect(os_version).to include("Alpine Linux 3.3")
  end

  def os_version
    command("cat /etc/issue | head -1").stdout
  end

  it "installs required packages" do
    CURL_SSL_PACKAGES.split(' ').each do |package|
      expect(command("apk -vv info | grep #{package}").exit_status).to eq(0)
    end
  end
end
