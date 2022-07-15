# frozen_string_literal: true

require_relative "lib/rails_cookie_overflow/version"

Gem::Specification.new do |spec|
  spec.name = "rails_cookie_overflow"
  spec.version = RailsCookieOverflow::VERSION
  spec.authors = ["Ritikesh"]
  spec.email = ["ritikeshsisodiya@gmail.com"]

  spec.summary = "Handle CookieOverflow gracefully"
  spec.description = "Rails raises a CookieOverflow exception when the total size of the incoming request's \
                      cookie crosses a certain threshold - currently set as 4096 bytes. While it is not \
                      advisable to store or pass around such large data in cookies, sometimes, bad actors \
                      can try to send large cookie payloads to your application to see if your systems are \
                      able to handle it. If not handled, your application would end up raising a large number \
                      of 500 exceptions. This gem handles the exception gracefully and responds with a \
                      422 Unprocessable Entity HTTP status code."
  spec.homepage = "https://github.com/ritikesh/rails_cookie_overflow"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ritikesh/rails_cookie_overflow"
  spec.metadata["changelog_uri"] = "https://github.com/ritikesh/rails_cookie_overflow/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 4.2"
end
