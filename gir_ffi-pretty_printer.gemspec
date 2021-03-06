# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = "gir_ffi-pretty_printer"
  s.version = "0.0.7"

  s.summary = "Pretty-printer for modules generated by GirFFI"
  s.description = "Library and executable to pretty-print modules generated by GirFFI," \
                  " taking method overrides and hand-added methods into account."
  s.required_ruby_version = ">= 2.6.0"

  s.authors = ["Matijs van Zuijlen"]
  s.email = ["matijs@matijs.net"]
  s.homepage = "http://www.github.com/mvz/gir_ffi-pretty_printer"

  s.license = "LGPL-2.1+"

  s.files = Dir["{lib,test}/**/*.rb", "README.md", "Rakefile"]
  s.test_files = Dir["test/**/*.rb"]

  s.add_runtime_dependency("bindings", ["~> 1.0.0"])
  s.add_runtime_dependency("gir_ffi", ["~> 0.15.5"])
  s.add_runtime_dependency("indentation", ["~> 0.1.1"])
  s.add_runtime_dependency("mvz-live_ast", ["~> 2.0.0"])

  s.add_development_dependency("minitest", ["~> 5.12"])
  s.add_development_dependency("rake", ["~> 13.0"])
  s.add_development_dependency("rubocop", "~> 1.18.1")
  s.add_development_dependency("rubocop-minitest", "~> 0.14.0")
  s.add_development_dependency("rubocop-performance", "~> 1.11.0")

  s.require_paths = ["lib"]
end
