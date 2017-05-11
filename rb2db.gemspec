# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rb2db/version'

Gem::Specification.new do |spec|
  spec.name          = "rb2db"
  spec.version       = Rb2db::VERSION
  spec.authors       = ["Jacob Duffy"]
  spec.email         = ["duffy.jp@gmail.com"]

  spec.summary       = "Write CPU and Memory info to InfluxDB with Ruby"
  spec.homepage      = "https://github.com/duffyjp/rb2db"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]


  spec.add_dependency 'duffy', '>= 0.3.0'
  spec.add_dependency 'influxdb'

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
end
