# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "exception-notifier-pushover"
  spec.version       = "0.0.1"
  spec.authors       = ["Sascha Wessel"]
  spec.email         = ["swessel@gr4yweb.de"]
  spec.description   = %q{a pushover notifier for exception_notification}
  spec.summary       = %q{a pushover notifier for exception_notification}
  spec.homepage      = "https://github.com/gr4y/exception-notifier-pushover"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  # for specs
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"

  # for coverage report
  spec.add_development_dependency "simplecov"
  
  # for mocking webservices
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "sinatra" 

  # for http   
  spec.add_dependency "httparty"
end
