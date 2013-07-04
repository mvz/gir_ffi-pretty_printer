require 'rake/testtask'
require 'yard'

namespace :test do
  Rake::TestTask.new(:unit) do |t|
    t.libs = ['lib']
    t.ruby_opts += ["-w -Itest"]
    t.test_files = FileList['test/gir_ffi-pretty_printer/*_test.rb']
    t.warning = true
  end

  Rake::TestTask.new(:end_to_end) do |t|
    t.libs = ['lib']
    t.ruby_opts += ["-w -Itest"]
    t.test_files = FileList['test/end_to_end/*_test.rb']
    t.warning = true
  end

  task :all => [:unit, :end_to_end]
end

YARD::Rake::YardocTask.new

task :test => 'test:all'

task :default => 'test'

