class GirFFI::ClassPrettyPrinter
  def initialize klass
    @klass = klass
    @printed_instance_methods = []
  end

  def pretty_print
    arr = []
    arr << "class #{@klass.name} < #{@klass.superclass.name}"
    arr << pretty_print_singleton_methods.indent
    arr << pretty_print_instance_methods.indent
    arr << "end"
    arr.join "\n"
  end

  def pretty_print_instance_methods
    arr = instance_method_list.map { |mname| pretty_print_method(mname) }
    arr.compact.join "\n"
  end

  def instance_method_list
    @klass.instance_methods(false)
  end

  def pretty_print_method mname
    meth = @klass.instance_method mname

    if meth.name != meth.original_name
      bits = []
      unless instance_method_printed? meth.original_name
        @printed_instance_methods << meth.original_name
        bits << method_source(mname, meth)
      end
      bits << "alias_method '#{meth.name}', '#{meth.original_name}'"
      bits.join("\n")
    else
      return if instance_method_printed? meth.original_name
      @printed_instance_methods << meth.original_name
      method_source(mname, meth)
    end
  end

  def method_source(mname, meth)
    if meth.arity == -1
      unless @klass.setup_instance_method mname.to_s
        @klass.setup_instance_method ""
      end

      meth = @klass.instance_method mname
    end

    begin
      meth.to_ruby
    rescue => e
      warn "Printing #{@klass.name}##{mname} failed: #{e.message}"
    end
  end

  def instance_method_printed? mname
    @printed_instance_methods.include? mname
  end

  def pretty_print_singleton_methods
    arr = []
    @klass.methods(false).each do |mname|
      meth = @klass.method mname

      if meth.arity == -1
        @klass.setup_method mname.to_s
        meth = @klass.method mname
      end

      begin
        arr << meth.to_ruby
      rescue => e
        warn "Printing #{@klass.name}.#{mname} failed: #{e.message}"
      end
    end
    arr.join "\n"
  end
end
