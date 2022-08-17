require 'spec_helper'
require 'docker'
require 'serverspec'

AWSCLI_PACKAGES = "curl openssl ca-certificates less"

AWSCLI_BIN = "/usr/bin/aws"
AWSCLI_VERSION = "1.17.2"

describe "awscli image" do
  before(:all) {
    set :docker_image, find_image_id(ENV['DOCKER_IMAGE'])
  }

  def os_version
    command("cat /etc/issue | head -1").stdout
  end

  it "checks if 'aws' binary exists and is a file" do
    expect(file(AWSCLI_BIN)).to be_file
  end

  it "checks if 'aws' binary is executable" do
    expect(file(AWSCLI_BIN)).to be_mode 755
  end

  it "has the 'aws' version #{AWSCLI_VERSION}" do
    def awscli_version
      command("aws --version").stdout.strip
    end
    expect(awscli_version).to match(
      Regexp.union(/aws-cli/, /#{AWSCLI_VERSION}/)
    )
  end

  it "the 'aws help' command works" do
    synopsis_interleaved_with_backspaces = [
      0x0a, 0x53, 0x08, 0x53, 0x59, 0x08, 0x59, 0x4e,
      0x08, 0x4e, 0x4f, 0x08, 0x4f, 0x50, 0x08, 0x50,
      0x53, 0x08, 0x53, 0x49, 0x08, 0x49, 0x53, 0x08,
      0x53, 0x0a
    ].map(&:chr).join('')

    expect(
      command("aws help").stdout
    ).to include(synopsis_interleaved_with_backspaces)
  end

  it "installs required packages" do
    AWSCLI_PACKAGES.split(' ').each do |package|
      expect(command("apk -vv info | grep #{package}").exit_status).to eq(0)
    end
  end

  it "has jq available" do
    cmd = command("jq --version")
    expect(cmd.exit_status).to eq(0)
  end

end
