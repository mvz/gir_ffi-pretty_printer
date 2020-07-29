# frozen_string_literal: true

module GirFFI
  # Pretty-prints classes
  class ClassPrettyPrinter
    def initialize(klass)
      @klass = klass
    end

    def pretty_print
      arr = []
      arr << "class #{@klass.name} < #{@klass.superclass.name}"
      arr << pretty_print_singleton_methods.indent
      arr << pretty_print_instance_methods.indent
      arr << "end"
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
      return if meth.name == meth.original_name

      "alias_method '#{meth.name}', '#{meth.original_name}'"
    end

    def pretty_print_method(meth)
      return if meth.name != meth.original_name

      method_source meth
    end

    def method_source(meth)
      if meth.arity == -1
        name = meth.name.to_s

        if @klass.gir_info.find_instance_method name
          @klass.setup_instance_method name
        elsif name == "_"
          @klass.setup_instance_method ""
        end

        meth = @klass.instance_method name
      end

      begin
        meth.to_ruby
      rescue LiveAST::ASTNotFoundError => e
        warn "Printing #{@klass.name}##{meth.name} failed: #{e.message}"
      end
    end

    def pretty_print_singleton_methods
      arr = []
      @klass.methods(false).sort.each do |mname|
        meth = @klass.method mname
        ruby = meth.to_ruby

        if meth.arity == -1 && ruby.include?("setup_and_call")
          @klass.setup_method mname.to_s
          meth = @klass.method mname
          ruby = meth.to_ruby
        end

        arr << ruby
      end
      arr.join "\n"
    end
  end
end
