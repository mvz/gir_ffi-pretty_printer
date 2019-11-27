# frozen_string_literal: true

begin
  require "simplecov"
  SimpleCov.start do
    add_filter "/test/"
  end
rescue LoadError
  nil # SimpleCov not available
end

require "minitest/autorun"

require "gir_ffi-pretty_printer"
