require 'spec_helper'
require 'docker'
require 'serverspec'

UAAC_VERSION="3.2.0"

describe "cf-uaac image" do
  before(:all) {
    set :docker_image, find_image_id(ENV['DOCKER_IMAGE'])
  }

  it "has the expected version of uaac" do
    expect(
      command("uaac --version").stdout.strip
    ).to eq("UAA client #{UAAC_VERSION}")
  end

end
