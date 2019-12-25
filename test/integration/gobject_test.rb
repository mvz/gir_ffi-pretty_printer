# frozen_string_literal: true

require "test_helper"

describe "The pretty-printed GObject module" do
  let(:printer) { GirFFI::PrettyPrinter.new }
  it "looks as expected" do
    expected = File.read(File.join(File.dirname(__FILE__), "expected_gobject.rb"))
    result = printer.pretty_print "GObject"

    File.open(File.join(File.dirname(__FILE__), "actual_gobject.rb"), "w") do |resultfile|
      resultfile.puts result
    end

    _(result).must_equal expected
  end
end
