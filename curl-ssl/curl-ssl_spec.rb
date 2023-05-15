# frozen_string_literal: true

require 'spec_helper'
require 'docker'
require 'serverspec'

CURL_SSL_PACKAGES = 'jq gettext curl openssl ca-certificates'

describe 'curl-ssl image' do
  before(:all) do
    set :docker_image, find_image_id('curl-ssl:latest')
  end

  it 'installs the right version of Alpine' do
    expect(os_version).to include('Alpine Linux 3.18')
  end

  def os_version
    command('cat /etc/issue | head -1').stdout
  end

  it 'installs required packages' do
    CURL_SSL_PACKAGES.split(' ').each do |package|
      expect(command("apk -vv info | grep #{package}").exit_status).to eq(0)
    end
  end
end
