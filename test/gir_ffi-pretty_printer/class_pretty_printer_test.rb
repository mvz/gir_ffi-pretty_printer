require 'test_helper'

describe GirFFI::ClassPrettyPrinter do
  let(:instance) { GirFFI::ClassPrettyPrinter.new GObject::Object }

  describe "#pretty_print" do
    it "pretty-prints the class" do
      result = instance.pretty_print
      result.must_match(/^class GObject::Object/)
    end
  end

  describe "#pretty_print_method" do
    it "pretty-prints the method" do
      expected = <<-END.reset_indentation.chomp
      def type_class
        GObject::ObjectClass.wrap(to_ptr.get_pointer(0))
      end
      END
      result = instance.pretty_print_method 'type_class'
      result.must_equal expected
    end
  end
end
