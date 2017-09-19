require 'test_helper'

class SimpleClass
  def bar
    'hello'
  end
end

class SimpleAlias < SimpleClass
  alias foo bar
end

class ComplexAlias < SimpleClass
  alias bar_without_qux bar

  def bar_with_qux
    bar_without_qux + '-more'
  end

  alias bar bar_with_qux
end

describe GirFFI::ClassPrettyPrinter do
  let(:instance) { GirFFI::ClassPrettyPrinter.new klass }

  describe '#pretty_print' do
    describe 'for a class with a simple method definition' do
      let(:klass) { SimpleClass }
      it 'pretty-prints the class' do
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

    describe 'for a class with a simple aliased method' do
      let(:klass) { SimpleAlias }
      it 'pretty-prints the class' do
        expected = <<-END.reset_indentation.chomp
          class SimpleAlias < SimpleClass

            alias_method 'foo', 'bar'
          end
        END

        result = instance.pretty_print
        result.must_equal expected
      end
    end

    describe 'for a class with an alias chain' do
      let(:klass) { ComplexAlias }
      it 'pretty-prints the class' do
        expected = <<-END.reset_indentation.chomp
          class ComplexAlias < SimpleClass

            def bar_with_qux
              (bar_without_qux + "-more")
            end
            alias_method 'bar', 'bar_with_qux'
            alias_method 'bar_without_qux', 'bar'
          end
        END

        result = instance.pretty_print
        result.must_equal expected
      end
    end
  end
end
