# frozen_string_literal: true

require 'test_helper'
describe GirFFI::PrettyPrinter do
  describe '#pretty_print' do
    let(:instance) { GirFFI::PrettyPrinter.new }
    it 'pretty-prints a module without version specification' do
      instance.pretty_print 'GObject'
      pass
    end
  end
end
