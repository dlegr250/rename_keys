# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rename_keys/version"

Gem::Specification.new do |spec|
  spec.name          = "rename_keys"
  spec.version       = RenameKeys::VERSION
  spec.authors       = ["Daniel LeGrand"]
  spec.email         = ["dan.legrand@gmail.com"]

  spec.summary       = %q{Change key names of Ruby hashes (including deep/nested hashes).}
  spec.description   = %q{Especially useful when connecting to external APIs that return data in a format you do not like,
                          this gem allows you to easily convert those 3rd-party key names to more meaningful names.}
  spec.homepage      = "https://github.com/dlegr250/rename_keys"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    # spec.metadata["allowed_push_host"] = "TODO: Set to "http://mygemserver.com" to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
