# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dropbox/archive/version'

Gem::Specification.new do |spec|
  spec.name          = "dropbox-archive"
  spec.version       = Dropbox::Archive::VERSION
  spec.authors       = ["Josh McArthur"]
  spec.email         = ["joshua.mcarthur@gmail.com"]
  spec.description   = %q{Automatically upload files to dropbox and remove them from the local filesystem when they are added to a folder}
  spec.summary       = %q{Upload files to Dropbox and delete from local filesystem.}
  spec.homepage      = "https://github.com/joshmcarthur/dropbox-archive"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "dropbox-sdk"
  spec.add_dependency "thor"
  spec.add_dependency "guard"
end
