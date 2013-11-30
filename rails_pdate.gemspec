$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_pdate/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_pdate"
  s.version     = RailsPdate::VERSION
  s.authors     = ["Mohsen Alizadeh"]
  s.email       = ["0x21hate@gmail.com"]
  s.homepage    = "https://github.com/m0h3n/rails-pdate"
  s.summary     = "persian date support for ruby on rails."
  s.description = "A free and open source plugin for ruby and rails for support persian (Shamsi) date and time"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end
