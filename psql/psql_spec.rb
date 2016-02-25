require 'spec_helper'
require 'docker'
require 'serverspec'

PSQL_PACKAGE = 'postgresql-client'
PSQL_VERSION = '9.4.6'
PSQL_PACKAGE_VERSION = PSQL_VERSION + '-r0'

describe "psql image" do
  before(:all) {
    set :docker_image, find_image_id('psql:latest')
  }

  it "installs the right version of Alpine" do
    expect(os_version).to include("Alpine Linux 3.3")
  end

  def os_version
    command("cat /etc/issue | head -1").stdout
  end

  it "installs required package" do
    expect(command("apk info #{PSQL_PACKAGE}").stdout.strip).to \
      include("#{PSQL_PACKAGE}-#{PSQL_PACKAGE_VERSION}")
  end

  it "can run psql" do
    expect(command('psql --version').exit_status).to eq(0)
  end

  it "has the right version" do
    expect(command("psql --version").stdout.strip).to include(PSQL_VERSION)
  end

end
