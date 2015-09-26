require 'test_helper'

describe 'The pretty-printed GLib module' do
  let(:printer) { GirFFI::PrettyPrinter.new }
  it 'looks as expected' do
    expected = File.read(File.join(File.dirname(__FILE__), 'expected_glib.rb'))
    result = printer.pretty_print 'GLib'

    File.open(File.join(File.dirname(__FILE__), 'actual_glib.rb'), 'w') do |resultfile|
      resultfile.puts result
    end

    result.must_equal expected
  end
end
