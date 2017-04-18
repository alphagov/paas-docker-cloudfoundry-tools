require 'spec_helper'
require 'docker'
require 'serverspec'

describe "ruby-slim image" do
  before(:all) {
    set :docker_image, find_image_id('ruby-slim:latest')
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

  it "has unzip available" do
    expect(
      command("unzip -v").stdout
    ).to match(/UnZip 6.*by Debian.*Original by Info-ZIP/)
  end

  it "has git available" do
    expect(
      command("git --version").stdout
    ).to match(/git version 2/)
  end

  it "has bash available" do
    expect(
      command("bash --version").stdout
    ).to match(/GNU bash, version 4\.3/)
  end
end
