require 'serverspec'

set :backend, :docker
set :os, family: :debian

def find_image_id(name)
  image = Docker::Image.all().detect{ |i| i.info['RepoTags'].include? name }
  raise "Docker image '#{name}' not found. You may need to run 'rake build:<name>' first" unless image

  image.id
end
