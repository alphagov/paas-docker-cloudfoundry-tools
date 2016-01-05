require 'spec_helper'
require 'docker'
require 'serverspec'

describe "bosh-init image" do
  before(:all) {
    set :docker_image, find_image_id('curl-ssl:latest')
  }

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
