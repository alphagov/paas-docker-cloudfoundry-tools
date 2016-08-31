require 'spec_helper'
require 'docker'
require 'serverspec'

describe "enum-resource image" do
  before(:all) {
    set :docker_image, find_image_id('enum-resource:latest')
  }

  it "has a wrapped s3 resource" do
    expect(
      file("/opt/resource/wrapped/s3/in")
    ).to be_file
    expect(
      file("/opt/resource/wrapped/s3/out")
    ).to be_file
    expect(
      file("/opt/resource/wrapped/s3/check")
    ).to be_file
  end

  it "has concourse resource binaries" do
    expect(
      file("/opt/resource/in")
    ).to be_file
    expect(
      file("/opt/resource/out")
    ).to be_file
    expect(
      file("/opt/resource/check")
    ).to be_file
  end

  it "has smuggler config" do
    expect(
      file("/opt/resource/smuggler.yml")
    ).to exist
  end

  it "has `jq` available" do
    expect(
      command("jq --version").exit_status
    ).to eq(0)
  end

  it "has `common scripts` available" do
    expect(
      file("/opt/resource/assert_valid_value.sh")
    ).to exist
  end
end
