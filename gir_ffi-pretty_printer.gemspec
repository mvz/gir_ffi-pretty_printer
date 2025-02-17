# frozen_string_literal: true

require_relative "lib/gir_ffi-pretty_printer/version"

Gem::Specification.new do |spec|
  spec.name = "gir_ffi-pretty_printer"
  spec.version = GirFFI::PrettyPrinter::VERSION
  spec.authors = ["Matijs van Zuijlen"]
  spec.email = ["matijs@matijs.net"]

  spec.summary = "Pretty-printer for modules generated by GirFFI"
  spec.description = <<~DESC
    Library and executable to pretty-print modules generated by GirFFI,
    taking method overrides and hand-added methods into account.
  DESC
  spec.homepage = "http://www.github.com/mvz/gir_ffi-pretty_printer"

  spec.license = "LGPL-2.1+"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mvz/gir_ffi-pretty_printer"
  spec.metadata["changelog_uri"] =
    "https://github.com/mvz/gir_ffi-pretty_printer/blob/master/Changelog.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = File.read("Manifest.txt").split
  spec.require_paths = ["lib"]

  spec.rdoc_options = ["--main", "README.md"]
  spec.extra_rdoc_files = ["Changelog.md", "README.md"]

  spec.add_dependency "bindings", "~> 1.0"
  spec.add_dependency "gir_ffi", "~> 0.18.0"
  spec.add_dependency "indentation", "~> 0.1.1"
  spec.add_dependency "mvz-live_ast", "~> 2.0"

  spec.add_development_dependency "minitest", "~> 5.12"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rake-manifest", "~> 0.2.0"
  spec.add_development_dependency "rubocop", "~> 1.52"
  spec.add_development_dependency "rubocop-minitest", "~> 0.37.1"
  spec.add_development_dependency "rubocop-packaging", "~> 0.5.2"
  spec.add_development_dependency "rubocop-performance", "~> 1.18"
  spec.add_development_dependency "simplecov", "~> 0.22.0"
end
