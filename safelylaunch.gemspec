# frozen_string_literal: true

require_relative 'lib/safelylaunch/version'

Gem::Specification.new do |spec|
  spec.name          = 'safelylaunch'
  spec.version       = Safelylaunch::VERSION
  spec.authors       = ['lokideos']
  spec.email         = ['archmage09@gmail.com']

  spec.summary       = 'Example Ruby client gem'
  spec.description   = 'Example Ruby client gem'
  spec.homepage      = 'https://github.com/Lokideos/safelylaunch'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.4.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/Lokideos/safelylaunch'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  spec.add_dependency 'concurrent-ruby'
  spec.add_dependency 'faraday'
  spec.add_dependency 'faraday_middleware'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
