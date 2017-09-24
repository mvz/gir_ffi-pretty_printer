Gem::Specification.new do |s|
  s.name = 'gir_ffi-pretty_printer'
  s.version = '0.0.4'

  s.summary = 'Pretty-printer for modules generated by GirFFI'
  s.description = 'Library and executable to pretty-print modules generated by GirFFI, taking method overrides and hand-added methods into account.'

  s.authors = ['Matijs van Zuijlen']
  s.email = ['matijs@matijs.net']
  s.homepage = 'http://www.github.com/mvz/gir_ffi-pretty_printer'

  s.license = 'LGPL-2.1+'

  s.files = Dir['{lib,test}/**/*.rb', 'README.md', 'Rakefile']
  s.test_files = Dir['test/**/*.rb']

  s.add_runtime_dependency('gir_ffi', ['~> 0.11.4'])
  s.add_runtime_dependency('mvz-live_ast', ['~> 1.2.0'])
  s.add_runtime_dependency('binding_of_caller', ['~> 0.7.2'])
  s.add_development_dependency('minitest', ['~> 5.0'])
  s.add_development_dependency('rake', ['~> 12.0'])

  s.require_paths = ['lib']
end
