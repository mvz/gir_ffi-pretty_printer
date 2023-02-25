# frozen_string_literal: true

require "simplecov"
SimpleCov.start do
  add_filter "/test/"
end

require "minitest/autorun"

require "gir_ffi-pretty_printer"
