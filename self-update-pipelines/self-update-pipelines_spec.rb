require 'spec_helper'
require 'docker'
require 'serverspec'

describe "self-update-pipelines image" do
  before(:all) {
    set :docker_image, find_image_id('self-update-pipelines:latest')
  }

  it "has ruby available" do
    expect(
      command("ruby -v").stdout
    ).to match(/ruby 2\.2/)
  end

  it "has curl available" do
    expect(
      command("curl --version").stdout
    ).to match(/curl 7\.38/)
  end

  it "has bash available" do
    expect(
      command("bash --version").stdout
    ).to match(/GNU bash, version 4\.3/)
  end

  it "has make available" do
    expect(
      command("make --version").stdout
    ).to match(/GNU Make 4/)
  end

end
