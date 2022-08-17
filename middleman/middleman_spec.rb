require 'spec_helper'
require 'docker'
require 'serverspec'

describe "middleman image" do
  before(:all) {
    set :docker_image, find_image_id(ENV['DOCKER_IMAGE'])
  }

  it "can run middleman" do
    expect(command('middleman --help').exit_status).to eq(0)
  end

end
