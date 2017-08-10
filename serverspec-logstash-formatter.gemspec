# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'serverspec-logstash-formatter'
  spec.version       = '0.1.0'
  spec.authors       = ['Jean-Sébastien Hedde']
  spec.email         = '["jshedde@lafourchette.com"]'
  spec.summary       = %q{A logstash formatter for serverspec}
  spec.description   = %q{A logstash formatter for serverspec}
  spec.homepage      = 'https://github.com/lafourchette/serverspec-logstash-formatter'
  spec.license       = 'MIT'

  spec.executables   = %w{}
  spec.files         = Dir['{lib}/**/*'] + %w{README.md LICENSE}
  spec.test_files    = Dir['{spec}/**/*']

  spec.signing_key   = File.expand_path('~/.gem/certs/jshedde-private_key.pem') if $0 =~ /gem\z/
  spec.cert_chain    = %w{certs/jshedde.pem}

  spec.add_dependency             'rspec-core', ["~> 3.0"]

  spec.add_development_dependency 'rspec', ["~> 3.0"]

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'
end

