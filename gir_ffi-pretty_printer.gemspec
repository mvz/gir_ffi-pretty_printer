# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "gir_ffi-pretty_printer"
  s.version = "0.0.2"

  s.summary = "Pretty-printer for modules generated by GirFFI"
  s.description = "Library and executable to pretty-print modules generated by GirFFI, taking method overrides and hand-added methods into account."

  s.authors = ["Matijs van Zuijlen"]
  s.email = ["matijs@matijs.net"]
  s.homepage = "http://www.github.com/mvz/gir_ffi-pretty_printer"

  s.files = Dir['{lib,test}/**/*.rb', "README.md", "Rakefile"]
  s.test_files = Dir['test/**/*.rb']

  s.add_runtime_dependency('gir_ffi', ["~> 0.7.0"])
  s.add_runtime_dependency('mvz-live_ast', ["~> 1.1.0"])
  s.add_runtime_dependency('binding_of_caller', ["~> 0.7.2"])
  s.add_development_dependency('minitest', ["~> 5.0"])
  s.add_development_dependency('rake', ["~> 10.1"])
  s.add_development_dependency('yard', ["~> 0.8.3"])

  s.require_paths = ["lib"]
end
