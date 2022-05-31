require 'spec_helper'
require 'docker'
require 'serverspec'

JSON_MINIFY_VERSION="0.0.2"

describe "json-minify image" do
  before(:all) {
    set :docker_image, find_image_id(ENV['DOCKER_IMAGE'])
  }

  it "has the expected version of the json-minify gem" do
    expect(
      command("gem list").stdout.strip
    ).to include("json-minify (0.0.2)")
  end

end
