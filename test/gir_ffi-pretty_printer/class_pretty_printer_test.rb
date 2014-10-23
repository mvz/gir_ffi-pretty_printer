require 'test_helper'

class Foo
  def bar
    'hello'
  end

  alias foo bar
end

describe GirFFI::ClassPrettyPrinter do
  let(:instance) { GirFFI::ClassPrettyPrinter.new Foo }

  describe "#pretty_print" do
    it "pretty-prints the class" do
      expected = <<-END.reset_indentation.chomp
        class Foo < Object

          def bar
            "hello"
          end
          alias_method 'foo', 'bar'
        end
      END

      result = instance.pretty_print
      result.must_equal expected
    end
  end

  describe "#pretty_print_method" do
    it "pretty-prints a method" do
      expected = <<-END.reset_indentation.chomp
        def bar
          "hello"
        end
      END
      result = instance.pretty_print_method 'bar'
      result.must_equal expected
    end

    it "pretty-prints an alias" do
      expected = <<-END.reset_indentation.chomp
      alias_method 'foo', 'bar'
      END
      result = instance.pretty_print_method 'foo'
      result.must_equal expected
    end
  end
end
