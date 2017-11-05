
Gem::Specification.new do |spec|
  spec.name        = 'pipl-lite'
  spec.version     = '0.1.0'
  spec.authors     = ['John Drago']
  spec.email       = 'jdrago.999@gmail.com'
  spec.homepage    = 'https://github.com/jdrago999/pipl-lite'
  spec.summary     = 'Search Pipl API, the simple way'
  spec.description = 'Search Pipl API, the simple way'
  spec.required_rubygems_version = '>= 1.3.6'

  spec.files         = Dir['**/*'].keep_if { |file| File.file?(file) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'shoulda-matchers'
  spec.add_development_dependency 'simplecov'

  spec.add_dependency 'httparty'

end
