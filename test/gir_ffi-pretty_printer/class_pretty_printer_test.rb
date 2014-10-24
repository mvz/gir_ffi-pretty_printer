require 'test_helper'

class SimpleClass
  def bar
    'hello'
  end
end

class SimpleAlias
  def bar
    'hello'
  end

  alias foo bar
end

class ComplexAlias
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
  let(:instance) { GirFFI::ClassPrettyPrinter.new klass }

  describe "#pretty_print" do
    describe "for a class with a simple method definition" do
      let(:klass) { SimpleClass }
      it "pretty-prints the class" do
        expected = <<-END.reset_indentation.chomp
          class SimpleClass < Object

            def bar
              "hello"
            end
          end
        END

        result = instance.pretty_print
        result.must_equal expected
      end
    end

    describe "for a class with a simple aliased method" do
      let(:klass) { SimpleAlias }
      it "pretty-prints the class" do
        expected = <<-END.reset_indentation.chomp
          class SimpleAlias < Object

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

    describe "for a class with an alias chain" do
      let(:klass) { ComplexAlias }
      it "pretty-prints the class" do
        expected = <<-END.reset_indentation.chomp
          class ComplexAlias < Object

            def baz_with_qux
              (baz_without_qux + "-more")
            end
            def baz
              "original"
            end
            alias_method 'baz', 'baz_with_qux'
            alias_method 'baz_without_qux', 'baz'
          end
        END

        result = instance.pretty_print
        result.must_equal expected
      end
    end
  end
end
