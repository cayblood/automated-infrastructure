# Required for Chef to manage Ubuntu systems
require_recipe 'ubuntu' if platform?('ubuntu')

# Standard tools
require_recipe "build-essential"
require_recipe "git"

# Ensures that all of Ruby is installed
require_recipe "ruby"

# Rake is required for building
# native extensions for gems
gem_package "rake"

# common recipes
include_recipe 'common::testdir'