require 'spec_helper'
require 'docker'
require 'serverspec'

describe "fly-cli image" do
  before(:all) {
    set :docker_image, find_image_id('fly-cli:latest')
  }

  it "installs the right version of Alpine" do
    expect(os_version).to include("Alpine Linux 3.3")
  end

  def os_version
    command("cat /etc/issue | head -1").stdout
  end

  it "has curl available" do
    expect(
      command("curl --version").exit_status
    ).to eq(0)
  end

  it "has fly available" do
    expect(
      command("fly -v").exit_status
    ).to eq(0)
  end
end
