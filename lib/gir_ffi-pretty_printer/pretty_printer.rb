# frozen_string_literal: true

require "live_ast/full"
require "live_ast/to_ruby"
require "gir_ffi"
require "indentation"
require "gir_ffi-pretty_printer/class_pretty_printer"

module GirFFI
  # Main pretty printer
  class PrettyPrinter
    def pretty_print_class(klass)
      ClassPrettyPrinter.new(klass).pretty_print
    end

    def pretty_print_function(modul, mname)
      modul.setup_method mname.to_s unless modul.methods.include?(mname.to_sym)

      meth = modul.method mname
      meth.to_ruby
    end

    def pretty_print_constant(modul, const_name)
      value = modul.const_get(const_name)
      "#{const_name} = #{value.inspect}"
    end

    def pretty_print(module_name, version = nil)
      GirFFI.setup module_name, version
      arr = []
      gir = GObjectIntrospection::IRepository.default
      modul = Kernel.const_get(module_name)
      infos = gir.infos module_name

      arr << "module #{module_name}"

      infos.each do |info|
        case info.info_type
        when :struct, :object
          begin
            klass = GirFFI::Builder.build_class info
            # TODO: Pass in info as well and print more stuff
            arr << pretty_print_class(klass).indent
          rescue SyntaxError
            warn "Skipping #{module_name}::#{info.name}: build failed"
          end
        when :constant
          arr << pretty_print_constant(modul, info.safe_name).indent
        when :function
          arr << pretty_print_function(modul, info.safe_name).indent
        else
          arr << "# XXX: Don't know how to print #{info.info_type}".indent
        end
      end

      arr << "end\n"
      arr.join "\n"
    end
  end
end
