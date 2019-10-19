# frozen_string_literal: true

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
  let(:instance) { GirFFI::ClassPrettyPrinter.new printed_class }

  describe '#pretty_print' do
    describe 'for a class with a simple method definition' do
      let(:printed_class) { SimpleClass }
      it 'pretty-prints the class' do
        expected = <<~RUBY.chomp
          class SimpleClass < Object

            def bar
              "hello"
            end
          end
        RUBY

        result = instance.pretty_print
        result.must_equal expected
      end
    end

    describe 'for a class with a simple aliased method' do
      let(:printed_class) { SimpleAlias }
      it 'pretty-prints the class' do
        expected = <<~RUBY.chomp
          class SimpleAlias < SimpleClass

            alias_method 'foo', 'bar'
          end
        RUBY

        result = instance.pretty_print
        result.must_equal expected
      end
    end

    describe 'for a class with an alias chain' do
      let(:printed_class) { ComplexAlias }
      it 'pretty-prints the class' do
        expected = <<~RUBY.chomp
          class ComplexAlias < SimpleClass

            def bar_with_qux
              (bar_without_qux + "-more")
            end
            alias_method 'bar', 'bar_with_qux'
            alias_method 'bar_without_qux', 'bar'
          end
        RUBY

        result = instance.pretty_print
        result.must_equal expected
      end
    end
  end
end
