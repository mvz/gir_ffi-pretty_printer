class GirFFI::ClassPrettyPrinter
  def initialize(klass)
    @klass = klass
    @printed_instance_methods = []
  end

  def pretty_print
    arr = []
    arr << "class #{@klass.name} < #{@klass.superclass.name}"
    arr << pretty_print_singleton_methods.indent
    arr << pretty_print_instance_methods.indent
    arr << 'end'
    arr.join "\n"
  end

  private

  def pretty_print_instance_methods
    arr =
      instance_method_list.map { |mth| pretty_print_method(mth) } +
      instance_method_list.map { |mth| pretty_print_alias(mth) }
    arr.compact.join "\n"
  end

  def instance_method_name_list
    @klass.instance_methods(false).sort
  end

  def instance_method_list
    @instance_method_list ||=
      instance_method_name_list.map { |name| @klass.instance_method name }
  end

  def pretty_print_alias(meth)
    if meth.name != meth.original_name
      "alias_method '#{meth.name}', '#{meth.original_name}'"
    end
  end

  def pretty_print_method(meth)
    return if instance_method_printed? meth.original_name
    @printed_instance_methods << meth.original_name
    method_source meth
  end

  def method_source(meth)
    if meth.arity == -1
      unless @klass.setup_instance_method meth.name.to_s
        @klass.setup_instance_method ''
      end

      meth = @klass.instance_method meth.name
    end

    begin
      meth.to_ruby
    rescue => e
      warn "Printing #{@klass.name}##{meth.name} failed: #{e.message}"
    end
  end

  def instance_method_printed?(mname)
    @printed_instance_methods.include? mname
  end

  def pretty_print_singleton_methods
    arr = []
    @klass.methods(false).sort.each do |mname|
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
