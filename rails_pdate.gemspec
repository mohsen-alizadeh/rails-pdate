$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_pdate/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_pdate"
  s.version     = RailsPdate::VERSION
  s.authors     = ["Mohsen Alizadeh"]
  s.email       = ["0x21hate@gmail.com"]
  s.homepage    = "https://github.com/mohsen-alizadeh/rails-pdate"
  s.summary     = "persian date support for ruby on rails."
  s.description = "persian date support for ruby on rails."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.0.0"
  # add_runtime_dependency 'rails', '~> 4.0', '>= 4.0.0'
end
