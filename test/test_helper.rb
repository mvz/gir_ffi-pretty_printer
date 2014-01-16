begin
  require 'simplecov'
  SimpleCov.start do
    add_filter "/test/"
  end
rescue LoadError
end

require 'minitest/autorun'

require 'gir_ffi-pretty_printer'
