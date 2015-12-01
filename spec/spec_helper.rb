require 'serverspec'
require 'docker'

    set :os, family: :debian
    set :backend, :docker

