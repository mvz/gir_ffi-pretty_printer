require 'test_helper'

describe GirFFI::ClassPrettyPrinter do
  describe "#pretty_print" do
    let(:instance) { GirFFI::ClassPrettyPrinter.new GObject::Object }

    it "pretty-prints the class" do
      result = instance.pretty_print
      result.must_match(/^class GObject::Object/)
    end
  end
end
