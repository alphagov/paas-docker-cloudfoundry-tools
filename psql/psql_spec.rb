require 'spec_helper'
require 'docker'
require 'serverspec'

PSQL_PACKAGE = 'postgresql-client'

describe "psql image" do
  before(:all) {
    set :docker_image, find_image_id(ENV['DOCKER_IMAGE'])
  }

  it "installs the right version of Alpine" do
    expect(os_version).to include("Alpine Linux 3.13")
  end

  def os_version
    command("cat /etc/issue | head -1").stdout
  end

  it "installs required package" do
    expect(command("apk info #{PSQL_PACKAGE}").stdout.strip).to \
      include("#{PSQL_PACKAGE}")
  end

  it "can run psql" do
    expect(command('psql --version').exit_status).to eq(0)
  end

end
