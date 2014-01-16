require 'live_ast/full'
require 'live_ast/to_ruby'
require 'gir_ffi'
require 'indentation'

class GirFFI::PrettyPrinter
  def pretty_print_class klass
    arr = []
    arr << "class #{klass.name} < #{klass.superclass.name}"
    arr << pretty_print_singleton_methods(klass).indent
    arr << pretty_print_instance_methods(klass).indent
    arr << "end"
    arr.join "\n"
  end

  def pretty_print_instance_methods klass
    arr = []
    klass.instance_methods(false).each do |mname|
      meth = klass.instance_method mname

      if meth.arity == -1
        klass.setup_instance_method mname.to_s
        meth = klass.instance_method mname
      end

      begin
        arr << meth.to_ruby
      rescue => e
        warn "Printing #{klass.name}##{mname} failed: #{e.message}"
      end
    end
    arr.join "\n"
  end

  def pretty_print_singleton_methods klass
    arr = []
    klass.methods(false).each do |mname|
      meth = klass.method mname

      if meth.arity == -1
        klass.setup_method mname.to_s
        meth = klass.method mname
      end

      begin
        arr << meth.to_ruby
      rescue => e
        warn "Printing #{klass.name}.#{mname} failed: #{e.message}"
      end
    end
    arr.join "\n"
  end

  def pretty_print_function modul, mname
    str = ""
    begin
      modul.setup_method mname.to_s unless modul.respond_to? mname

      meth = modul.method mname
      str << meth.to_ruby
    rescue => e
      warn "Printing #{modul.name}.#{mname} failed: #{e.message}"
    end
    str
  end

  def pretty_print_constant modul, const_name
    value = modul.const_get(const_name)
    "#{const_name} = #{value.inspect}"
  end

  def pretty_print module_name, version = nil
    GirFFI.setup module_name, version
    arr = []
    gir = GObjectIntrospection::IRepository.default
    modul = Kernel.const_get(module_name)
    infos = gir.infos module_name

    arr << "module #{module_name}"

    infos.each do |info|
      case info.info_type
      when :struct, :object
        # FIXME: We skip IConv for now since building it fails.
        if info.name == "IConv"
          warn "Skipping #{module_name}::#{info.name}"
        else
          begin
            klass = GirFFI::Builder.build_class info
            arr << pretty_print_class(klass).indent
          rescue SyntaxError
            warn "Skipping #{module_name}::#{info.name}: build failed"
          end
        end
      when :constant
        arr << pretty_print_constant(modul, info.name).indent
      when :function
        arr << pretty_print_function(modul, info.name).indent
      else
        arr << "# XXX: Don't know how to print #{info.info_type}".indent
      end
    end

    arr << "end"
    arr.join "\n"
  end
end
