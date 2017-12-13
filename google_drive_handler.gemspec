
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "google_drive_handler/version"

Gem::Specification.new do |spec|
  spec.name          = "google_drive_handler"
  spec.version       = GoogleDriveHandler::VERSION
  spec.authors       = ["Diego H Piccinini Lagos"]
  spec.email         = ["dlagos@bookingbug.com"]

  spec.summary       = %q{This gem is a handler to create and store the connection needed by google drive.}
  spec.description   = %q{To set up the scope in a easy way with a dotenv setup}
  spec.homepage      = "https://github.com/diegopiccinini/google_drive_handler"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "byebug", "~> 9.1"
  spec.add_dependency "dotenv", "~> 2.2"
  spec.add_dependency "google-api-client", "~> 0.18"
end
