require 'test_helper'

class Foo
  def bar
    'hello'
  end

  alias foo bar

  def baz
    'original'
  end

  alias baz_without_qux baz

  def baz_with_qux
    baz_without_qux + '-more'
  end

  alias baz baz_with_qux
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
          def baz_with_qux
            (baz_without_qux + "-more")
          end
          alias_method 'baz', 'baz_with_qux'
          def baz
            "original"
          end
          alias_method 'baz_without_qux', 'baz'
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
        def bar
          "hello"
        end
        alias_method 'foo', 'bar'
      END
      result = instance.pretty_print_method 'foo'
      result.must_equal expected
    end
  end
end
