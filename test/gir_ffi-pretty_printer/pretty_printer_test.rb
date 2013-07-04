require 'test_helper'
describe GirFFI::PrettyPrinter do
  describe "#initialize" do
    it "takes no arguments" do
      GirFFI::PrettyPrinter.new
    end
  end

  describe "#pretty_print" do
    let(:instance) { GirFFI::PrettyPrinter.new }
    it "pretty-prints a module without type specification" do
      instance.pretty_print 'GObject'
    end
  end
end
