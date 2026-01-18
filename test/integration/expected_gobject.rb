module GObject
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  class GObject::Binding < GObject::Object
  
    def dup_source
      _v1 = GObject::Lib.g_binding_dup_source(self)
      _v2 = GObject::Object.wrap(_v1)
      return _v2
    end
    def dup_target
      _v1 = GObject::Lib.g_binding_dup_target(self)
      _v2 = GObject::Object.wrap(_v1)
      return _v2
    end
    def get_flags
      _v1 = GObject::Lib.g_binding_get_flags(self)
      return _v1
    end
    def get_source
      _v1 = GObject::Lib.g_binding_get_source(self)
      _v2 = GObject::Object.wrap(_v1).tap { |it| it and it.ref }
      return _v2
    end
    def get_source_property
      _v1 = GObject::Lib.g_binding_get_source_property(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def get_target
      _v1 = GObject::Lib.g_binding_get_target(self)
      _v2 = GObject::Object.wrap(_v1).tap { |it| it and it.ref }
      return _v2
    end
    def get_target_property
      _v1 = GObject::Lib.g_binding_get_target_property(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def source_property
      _v1 = get_property("source-property")
      _v1
    end
    def target_property
      _v1 = get_property("target-property")
      _v1
    end
    def unbind
      GObject::Lib.g_binding_unbind(self)
    end
    alias_method 'flags', 'get_flags'
    alias_method 'source', 'get_source'
    alias_method 'target', 'get_target'
  end
  # XXX: Don't know how to print flags
  class GObject::BindingGroup < GObject::Object
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def bind(source_property, target, target_property, flags)
      _v1 = GirFFI::InPointer.from_utf8(source_property)
      _v2 = GObject::Object.from(target)
      _v3 = GirFFI::InPointer.from_utf8(target_property)
      _v4 = flags
      GObject::Lib.g_binding_group_bind(self, _v1, _v2, _v3, _v4)
    end
    def bind_full(source_property, target, target_property, flags, transform_to = nil, transform_from = nil)
      _v1 = GirFFI::InPointer.from_utf8(source_property)
      _v2 = GObject::Object.from(target)
      _v3 = GirFFI::InPointer.from_utf8(target_property)
      _v4 = flags
      _v5 = GObject::Closure.from(transform_to)
      _v6 = GObject::Closure.from(transform_from)
      GObject::Lib.g_binding_group_bind_with_closures(self, _v1, _v2, _v3, _v4, _v5, _v6)
    end
    def dup_source
      _v1 = GObject::Lib.g_binding_group_dup_source(self)
      _v2 = GObject::Object.wrap(_v1).tap { |it| it and it.ref }
      return _v2
    end
    def set_source(source = nil)
      _v1 = GObject::Object.from(source)
      GObject::Lib.g_binding_group_set_source(self, _v1)
    end
    def source
      _v1 = get_property("source")
      _v1
    end
    def source=(value)
      _v1 = value
      set_property("source", _v1)
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print boxed
  class GObject::CClosure < GirFFI::StructBase
    def self.marshal_BOOLEAN__BOXED_BOXED(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = invocation_hint
      _v6 = marshal_data
      GObject::Lib.g_cclosure_marshal_BOOLEAN__BOXED_BOXED(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_BOOLEAN__FLAGS(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = invocation_hint
      _v6 = marshal_data
      GObject::Lib.g_cclosure_marshal_BOOLEAN__FLAGS(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_STRING__OBJECT_POINTER(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = invocation_hint
      _v6 = marshal_data
      GObject::Lib.g_cclosure_marshal_STRING__OBJECT_POINTER(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__BOOLEAN(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = invocation_hint
      _v6 = marshal_data
      GObject::Lib.g_cclosure_marshal_VOID__BOOLEAN(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__BOXED(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = invocation_hint
      _v6 = marshal_data
      GObject::Lib.g_cclosure_marshal_VOID__BOXED(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__CHAR(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = invocation_hint
      _v6 = marshal_data
      GObject::Lib.g_cclosure_marshal_VOID__CHAR(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__DOUBLE(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = invocation_hint
      _v6 = marshal_data
      GObject::Lib.g_cclosure_marshal_VOID__DOUBLE(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__ENUM(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = invocation_hint
      _v6 = marshal_data
      GObject::Lib.g_cclosure_marshal_VOID__ENUM(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__FLAGS(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = invocation_hint
      _v6 = marshal_data
      GObject::Lib.g_cclosure_marshal_VOID__FLAGS(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__FLOAT(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = invocation_hint
      _v6 = marshal_data
      GObject::Lib.g_cclosure_marshal_VOID__FLOAT(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__INT(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = invocation_hint
      _v6 = marshal_data
      GObject::Lib.g_cclosure_marshal_VOID__INT(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__LONG(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = invocation_hint
      _v6 = marshal_data
      GObject::Lib.g_cclosure_marshal_VOID__LONG(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__OBJECT(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = invocation_hint
      _v6 = marshal_data
      GObject::Lib.g_cclosure_marshal_VOID__OBJECT(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__PARAM(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = invocation_hint
      _v6 = marshal_data
      GObject::Lib.g_cclosure_marshal_VOID__PARAM(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__POINTER(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = invocation_hint
      _v6 = marshal_data
      GObject::Lib.g_cclosure_marshal_VOID__POINTER(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__STRING(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = invocation_hint
      _v6 = marshal_data
      GObject::Lib.g_cclosure_marshal_VOID__STRING(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__UCHAR(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = invocation_hint
      _v6 = marshal_data
      GObject::Lib.g_cclosure_marshal_VOID__UCHAR(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__UINT(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = invocation_hint
      _v6 = marshal_data
      GObject::Lib.g_cclosure_marshal_VOID__UINT(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__UINT_POINTER(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = invocation_hint
      _v6 = marshal_data
      GObject::Lib.g_cclosure_marshal_VOID__UINT_POINTER(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__ULONG(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = invocation_hint
      _v6 = marshal_data
      GObject::Lib.g_cclosure_marshal_VOID__ULONG(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__VARIANT(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = invocation_hint
      _v6 = marshal_data
      GObject::Lib.g_cclosure_marshal_VOID__VARIANT(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__VOID(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = invocation_hint
      _v6 = marshal_data
      GObject::Lib.g_cclosure_marshal_VOID__VOID(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_generic(closure, return_gvalue, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_gvalue)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = invocation_hint
      _v6 = marshal_data
      GObject::Lib.g_cclosure_marshal_generic(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def callback
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(64)
      _v2
    end
    def callback=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_pointer(64, _v2)
    end
    def closure
      _v1 = @struct.to_ptr
      _v2 = GObject::Closure.get_value_from_pointer(_v1, 0)
      _v3 = GObject::Closure.wrap(_v2)
      _v3
    end
    def closure=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::Closure.copy_from(value)
      GObject::Closure.copy_value_to_pointer(_v2, _v1)
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  class GObject::Closure < GirFFI::BoxedBase
    def self.new_object(*args, &block)
      raise(NoMethodError) unless (self == GObject::Closure)
      obj = allocate
      obj.__send__(:initialize_object, *args, &block)
      obj
    end
    def self.new_simple(*args, &block)
      raise(NoMethodError) unless (self == GObject::Closure)
      obj = allocate
      obj.__send__(:initialize_simple, *args, &block)
      obj
    end
    def data
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(48)
      _v2
    end
    def derivative_flag
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(28)
      _v2
    end
    def floating
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(24)
      _v2
    end
    def in_inotify
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(20)
      _v2
    end
    def in_marshal
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(32)
      _v2
    end
    def in_marshal=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(32, _v2)
    end
    def initialize_object(sizeof_closure, object)
      _v1 = sizeof_closure
      _v2 = GObject::Object.from(object)
      _v3 = GObject::Lib.g_closure_new_object(_v1, _v2)
      store_pointer(_v3)
      @struct.owned = true
    end
    def initialize_simple(sizeof_closure, data = nil)
      _v1 = sizeof_closure
      _v2 = data
      _v3 = GObject::Lib.g_closure_new_simple(_v1, _v2)
      store_pointer(_v3)
      @struct.owned = true
    end
    def invalidate
      GObject::Lib.g_closure_invalidate(self)
    end
    # @override
    #
    # This override of invoke ensures the return value location can be passed
    # in as the first argument, which is needed to ensure the GValue is
    # initialized with the proper type.
    #
    # @param [GObject::Value] return_value The GValue to store the return
    #   value, or nil if no return value is expected.
    # @param [Array] param_values the closure parameters.
    def invoke(return_value, param_values)
      rval = Value.from(return_value)
      n_params = param_values.length
      params = GirFFI::SizedArray.from(Value, -1, param_values)
      Lib.g_closure_invoke(self, rval, n_params, params, nil)
      rval.get_value
    end
    def is_invalid
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(36)
      _v2
    end
    def is_invalid=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(36, _v2)
    end
    def marshal
      _v1 = @struct.to_ptr
      _v2 = GObject::Closure::Marshal.get_value_from_pointer(_v1, 40)
      _v2
    end
    def meta_marshal_nouse
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(4)
      _v2
    end
    def n_fnotifiers
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(12)
      _v2
    end
    def n_guards
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(8)
      _v2
    end
    def n_inotifiers
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(16)
      _v2
    end
    def notifiers
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(56)
      _v3 = GObject::ClosureNotifyData.wrap(_v2)
      _v3
    end
    def ref
      _v1 = GObject::Lib.g_closure_ref(self)
      _v2 = GObject::Closure.wrap_own(_v1)
      return _v2
    end
    def ref_count
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(0)
      _v2
    end
    # @override
    #
    # @param [Proc] marshal The marshaller to use for this closure object
    def set_marshal(marshal)
      callback = ClosureMarshal.from(marshal)
      Lib.g_closure_set_marshal(self, callback)
    end
    def sink
      GObject::Lib.g_closure_sink(self)
    end
    def store_pointer(ptr)
      Lib.g_closure_ref(ptr)
      Lib.g_closure_sink(ptr)
      super
    end
    def unref
      GObject::Lib.g_closure_unref(self)
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  class GObject::ClosureNotifyData < GirFFI::StructBase
  
    def data
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(0)
      _v2
    end
    def data=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_pointer(0, _v2)
    end
    def notify
      _v1 = @struct.to_ptr
      _v2 = GObject::ClosureNotify.get_value_from_pointer(_v1, 8)
      _v2
    end
    def notify=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::ClosureNotify.from(value)
      GObject::ClosureNotify.copy_value_to_pointer(_v2, _v1, 8)
    end
  end
  # XXX: Don't know how to print flags
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print boxed
  class GObject::EnumClass < GirFFI::StructBase
  
    def g_type_class
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeClass.get_value_from_pointer(_v1, 0)
      _v3 = GObject::TypeClass.wrap(_v2)
      _v3
    end
    def g_type_class=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeClass.copy_from(value)
      GObject::TypeClass.copy_value_to_pointer(_v2, _v1)
    end
    def maximum
      _v1 = @struct.to_ptr
      _v2 = _v1.get_int32(12)
      _v2
    end
    def maximum=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_int32(12, _v2)
    end
    def minimum
      _v1 = @struct.to_ptr
      _v2 = _v1.get_int32(8)
      _v2
    end
    def minimum=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_int32(8, _v2)
    end
    def n_values
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(16)
      _v2
    end
    def n_values=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(16, _v2)
    end
    def values
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(24)
      _v3 = GObject::EnumValue.wrap(_v2)
      _v3
    end
    def values=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::EnumValue.copy_from(value)
      _v1.put_pointer(24, _v2)
    end
  end
  class GObject::EnumValue < GirFFI::StructBase
  
    def value
      _v1 = @struct.to_ptr
      _v2 = _v1.get_int32(0)
      _v2
    end
    def value=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_int32(0, _v2)
    end
    def value_name
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(8)
      _v3 = _v2.to_utf8
      _v3
    end
    def value_name=(value)
      _v1 = @struct.to_ptr
      _v2 = GirFFI::InPointer.from_utf8(value)
      _v1.put_pointer(8, _v2)
    end
    def value_nick
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(16)
      _v3 = _v2.to_utf8
      _v3
    end
    def value_nick=(value)
      _v1 = @struct.to_ptr
      _v2 = GirFFI::InPointer.from_utf8(value)
      _v1.put_pointer(16, _v2)
    end
  end
  # XXX: Don't know how to print boxed
  class GObject::FlagsClass < GirFFI::StructBase
  
    def g_type_class
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeClass.get_value_from_pointer(_v1, 0)
      _v3 = GObject::TypeClass.wrap(_v2)
      _v3
    end
    def g_type_class=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeClass.copy_from(value)
      GObject::TypeClass.copy_value_to_pointer(_v2, _v1)
    end
    def mask
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(8)
      _v2
    end
    def mask=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(8, _v2)
    end
    def n_values
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(12)
      _v2
    end
    def n_values=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(12, _v2)
    end
    def values
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(16)
      _v3 = GObject::FlagsValue.wrap(_v2)
      _v3
    end
    def values=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::FlagsValue.copy_from(value)
      _v1.put_pointer(16, _v2)
    end
  end
  class GObject::FlagsValue < GirFFI::StructBase
  
    def value
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(0)
      _v2
    end
    def value=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(0, _v2)
    end
    def value_name
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(8)
      _v3 = _v2.to_utf8
      _v3
    end
    def value_name=(value)
      _v1 = @struct.to_ptr
      _v2 = GirFFI::InPointer.from_utf8(value)
      _v1.put_pointer(8, _v2)
    end
    def value_nick
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(16)
      _v3 = _v2.to_utf8
      _v3
    end
    def value_nick=(value)
      _v1 = @struct.to_ptr
      _v2 = GirFFI::InPointer.from_utf8(value)
      _v1.put_pointer(16, _v2)
    end
  end
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print flags
  class GObject::InitiallyUnowned < GObject::Object
  
    # Initializing method used in constructors. For InitiallyUnowned and
    # descendants, this needs to sink the object's floating reference.
    def store_pointer(ptr)
      super
      ::GObject::Lib.g_object_ref_sink(ptr)
    end
  end
  class GObject::InitiallyUnownedClass < GObject::ObjectClass
  
    def construct_properties
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(8)
      _v3 = GLib::SList.wrap([:pointer, :void], _v2)
      _v3
    end
    def constructed
      _v1 = @struct.to_ptr
      _v2 = GObject::InitiallyUnownedClass::Constructed.get_value_from_pointer(_v1, 72)
      _v2
    end
    def constructor
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(16)
      _v2
    end
    def dispatch_properties_changed
      _v1 = @struct.to_ptr
      _v2 = GObject::InitiallyUnownedClass::Dispatch_properties_changed.get_value_from_pointer(_v1, 56)
      _v2
    end
    def dispose
      _v1 = @struct.to_ptr
      _v2 = GObject::InitiallyUnownedClass::Dispose.get_value_from_pointer(_v1, 40)
      _v2
    end
    def finalize
      _v1 = @struct.to_ptr
      _v2 = GObject::InitiallyUnownedClass::Finalize.get_value_from_pointer(_v1, 48)
      _v2
    end
    def flags
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint64(80)
      _v2
    end
    def g_type_class
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeClass.get_value_from_pointer(_v1, 0)
      _v3 = GObject::TypeClass.wrap(_v2)
      _v3
    end
    def get_property
      _v1 = @struct.to_ptr
      _v2 = GObject::InitiallyUnownedClass::Get_property.get_value_from_pointer(_v1, 32)
      _v2
    end
    def n_construct_properties
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint64(88)
      _v2
    end
    def n_pspecs
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint64(104)
      _v2
    end
    def notify
      _v1 = @struct.to_ptr
      _v2 = GObject::InitiallyUnownedClass::Notify.get_value_from_pointer(_v1, 64)
      _v2
    end
    def pdummy
      _v1 = @struct.to_ptr
      _v2 = GirFFI::SizedArray.get_value_from_pointer(_v1, 112)
      _v3 = GirFFI::SizedArray.wrap([:pointer, :void], 3, _v2)
      _v3
    end
    def pspecs
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(96)
      _v2
    end
    def set_property
      _v1 = @struct.to_ptr
      _v2 = GObject::InitiallyUnownedClass::Set_property.get_value_from_pointer(_v1, 24)
      _v2
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  class GObject::InterfaceInfo < GirFFI::StructBase
  
    def interface_data
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(16)
      _v2
    end
    def interface_data=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_pointer(16, _v2)
    end
    def interface_finalize
      _v1 = @struct.to_ptr
      _v2 = GObject::InterfaceFinalizeFunc.get_value_from_pointer(_v1, 8)
      _v2
    end
    def interface_finalize=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::InterfaceFinalizeFunc.from(value)
      GObject::InterfaceFinalizeFunc.copy_value_to_pointer(_v2, _v1, 8)
    end
    def interface_init
      _v1 = @struct.to_ptr
      _v2 = GObject::InterfaceInitFunc.get_value_from_pointer(_v1, 0)
      _v2
    end
    def interface_init=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::InterfaceInitFunc.from(value)
      GObject::InterfaceInitFunc.copy_value_to_pointer(_v2, _v1)
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print boxed
  class GObject::Object < GirFFI::ObjectBase
    def self.compat_control(what, data = nil)
      _v1 = what
      _v2 = data
      _v3 = GObject::Lib.g_object_compat_control(_v1, _v2)
      return _v3
    end
    def finalize(ptr)
      rc = GObject::Object::Struct.new(ptr)[:ref_count]
      if (rc == 0) then
        warn("not unreffing #{name}:#{ptr} (#{rc})")
      else
        GObject::Lib.g_object_unref(ptr)
      end
    end
    def self.interface_find_property(g_iface, property_name)
      _v1 = GObject::TypeInterface.from(g_iface)
      _v2 = GirFFI::InPointer.from_utf8(property_name)
      _v3 = GObject::Lib.g_object_interface_find_property(_v1, _v2)
      _v4 = GObject::ParamSpec.wrap(_v3).tap { |it| it and it.ref }
      return _v4
    end
    def self.interface_install_property(g_iface, pspec)
      _v1 = GObject::TypeInterface.from(g_iface)
      _v2 = GObject::ParamSpec.from(pspec)
      GObject::Lib.g_object_interface_install_property(_v1, _v2)
    end
    def self.interface_list_properties(g_iface)
      _v1 = GObject::TypeInterface.from(g_iface)
      _v2 = FFI::MemoryPointer.new(:uint32)
      _v3 = GObject::Lib.g_object_interface_list_properties(_v1, _v2)
      _v4 = _v2.get_uint32(0)
      _v5 = GirFFI::SizedArray.wrap([:pointer, GObject::ParamSpec], _v4, _v3)
      return _v5
    end
    def self.make_finalizer(ptr)
      proc { finalize(ptr) }
    end
    def self.new(...)
      obj = allocate
      obj.__send__(:initialize, ...)
      obj
    end
    def self.new_with_properties(...)
      obj = allocate
      obj.__send__(:initialize_with_properties, ...)
      obj
    end
    def self.newv(*args, &block)
      raise(NoMethodError) unless (self == GObject::Object)
      obj = allocate
      obj.__send__(:initializev, *args, &block)
      obj
    end
    def bind_property(source_property, target, target_property, flags)
      _v1 = GirFFI::InPointer.from_utf8(source_property)
      _v2 = GObject::Object.from(target)
      _v3 = GirFFI::InPointer.from_utf8(target_property)
      _v4 = flags
      _v5 = GObject::Lib.g_object_bind_property(self, _v1, _v2, _v3, _v4)
      _v6 = GObject::Binding.wrap(_v5).tap { |it| it and it.ref }
      return _v6
    end
    def bind_property_full(source_property, target, target_property, flags, transform_to, transform_from)
      _v1 = GirFFI::InPointer.from_utf8(source_property)
      _v2 = GObject::Object.from(target)
      _v3 = GirFFI::InPointer.from_utf8(target_property)
      _v4 = flags
      _v5 = GObject::Closure.from(transform_to)
      _v6 = GObject::Closure.from(transform_from)
      _v7 = GObject::Lib.g_object_bind_property_with_closures(self, _v1, _v2, _v3, _v4, _v5, _v6)
      _v8 = GObject::Binding.wrap(_v7).tap { |it| it and it.ref }
      return _v8
    end
    def force_floating
      GObject::Lib.g_object_force_floating(self)
    end
    def freeze_notify
      GObject::Lib.g_object_freeze_notify(self)
    end
    def get_data(key)
      _v1 = GirFFI::InPointer.from_utf8(key)
      _v2 = GObject::Lib.g_object_get_data(self, _v1)
      return _v2
    end
    def get_property(property_name)
      gvalue = gvalue_for_property(property_name)
      super(property_name, gvalue)
      value = gvalue.get_value
      type_info = get_property_type(property_name)
      value = property_value_post_conversion(value, type_info) if type_info
      value
    end
    def get_qdata(quark)
      _v1 = quark
      _v2 = GObject::Lib.g_object_get_qdata(self, _v1)
      return _v2
    end
    def getv(names, values)
      n_properties = values.nil? ? (0) : (values.length)
      _v1 = n_properties
      _v2 = GirFFI::SizedArray.from(:utf8, -1, names)
      _v3 = GirFFI::SizedArray.from(GObject::Value, -1, values)
      GObject::Lib.g_object_getv(self, _v1, _v2, _v3)
    end
    # Starting with GLib 2.54.0, use g_object_new_with_properties, which
    # takes an array of names and an array of values.
    def initialize_with_properties(properties = {})
      names, gvalues = names_and_gvalues_for_properties(properties)
      n_properties = names.length
      names_arr = GirFFI::SizedArray.from(:utf8, -1, names)
      gvalues_arr = GirFFI::SizedArray.from(GObject::Value, -1, gvalues)
      ptr = GObject::Lib.g_object_new_with_properties(self.class.gtype, n_properties, names_arr, gvalues_arr)
      store_pointer(ptr)
    end
    def initializev(object_type, parameters)
      _v1 = object_type
      n_parameters = parameters.nil? ? (0) : (parameters.length)
      _v2 = n_parameters
      _v3 = GirFFI::SizedArray.from(GObject::Parameter, -1, parameters)
      _v4 = GObject::Lib.g_object_newv(_v1, _v2, _v3)
      store_pointer(_v4)
    end
    def is_floating
      _v1 = GObject::Lib.g_object_is_floating(self)
      return _v1
    end
    def notify(property_name)
      _v1 = GirFFI::InPointer.from_utf8(property_name)
      GObject::Lib.g_object_notify(self, _v1)
    end
    def notify_by_pspec(pspec)
      _v1 = GObject::ParamSpec.from(pspec)
      GObject::Lib.g_object_notify_by_pspec(self, _v1)
    end
    def ref
      Lib.g_object_ref(self)
      self
    end
    def ref_sink
      _v1 = GObject::Lib.g_object_ref_sink(self)
      _v2 = GObject::Object.wrap(_v1).tap { |it| it and it.ref }
      return _v2
    end
    def run_dispose
      GObject::Lib.g_object_run_dispose(self)
    end
    def set_data(key, data = nil)
      _v1 = GirFFI::InPointer.from_utf8(key)
      _v2 = data
      GObject::Lib.g_object_set_data(self, _v1, _v2)
    end
    def set_property(property_name, value)
      type_info = get_property_type(property_name)
      value = property_value_pre_conversion(value, type_info) if type_info
      gvalue = gvalue_for_property(property_name)
      gvalue.set_value(value)
      super(property_name, gvalue)
    end
    def signal_connect(event, data = nil, &)
      GObject.signal_connect(self, event, data, &)
    end
    def signal_connect_after(event, data = nil, &)
      GObject.signal_connect_after(self, event, data, &)
    end
    def steal_data(key)
      _v1 = GirFFI::InPointer.from_utf8(key)
      _v2 = GObject::Lib.g_object_steal_data(self, _v1)
      return _v2
    end
    def steal_qdata(quark)
      _v1 = quark
      _v2 = GObject::Lib.g_object_steal_qdata(self, _v1)
      return _v2
    end
    def thaw_notify
      GObject::Lib.g_object_thaw_notify(self)
    end
    def unref
      GObject::Lib.g_object_unref(self.ref)
    end
    def watch_closure(closure)
      _v1 = GObject::Closure.from(closure)
      GObject::Lib.g_object_watch_closure(self, _v1)
    end
    alias_method 'data', 'get_data'
    alias_method 'floating?', 'is_floating'
    alias_method 'property', 'get_property'
    alias_method 'qdata', 'get_qdata'
  end
  class GObject::ObjectClass < GObject::TypeClass
  
    def construct_properties
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(8)
      _v3 = GLib::SList.wrap([:pointer, :void], _v2)
      _v3
    end
    def constructed
      _v1 = @struct.to_ptr
      _v2 = GObject::ObjectClass::Constructed.get_value_from_pointer(_v1, 72)
      _v2
    end
    def constructor
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(16)
      _v2
    end
    def dispatch_properties_changed
      _v1 = @struct.to_ptr
      _v2 = GObject::ObjectClass::Dispatch_properties_changed.get_value_from_pointer(_v1, 56)
      _v2
    end
    def dispose
      _v1 = @struct.to_ptr
      _v2 = GObject::ObjectClass::Dispose.get_value_from_pointer(_v1, 40)
      _v2
    end
    def finalize
      _v1 = @struct.to_ptr
      _v2 = GObject::ObjectClass::Finalize.get_value_from_pointer(_v1, 48)
      _v2
    end
    def find_property(property_name)
      _v1 = GirFFI::InPointer.from_utf8(property_name)
      _v2 = GObject::Lib.g_object_class_find_property(self, _v1)
      _v3 = GObject::ParamSpec.wrap(_v2).tap { |it| it and it.ref }
      return _v3
    end
    def flags
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint64(80)
      _v2
    end
    def g_type_class
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeClass.get_value_from_pointer(_v1, 0)
      _v3 = GObject::TypeClass.wrap(_v2)
      _v3
    end
    def get_property
      _v1 = @struct.to_ptr
      _v2 = GObject::ObjectClass::Get_property.get_value_from_pointer(_v1, 32)
      _v2
    end
    def gtype
      to_ptr.get_gtype(0)
    end
    def install_properties(pspecs)
      n_pspecs = pspecs.nil? ? (0) : (pspecs.length)
      _v1 = n_pspecs
      _v2 = GirFFI::SizedArray.from([:pointer, GObject::ParamSpec], -1, pspecs)
      GObject::Lib.g_object_class_install_properties(self, _v1, _v2)
    end
    def install_property(property_id, pspec)
      _v1 = property_id
      _v2 = GObject::ParamSpec.from(pspec)
      GObject::Lib.g_object_class_install_property(self, _v1, _v2)
    end
    def list_properties
      _v1 = FFI::MemoryPointer.new(:uint32)
      _v2 = GObject::Lib.g_object_class_list_properties(self, _v1)
      _v3 = _v1.get_uint32(0)
      _v4 = GirFFI::SizedArray.wrap([:pointer, GObject::ParamSpec], _v3, _v2)
      return _v4
    end
    def n_construct_properties
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint64(88)
      _v2
    end
    def n_pspecs
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint64(104)
      _v2
    end
    def notify
      _v1 = @struct.to_ptr
      _v2 = GObject::ObjectClass::Notify.get_value_from_pointer(_v1, 64)
      _v2
    end
    def override_property(property_id, name)
      _v1 = property_id
      _v2 = GirFFI::InPointer.from_utf8(name)
      GObject::Lib.g_object_class_override_property(self, _v1, _v2)
    end
    def pdummy
      _v1 = @struct.to_ptr
      _v2 = GirFFI::SizedArray.get_value_from_pointer(_v1, 112)
      _v3 = GirFFI::SizedArray.wrap([:pointer, :void], 3, _v2)
      _v3
    end
    def pspecs
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(96)
      _v2
    end
    def set_property
      _v1 = @struct.to_ptr
      _v2 = GObject::ObjectClass::Set_property.get_value_from_pointer(_v1, 24)
      _v2
    end
  end
  class GObject::ObjectConstructParam < GirFFI::StructBase
  
    def pspec
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(0)
      _v3 = GObject::ParamSpec.wrap(_v2)
      _v3
    end
    def pspec=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::ParamSpec.from((value and value.ref))
      _v1.put_pointer(0, _v2)
    end
    def value
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(8)
      _v3 = GObject::Value.wrap(_v2)
      _v3
    end
    def value=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::Value.copy_from(value)
      _v1.put_pointer(8, _v2)
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print boxed
  PARAM_MASK = 255
  PARAM_STATIC_STRINGS = 224
  PARAM_USER_SHIFT = 8
  # XXX: Don't know how to print flags
  class GObject::ParamSpec < GirFFI::ObjectBase
    def self.is_valid_name(name)
      _v1 = GirFFI::InPointer.from_utf8(name)
      _v2 = GObject::Lib.g_param_spec_is_valid_name(_v1)
      return _v2
    end
    def accessor_name
      get_name.tr("-", "_")
    end
    def flags
      GObject::ParamFlags.get_value_from_pointer(to_ptr, FLAGS_OFFSET)
    end
    def get_blurb
      _v1 = GObject::Lib.g_param_spec_get_blurb(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def get_default_value
      _v1 = GObject::Lib.g_param_spec_get_default_value(self)
      _v2 = GObject::Value.wrap(_v1).get_value
      return _v2
    end
    def get_name
      _v1 = GObject::Lib.g_param_spec_get_name(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def get_name_quark
      _v1 = GObject::Lib.g_param_spec_get_name_quark(self)
      return _v1
    end
    def get_nick
      _v1 = GObject::Lib.g_param_spec_get_nick(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def get_qdata(quark)
      _v1 = quark
      _v2 = GObject::Lib.g_param_spec_get_qdata(self, _v1)
      return _v2
    end
    def get_redirect_target
      _v1 = GObject::Lib.g_param_spec_get_redirect_target(self)
      _v2 = GObject::ParamSpec.wrap(_v1).tap { |it| it and it.ref }
      return _v2
    end
    def ref
      Lib.g_param_spec_ref(self)
      self
    end
    def set_qdata(quark, data = nil)
      _v1 = quark
      _v2 = data
      GObject::Lib.g_param_spec_set_qdata(self, _v1, _v2)
    end
    def sink
      GObject::Lib.g_param_spec_sink(self)
    end
    def steal_qdata(quark)
      _v1 = quark
      _v2 = GObject::Lib.g_param_spec_steal_qdata(self, _v1)
      return _v2
    end
    def value_type
      to_ptr.get_gtype(VALUE_TYPE_OFFSET)
    end
    alias_method 'blurb', 'get_blurb'
    alias_method 'default_value', 'get_default_value'
    alias_method 'name', 'get_name'
    alias_method 'name_quark', 'get_name_quark'
    alias_method 'nick', 'get_nick'
    alias_method 'qdata', 'get_qdata'
    alias_method 'redirect_target', 'get_redirect_target'
  end
  class GObject::ParamSpecBoolean < GObject::ParamSpec
  
  
  end
  class GObject::ParamSpecBoxed < GObject::ParamSpec
  
  
  end
  class GObject::ParamSpecChar < GObject::ParamSpec
  
  
  end
  class GObject::ParamSpecClass < GObject::TypeClass
  
    def dummy
      _v1 = @struct.to_ptr
      _v2 = GirFFI::SizedArray.get_value_from_pointer(_v1, 56)
      _v3 = GirFFI::SizedArray.wrap([:pointer, :void], 3, _v2)
      _v3
    end
    def finalize
      _v1 = @struct.to_ptr
      _v2 = GObject::ParamSpecClass::Finalize.get_value_from_pointer(_v1, 16)
      _v2
    end
    def g_type_class
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeClass.get_value_from_pointer(_v1, 0)
      _v3 = GObject::TypeClass.wrap(_v2)
      _v3
    end
    def value_is_valid
      _v1 = @struct.to_ptr
      _v2 = GObject::ParamSpecClass::Value_is_valid.get_value_from_pointer(_v1, 48)
      _v2
    end
    def value_set_default
      _v1 = @struct.to_ptr
      _v2 = GObject::ParamSpecClass::Value_set_default.get_value_from_pointer(_v1, 24)
      _v2
    end
    def value_type
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint64(8)
      _v2
    end
    def value_validate
      _v1 = @struct.to_ptr
      _v2 = GObject::ParamSpecClass::Value_validate.get_value_from_pointer(_v1, 32)
      _v2
    end
    def values_cmp
      _v1 = @struct.to_ptr
      _v2 = GObject::ParamSpecClass::Values_cmp.get_value_from_pointer(_v1, 40)
      _v2
    end
  end
  class GObject::ParamSpecDouble < GObject::ParamSpec
  
  
  end
  class GObject::ParamSpecEnum < GObject::ParamSpec
  
  
  end
  class GObject::ParamSpecFlags < GObject::ParamSpec
  
  
  end
  class GObject::ParamSpecFloat < GObject::ParamSpec
  
  
  end
  class GObject::ParamSpecGType < GObject::ParamSpec
  
  
  end
  class GObject::ParamSpecInt < GObject::ParamSpec
  
  
  end
  class GObject::ParamSpecInt64 < GObject::ParamSpec
  
  
  end
  class GObject::ParamSpecLong < GObject::ParamSpec
  
  
  end
  class GObject::ParamSpecObject < GObject::ParamSpec
  
  
  end
  class GObject::ParamSpecOverride < GObject::ParamSpec
  
  
  end
  class GObject::ParamSpecParam < GObject::ParamSpec
  
  
  end
  class GObject::ParamSpecPointer < GObject::ParamSpec
  
  
  end
  class GObject::ParamSpecPool < GirFFI::StructBase
  
    def free
      GObject::Lib.g_param_spec_pool_free(self)
    end
    def insert(pspec, owner_type)
      _v1 = GObject::ParamSpec.from(pspec)
      _v2 = owner_type
      GObject::Lib.g_param_spec_pool_insert(self, _v1, _v2)
    end
    def list(owner_type)
      _v1 = owner_type
      _v2 = FFI::MemoryPointer.new(:uint32)
      _v3 = GObject::Lib.g_param_spec_pool_list(self, _v1, _v2)
      _v4 = _v2.get_uint32(0)
      _v5 = GirFFI::SizedArray.wrap([:pointer, GObject::ParamSpec], _v4, _v3)
      return _v5
    end
    def list_owned(owner_type)
      _v1 = owner_type
      _v2 = GObject::Lib.g_param_spec_pool_list_owned(self, _v1)
      _v3 = GLib::List.wrap(GObject::ParamSpec, _v2)
      return _v3
    end
    def lookup(param_name, owner_type, walk_ancestors)
      _v1 = GirFFI::InPointer.from_utf8(param_name)
      _v2 = owner_type
      _v3 = walk_ancestors
      _v4 = GObject::Lib.g_param_spec_pool_lookup(self, _v1, _v2, _v3)
      _v5 = GObject::ParamSpec.wrap(_v4).tap { |it| it and it.ref }
      return _v5
    end
    def remove(pspec)
      _v1 = GObject::ParamSpec.from(pspec)
      GObject::Lib.g_param_spec_pool_remove(self, _v1)
    end
  end
  class GObject::ParamSpecString < GObject::ParamSpec
  
  
  end
  class GObject::ParamSpecTypeInfo < GirFFI::StructBase
  
    def finalize
      _v1 = @struct.to_ptr
      _v2 = GObject::ParamSpecTypeInfo::Finalize.get_value_from_pointer(_v1, 24)
      _v2
    end
    def instance_init
      _v1 = @struct.to_ptr
      _v2 = GObject::ParamSpecTypeInfo::Instance_init.get_value_from_pointer(_v1, 8)
      _v2
    end
    def instance_size
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint16(0)
      _v2
    end
    def instance_size=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint16(0, _v2)
    end
    def n_preallocs
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint16(2)
      _v2
    end
    def n_preallocs=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint16(2, _v2)
    end
    def value_set_default
      _v1 = @struct.to_ptr
      _v2 = GObject::ParamSpecTypeInfo::Value_set_default.get_value_from_pointer(_v1, 32)
      _v2
    end
    def value_type
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint64(16)
      _v2
    end
    def value_type=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint64(16, _v2)
    end
    def value_validate
      _v1 = @struct.to_ptr
      _v2 = GObject::ParamSpecTypeInfo::Value_validate.get_value_from_pointer(_v1, 40)
      _v2
    end
    def values_cmp
      _v1 = @struct.to_ptr
      _v2 = GObject::ParamSpecTypeInfo::Values_cmp.get_value_from_pointer(_v1, 48)
      _v2
    end
  end
  class GObject::ParamSpecUChar < GObject::ParamSpec
  
  
  end
  class GObject::ParamSpecUInt < GObject::ParamSpec
  
  
  end
  class GObject::ParamSpecUInt64 < GObject::ParamSpec
  
  
  end
  class GObject::ParamSpecULong < GObject::ParamSpec
  
  
  end
  class GObject::ParamSpecUnichar < GObject::ParamSpec
  
  
  end
  class GObject::ParamSpecValueArray < GObject::ParamSpec
  
  
  end
  class GObject::ParamSpecVariant < GObject::ParamSpec
  
  
  end
  class GObject::Parameter < GirFFI::StructBase
  
    def name
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(0)
      _v3 = _v2.to_utf8
      _v3
    end
    def name=(value)
      _v1 = @struct.to_ptr
      _v2 = GirFFI::InPointer.from_utf8(value)
      _v1.put_pointer(0, _v2)
    end
    def value
      _v1 = @struct.to_ptr
      _v2 = GObject::Value.get_value_from_pointer(_v1, 8)
      _v3 = GObject::Value.wrap(_v2)
      _v3
    end
    def value=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::Value.copy_from(value)
      GObject::Value.copy_value_to_pointer(_v2, _v1, 8)
    end
  end
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print boxed
  SIGNAL_FLAGS_MASK = 511
  SIGNAL_MATCH_MASK = 63
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print flags
  class GObject::SignalGroup < GObject::Object
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def block
      GObject::Lib.g_signal_group_block(self)
    end
    def connect_closure(detailed_signal, closure, after)
      _v1 = GirFFI::InPointer.from_utf8(detailed_signal)
      _v2 = GObject::Closure.from(closure)
      _v3 = after
      GObject::Lib.g_signal_group_connect_closure(self, _v1, _v2, _v3)
    end
    def connect_data(detailed_signal, flags, &c_handler)
      _v1 = GirFFI::InPointer.from_utf8(detailed_signal)
      _v2 = GObject::Callback.from(c_handler)
      _v3 = GirFFI::ArgHelper.store(_v2)
      _v4 = GLib::DestroyNotify.default
      _v5 = flags
      GObject::Lib.g_signal_group_connect_data(self, _v1, _v2, _v3, _v4, _v5)
    end
    def connect_swapped(detailed_signal, &c_handler)
      _v1 = GirFFI::InPointer.from_utf8(detailed_signal)
      _v2 = GObject::Callback.from(c_handler)
      _v3 = GirFFI::ArgHelper.store(_v2)
      GObject::Lib.g_signal_group_connect_swapped(self, _v1, _v2, _v3)
    end
    def dup_target
      _v1 = GObject::Lib.g_signal_group_dup_target(self)
      _v2 = GObject::Object.wrap(_v1)
      return _v2
    end
    def set_target(target = nil)
      _v1 = GObject::Object.from(target)
      GObject::Lib.g_signal_group_set_target(self, _v1)
    end
    def target
      _v1 = get_property("target")
      _v1
    end
    def target=(value)
      _v1 = value
      set_property("target", _v1)
    end
    def target_type
      _v1 = get_property("target-type")
      _v1
    end
    def unblock
      GObject::Lib.g_signal_group_unblock(self)
    end
  end
  class GObject::SignalInvocationHint < GirFFI::StructBase
  
    def detail
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(4)
      _v2
    end
    def detail=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(4, _v2)
    end
    def run_type
      _v1 = @struct.to_ptr
      _v2 = GObject::SignalFlags.get_value_from_pointer(_v1, 8)
      _v2
    end
    def run_type=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      GObject::SignalFlags.copy_value_to_pointer(_v2, _v1, 8)
    end
    def signal_id
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(0)
      _v2
    end
    def signal_id=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(0, _v2)
    end
  end
  # XXX: Don't know how to print flags
  class GObject::SignalQuery < GirFFI::StructBase
  
    def itype
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint64(16)
      _v2
    end
    def itype=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint64(16, _v2)
    end
    def n_params
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(40)
      _v2
    end
    def n_params=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(40, _v2)
    end
    def param_types
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(40)
      _v3 = @struct.to_ptr
      _v4 = _v3.get_pointer(48)
      _v5 = GirFFI::SizedArray.wrap(:GType, _v2, _v4)
      _v5
    end
    def param_types=(value)
      _v1 = @struct.to_ptr
      _v2 = GirFFI::SizedArray.copy_from(:GType, -1, value)
      _v1.put_pointer(48, _v2)
    end
    def return_type
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint64(32)
      _v2
    end
    def return_type=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint64(32, _v2)
    end
    def signal_flags
      _v1 = @struct.to_ptr
      _v2 = GObject::SignalFlags.get_value_from_pointer(_v1, 24)
      _v2
    end
    def signal_flags=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      GObject::SignalFlags.copy_value_to_pointer(_v2, _v1, 24)
    end
    def signal_id
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(0)
      _v2
    end
    def signal_id=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(0, _v2)
    end
    def signal_name
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(8)
      _v3 = _v2.to_utf8
      _v3
    end
    def signal_name=(value)
      _v1 = @struct.to_ptr
      _v2 = GirFFI::InPointer.from_utf8(value)
      _v1.put_pointer(8, _v2)
    end
  end
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print boxed
  TYPE_FLAG_RESERVED_ID_BIT = 1
  TYPE_FUNDAMENTAL_MAX = 1020
  TYPE_FUNDAMENTAL_SHIFT = 2
  TYPE_RESERVED_BSE_FIRST = 32
  TYPE_RESERVED_BSE_LAST = 48
  TYPE_RESERVED_GLIB_FIRST = 22
  TYPE_RESERVED_GLIB_LAST = 31
  TYPE_RESERVED_USER_FIRST = 49
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print union
  class GObject::TypeClass < GirFFI::StructBase
    def self.adjust_private_offset(g_class, private_size_or_offset)
      _v1 = g_class
      _v2 = private_size_or_offset
      GObject::Lib.g_type_class_adjust_private_offset(_v1, _v2)
    end
    def self.get(type)
      _v1 = type
      _v2 = GObject::Lib.g_type_class_get(_v1)
      _v3 = GObject::TypeClass.wrap_copy(_v2)
      return _v3
    end
    def self.peek(type)
      _v1 = type
      _v2 = GObject::Lib.g_type_class_peek(_v1)
      _v3 = GObject::TypeClass.wrap_copy(_v2)
      return _v3
    end
    def self.peek_static(type)
      _v1 = type
      _v2 = GObject::Lib.g_type_class_peek_static(_v1)
      _v3 = GObject::TypeClass.wrap_copy(_v2)
      return _v3
    end
    def self.ref(type)
      _v1 = type
      _v2 = GObject::Lib.g_type_class_ref(_v1)
      _v3 = GObject::TypeClass.wrap_copy(_v2)
      return _v3
    end
    def add_private(private_size)
      _v1 = private_size
      GObject::Lib.g_type_class_add_private(self, _v1)
    end
    def g_type
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint64(0)
      _v2
    end
    def get_private(private_type)
      _v1 = private_type
      _v2 = GObject::Lib.g_type_class_get_private(self, _v1)
      return _v2
    end
    def peek_parent
      _v1 = GObject::Lib.g_type_class_peek_parent(self)
      _v2 = GObject::TypeClass.wrap_copy(_v1)
      return _v2
    end
    def unref
      GObject::Lib.g_type_class_unref(self)
    end
    alias_method 'private', 'get_private'
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print flags
  # XXX: Don't know how to print flags
  # XXX: Don't know how to print flags
  class GObject::TypeFundamentalInfo < GirFFI::StructBase
  
    def type_flags
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeFundamentalFlags.get_value_from_pointer(_v1, 0)
      _v2
    end
    def type_flags=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      GObject::TypeFundamentalFlags.copy_value_to_pointer(_v2, _v1)
    end
  end
  class GObject::TypeInfo < GirFFI::StructBase
  
    def base_finalize
      _v1 = @struct.to_ptr
      _v2 = GObject::BaseFinalizeFunc.get_value_from_pointer(_v1, 16)
      _v2
    end
    def base_finalize=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::BaseFinalizeFunc.from(value)
      GObject::BaseFinalizeFunc.copy_value_to_pointer(_v2, _v1, 16)
    end
    def base_init
      _v1 = @struct.to_ptr
      _v2 = GObject::BaseInitFunc.get_value_from_pointer(_v1, 8)
      _v2
    end
    def base_init=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::BaseInitFunc.from(value)
      GObject::BaseInitFunc.copy_value_to_pointer(_v2, _v1, 8)
    end
    def class_data
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(40)
      _v2
    end
    def class_data=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_pointer(40, _v2)
    end
    def class_finalize
      _v1 = @struct.to_ptr
      _v2 = GObject::ClassFinalizeFunc.get_value_from_pointer(_v1, 32)
      _v2
    end
    def class_finalize=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::ClassFinalizeFunc.from(value)
      GObject::ClassFinalizeFunc.copy_value_to_pointer(_v2, _v1, 32)
    end
    def class_init
      _v1 = @struct.to_ptr
      _v2 = GObject::ClassInitFunc.get_value_from_pointer(_v1, 24)
      _v2
    end
    def class_init=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::ClassInitFunc.from(value)
      GObject::ClassInitFunc.copy_value_to_pointer(_v2, _v1, 24)
    end
    def class_size
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint16(0)
      _v2
    end
    def class_size=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint16(0, _v2)
    end
    def instance_init
      _v1 = @struct.to_ptr
      _v2 = GObject::InstanceInitFunc.get_value_from_pointer(_v1, 56)
      _v2
    end
    def instance_init=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::InstanceInitFunc.from(value)
      GObject::InstanceInitFunc.copy_value_to_pointer(_v2, _v1, 56)
    end
    def instance_size
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint16(48)
      _v2
    end
    def instance_size=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint16(48, _v2)
    end
    def n_preallocs
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint16(50)
      _v2
    end
    def n_preallocs=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint16(50, _v2)
    end
    def value_table
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(64)
      _v3 = GObject::TypeValueTable.wrap(_v2)
      _v3
    end
    def value_table=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeValueTable.copy_from(value)
      _v1.put_pointer(64, _v2)
    end
  end
  class GObject::TypeInstance < GirFFI::StructBase
  
    def g_class
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(0)
      _v3 = GObject::TypeClass.wrap(_v2)
      _v3
    end
    def get_private(private_type)
      _v1 = private_type
      _v2 = GObject::Lib.g_type_instance_get_private(self, _v1)
      return _v2
    end
    alias_method 'private', 'get_private'
  end
  class GObject::TypeInterface < GirFFI::StructBase
    def self.add_prerequisite(interface_type, prerequisite_type)
      _v1 = interface_type
      _v2 = prerequisite_type
      GObject::Lib.g_type_interface_add_prerequisite(_v1, _v2)
    end
    def self.get_plugin(instance_type, interface_type)
      _v1 = instance_type
      _v2 = interface_type
      _v3 = GObject::Lib.g_type_interface_get_plugin(_v1, _v2)
      _v4 = GObject::TypePlugin.wrap(_v3)
      return _v4
    end
    def self.instantiatable_prerequisite(interface_type)
      _v1 = interface_type
      _v2 = GObject::Lib.g_type_interface_instantiatable_prerequisite(_v1)
      return _v2
    end
    def self.peek(instance_class, iface_type)
      _v1 = GObject::TypeClass.from(instance_class)
      _v2 = iface_type
      _v3 = GObject::Lib.g_type_interface_peek(_v1, _v2)
      _v4 = GObject::TypeInterface.wrap_copy(_v3)
      return _v4
    end
    def self.prerequisites(interface_type)
      _v1 = interface_type
      _v2 = FFI::MemoryPointer.new(:uint32)
      _v3 = GObject::Lib.g_type_interface_prerequisites(_v1, _v2)
      _v4 = _v2.get_uint32(0)
      _v5 = GirFFI::SizedArray.wrap(:GType, _v4, _v3)
      return _v5
    end
    def g_instance_type
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint64(8)
      _v2
    end
    def g_type
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint64(0)
      _v2
    end
    def peek_parent
      _v1 = GObject::Lib.g_type_interface_peek_parent(self)
      _v2 = GObject::TypeInterface.wrap_copy(_v1)
      return _v2
    end
  end
  # XXX: Don't know how to print callback
  class GObject::TypeModule < GObject::Object
  
    def add_interface(instance_type, interface_type, interface_info)
      _v1 = instance_type
      _v2 = interface_type
      _v3 = GObject::InterfaceInfo.from(interface_info)
      GObject::Lib.g_type_module_add_interface(self, _v1, _v2, _v3)
    end
    def register_enum(name, const_static_values)
      _v1 = GirFFI::InPointer.from_utf8(name)
      _v2 = GirFFI::ZeroTerminated.from(GObject::EnumValue, const_static_values)
      _v3 = GObject::Lib.g_type_module_register_enum(self, _v1, _v2)
      return _v3
    end
    def register_flags(name, const_static_values)
      _v1 = GirFFI::InPointer.from_utf8(name)
      _v2 = GirFFI::ZeroTerminated.from(GObject::FlagsValue, const_static_values)
      _v3 = GObject::Lib.g_type_module_register_flags(self, _v1, _v2)
      return _v3
    end
    def register_type(parent_type, type_name, type_info, flags)
      _v1 = parent_type
      _v2 = GirFFI::InPointer.from_utf8(type_name)
      _v3 = GObject::TypeInfo.from(type_info)
      _v4 = flags
      _v5 = GObject::Lib.g_type_module_register_type(self, _v1, _v2, _v3, _v4)
      return _v5
    end
    def set_name(name)
      _v1 = GirFFI::InPointer.from_utf8(name)
      GObject::Lib.g_type_module_set_name(self, _v1)
    end
    def unuse
      GObject::Lib.g_type_module_unuse(self)
    end
    def use
      _v1 = GObject::Lib.g_type_module_use(self)
      return _v1
    end
    alias_method 'name=', 'set_name'
  end
  class GObject::TypeModuleClass < GObject::ObjectClass
  
    def load
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeModuleClass::Load.get_value_from_pointer(_v1, 136)
      _v2
    end
    def parent_class
      _v1 = @struct.to_ptr
      _v2 = GObject::ObjectClass.get_value_from_pointer(_v1, 0)
      _v3 = GObject::ObjectClass.wrap(_v2)
      _v3
    end
    def reserved1
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeModuleClass::Reserved1.get_value_from_pointer(_v1, 152)
      _v2
    end
    def reserved2
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeModuleClass::Reserved2.get_value_from_pointer(_v1, 160)
      _v2
    end
    def reserved3
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeModuleClass::Reserved3.get_value_from_pointer(_v1, 168)
      _v2
    end
    def reserved4
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeModuleClass::Reserved4.get_value_from_pointer(_v1, 176)
      _v2
    end
    def unload
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeModuleClass::Unload.get_value_from_pointer(_v1, 144)
      _v2
    end
  end
  # XXX: Don't know how to print interface
  class GObject::TypePluginClass < GirFFI::StructBase
  
    def base_iface
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeInterface.get_value_from_pointer(_v1, 0)
      _v3 = GObject::TypeInterface.wrap(_v2)
      _v3
    end
    def complete_interface_info
      _v1 = @struct.to_ptr
      _v2 = GObject::TypePluginCompleteInterfaceInfo.get_value_from_pointer(_v1, 40)
      _v2
    end
    def complete_interface_info=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::TypePluginCompleteInterfaceInfo.from(value)
      GObject::TypePluginCompleteInterfaceInfo.copy_value_to_pointer(_v2, _v1, 40)
    end
    def complete_type_info
      _v1 = @struct.to_ptr
      _v2 = GObject::TypePluginCompleteTypeInfo.get_value_from_pointer(_v1, 32)
      _v2
    end
    def complete_type_info=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::TypePluginCompleteTypeInfo.from(value)
      GObject::TypePluginCompleteTypeInfo.copy_value_to_pointer(_v2, _v1, 32)
    end
    def unuse_plugin
      _v1 = @struct.to_ptr
      _v2 = GObject::TypePluginUnuse.get_value_from_pointer(_v1, 24)
      _v2
    end
    def unuse_plugin=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::TypePluginUnuse.from(value)
      GObject::TypePluginUnuse.copy_value_to_pointer(_v2, _v1, 24)
    end
    def use_plugin
      _v1 = @struct.to_ptr
      _v2 = GObject::TypePluginUse.get_value_from_pointer(_v1, 16)
      _v2
    end
    def use_plugin=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::TypePluginUse.from(value)
      GObject::TypePluginUse.copy_value_to_pointer(_v2, _v1, 16)
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  class GObject::TypeQuery < GirFFI::StructBase
  
    def class_size
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(16)
      _v2
    end
    def class_size=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(16, _v2)
    end
    def instance_size
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(20)
      _v2
    end
    def instance_size=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(20, _v2)
    end
    def type
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint64(0)
      _v2
    end
    def type=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint64(0, _v2)
    end
    def type_name
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(8)
      _v3 = _v2.to_utf8
      _v3
    end
    def type_name=(value)
      _v1 = @struct.to_ptr
      _v2 = GirFFI::InPointer.from_utf8(value)
      _v1.put_pointer(8, _v2)
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  class GObject::TypeValueTable < GirFFI::StructBase
  
    def collect_format
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(32)
      _v3 = _v2.to_utf8
      _v3
    end
    def collect_format=(value)
      _v1 = @struct.to_ptr
      _v2 = GirFFI::InPointer.from_utf8(value)
      _v1.put_pointer(32, _v2)
    end
    def collect_value
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeValueCollectFunc.get_value_from_pointer(_v1, 40)
      _v2
    end
    def collect_value=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeValueCollectFunc.from(value)
      GObject::TypeValueCollectFunc.copy_value_to_pointer(_v2, _v1, 40)
    end
    def lcopy_format
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(48)
      _v3 = _v2.to_utf8
      _v3
    end
    def lcopy_format=(value)
      _v1 = @struct.to_ptr
      _v2 = GirFFI::InPointer.from_utf8(value)
      _v1.put_pointer(48, _v2)
    end
    def lcopy_value
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeValueLCopyFunc.get_value_from_pointer(_v1, 56)
      _v2
    end
    def lcopy_value=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeValueLCopyFunc.from(value)
      GObject::TypeValueLCopyFunc.copy_value_to_pointer(_v2, _v1, 56)
    end
    def value_copy
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeValueCopyFunc.get_value_from_pointer(_v1, 16)
      _v2
    end
    def value_copy=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeValueCopyFunc.from(value)
      GObject::TypeValueCopyFunc.copy_value_to_pointer(_v2, _v1, 16)
    end
    def value_free
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeValueFreeFunc.get_value_from_pointer(_v1, 8)
      _v2
    end
    def value_free=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeValueFreeFunc.from(value)
      GObject::TypeValueFreeFunc.copy_value_to_pointer(_v2, _v1, 8)
    end
    def value_init
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeValueInitFunc.get_value_from_pointer(_v1, 0)
      _v2
    end
    def value_init=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeValueInitFunc.from(value)
      GObject::TypeValueInitFunc.copy_value_to_pointer(_v2, _v1)
    end
    def value_peek_pointer
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeValuePeekPointerFunc.get_value_from_pointer(_v1, 24)
      _v2
    end
    def value_peek_pointer=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::TypeValuePeekPointerFunc.from(value)
      GObject::TypeValuePeekPointerFunc.copy_value_to_pointer(_v2, _v1, 24)
    end
  end
  # XXX: Don't know how to print boxed
  VALUE_COLLECT_FORMAT_MAX_LENGTH = 8
  VALUE_INTERNED_STRING = 268435456
  VALUE_NOCOPY_CONTENTS = 134217728
  class GObject::Value < GirFFI::BoxedBase
    def self.copy_value_to_pointer(value, pointer, offset = 0)
      target = wrap((pointer + offset))
      target.init(value.current_gtype)
      Lib.g_value_copy(value, target) unless value.uninitialized?
    end
    def self.for_gtype(gtype)
      new.tap { |it| it.init(gtype) }
    end
    def self.from(val)
      case val
      when self then
        val
      else
        wrap_ruby_value(val)
      end
    end
    def self.type_compatible(src_type, dest_type)
      _v1 = src_type
      _v2 = dest_type
      _v3 = GObject::Lib.g_value_type_compatible(_v1, _v2)
      return _v3
    end
    def self.type_transformable(src_type, dest_type)
      _v1 = src_type
      _v2 = dest_type
      _v3 = GObject::Lib.g_value_type_transformable(_v1, _v2)
      return _v3
    end
    def self.wrap_instance(instance)
      new.tap do |it|
        it.init(GObject.type_from_instance(instance))
        it.set_instance(instance)
      end
    end
    def self.wrap_ruby_value(val)
      new.tap { |gv| gv.__send__(:set_ruby_value, val) }
    end
    def copy(dest_value)
      _v1 = GObject::Value.from(dest_value)
      GObject::Lib.g_value_copy(self, _v1)
    end
    def data
      _v1 = @struct.to_ptr
      _v2 = GirFFI::SizedArray.get_value_from_pointer(_v1, 8)
      _v3 = GirFFI::SizedArray.wrap(GObject::Private___Value__data__union, 2, _v2)
      _v3
    end
    def data=(value)
      _v1 = @struct.to_ptr
      GirFFI::ArgHelper.check_fixed_array_size(2, value, "value")
      _v2 = GirFFI::SizedArray.copy_from(GObject::Private___Value__data__union, 2, value)
      GirFFI::SizedArray.copy_value_to_pointer(_v2, _v1, 8)
    end
    def dup_object
      _v1 = GObject::Lib.g_value_dup_object(self)
      _v2 = GObject::Object.wrap(_v1)
      return _v2
    end
    def dup_string
      _v1 = GObject::Lib.g_value_dup_string(self)
      _v2 = GirFFI::AllocationHelper.free_after(_v1, &:to_utf8)
      return _v2
    end
    def dup_variant
      _v1 = GObject::Lib.g_value_dup_variant(self)
      _v2 = GLib::Variant.wrap_own(_v1)
      return _v2
    end
    def fits_pointer
      _v1 = GObject::Lib.g_value_fits_pointer(self)
      return _v1
    end
    def g_type
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint64(0)
      _v2
    end
    def get_boolean
      _v1 = GObject::Lib.g_value_get_boolean(self)
      return _v1
    end
    def get_boxed
      _v1 = GObject::Lib.g_value_get_boxed(self)
      return _v1
    end
    def get_char
      _v1 = GObject::Lib.g_value_get_char(self)
      return _v1
    end
    def get_double
      _v1 = GObject::Lib.g_value_get_double(self)
      return _v1
    end
    def get_enum
      _v1 = GObject::Lib.g_value_get_enum(self)
      return _v1
    end
    def get_flags
      _v1 = GObject::Lib.g_value_get_flags(self)
      return _v1
    end
    def get_float
      _v1 = GObject::Lib.g_value_get_float(self)
      return _v1
    end
    def get_gtype
      _v1 = GObject::Lib.g_value_get_gtype(self)
      return _v1
    end
    def get_int
      _v1 = GObject::Lib.g_value_get_int(self)
      return _v1
    end
    def get_int64
      _v1 = GObject::Lib.g_value_get_int64(self)
      return _v1
    end
    def get_long
      _v1 = GObject::Lib.g_value_get_long(self)
      return _v1
    end
    def get_object
      _v1 = GObject::Lib.g_value_get_object(self)
      _v2 = GObject::Object.wrap(_v1).tap { |it| it and it.ref }
      return _v2
    end
    def get_param
      _v1 = GObject::Lib.g_value_get_param(self)
      _v2 = GObject::ParamSpec.wrap(_v1).tap { |it| it and it.ref }
      return _v2
    end
    def get_pointer
      _v1 = GObject::Lib.g_value_get_pointer(self)
      return _v1
    end
    def get_schar
      _v1 = GObject::Lib.g_value_get_schar(self)
      return _v1
    end
    def get_string
      _v1 = GObject::Lib.g_value_get_string(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def get_uchar
      _v1 = GObject::Lib.g_value_get_uchar(self)
      return _v1
    end
    def get_uint
      _v1 = GObject::Lib.g_value_get_uint(self)
      return _v1
    end
    def get_uint64
      _v1 = GObject::Lib.g_value_get_uint64(self)
      return _v1
    end
    def get_ulong
      _v1 = GObject::Lib.g_value_get_ulong(self)
      return _v1
    end
    def get_variant
      _v1 = GObject::Lib.g_value_get_variant(self)
      _v2 = GLib::Variant.wrap_copy(_v1)
      return _v2
    end
    def init(type)
      unless [TYPE_NONE, TYPE_INVALID].include?(type) then
        Lib.g_value_init(self, type)
      end
      self
    end
    def init_from_instance(instance)
      _v1 = GObject::TypeInstance.from(instance)
      GObject::Lib.g_value_init_from_instance(self, _v1)
    end
    def peek_pointer
      _v1 = GObject::Lib.g_value_peek_pointer(self)
      return _v1
    end
    def reset
      _v1 = GObject::Lib.g_value_reset(self)
      _v2 = GObject::Value.wrap(_v1).get_value
      return _v2
    end
    def set_boolean(v_boolean)
      _v1 = v_boolean
      GObject::Lib.g_value_set_boolean(self, _v1)
    end
    def set_boxed(v_boxed = nil)
      _v1 = v_boxed
      GObject::Lib.g_value_set_boxed(self, _v1)
    end
    def set_boxed_take_ownership(v_boxed = nil)
      _v1 = v_boxed
      GObject::Lib.g_value_set_boxed_take_ownership(self, _v1)
    end
    def set_char(v_char)
      _v1 = v_char
      GObject::Lib.g_value_set_char(self, _v1)
    end
    def set_double(v_double)
      _v1 = v_double
      GObject::Lib.g_value_set_double(self, _v1)
    end
    def set_enum(v_enum)
      _v1 = v_enum
      GObject::Lib.g_value_set_enum(self, _v1)
    end
    def set_flags(v_flags)
      _v1 = v_flags
      GObject::Lib.g_value_set_flags(self, _v1)
    end
    def set_float(v_float)
      _v1 = v_float
      GObject::Lib.g_value_set_float(self, _v1)
    end
    def set_gtype(v_gtype)
      _v1 = v_gtype
      GObject::Lib.g_value_set_gtype(self, _v1)
    end
    def set_instance(instance = nil)
      _v1 = instance
      GObject::Lib.g_value_set_instance(self, _v1)
    end
    def set_int(v_int)
      _v1 = v_int
      GObject::Lib.g_value_set_int(self, _v1)
    end
    def set_int64(v_int64)
      _v1 = v_int64
      GObject::Lib.g_value_set_int64(self, _v1)
    end
    def set_interned_string(v_string = nil)
      _v1 = GirFFI::InPointer.from_utf8(v_string)
      GObject::Lib.g_value_set_interned_string(self, _v1)
    end
    def set_long(v_long)
      _v1 = v_long
      GObject::Lib.g_value_set_long(self, _v1)
    end
    def set_object(v_object = nil)
      _v1 = GObject::Object.from(v_object)
      GObject::Lib.g_value_set_object(self, _v1)
    end
    def set_param(param = nil)
      _v1 = GObject::ParamSpec.from(param)
      GObject::Lib.g_value_set_param(self, _v1)
    end
    def set_pointer(v_pointer = nil)
      _v1 = v_pointer
      GObject::Lib.g_value_set_pointer(self, _v1)
    end
    def set_schar(v_char)
      _v1 = v_char
      GObject::Lib.g_value_set_schar(self, _v1)
    end
    def set_static_boxed(v_boxed = nil)
      _v1 = v_boxed
      GObject::Lib.g_value_set_static_boxed(self, _v1)
    end
    def set_static_string(v_string = nil)
      _v1 = GirFFI::InPointer.from_utf8(v_string)
      GObject::Lib.g_value_set_static_string(self, _v1)
    end
    def set_string(v_string = nil)
      _v1 = GirFFI::InPointer.from_utf8(v_string)
      GObject::Lib.g_value_set_string(self, _v1)
    end
    def set_string_take_ownership(v_string = nil)
      _v1 = GirFFI::InPointer.from_utf8(v_string)
      GObject::Lib.g_value_set_string_take_ownership(self, _v1)
    end
    def set_uchar(v_uchar)
      _v1 = v_uchar
      GObject::Lib.g_value_set_uchar(self, _v1)
    end
    def set_uint(v_uint)
      _v1 = v_uint
      GObject::Lib.g_value_set_uint(self, _v1)
    end
    def set_uint64(v_uint64)
      _v1 = v_uint64
      GObject::Lib.g_value_set_uint64(self, _v1)
    end
    def set_ulong(v_ulong)
      _v1 = v_ulong
      GObject::Lib.g_value_set_ulong(self, _v1)
    end
    def set_variant(variant = nil)
      _v1 = GLib::Variant.from(variant)
      GObject::Lib.g_value_set_variant(self, _v1)
    end
    def steal_string
      _v1 = GObject::Lib.g_value_steal_string(self)
      _v2 = GirFFI::AllocationHelper.free_after(_v1, &:to_utf8)
      return _v2
    end
    def take_boxed(v_boxed = nil)
      _v1 = v_boxed
      GObject::Lib.g_value_take_boxed(self, _v1)
    end
    def take_string(v_string = nil)
      _v1 = GirFFI::InPointer.from_utf8(v_string)
      GObject::Lib.g_value_take_string(self, _v1)
    end
    def take_variant(variant = nil)
      _v1 = GLib::Variant.copy_from(variant)
      GObject::Lib.g_value_take_variant(self, _v1)
    end
    def transform(dest_value)
      _v1 = GObject::Value.from(dest_value)
      _v2 = GObject::Lib.g_value_transform(self, _v1)
      return _v2
    end
    def unset
      GObject::Lib.g_value_unset(self)
    end
    alias_method 'boolean', 'get_boolean'
    alias_method 'boolean=', 'set_boolean'
    alias_method 'boxed', 'get_boxed'
    alias_method 'boxed=', 'set_boxed'
    alias_method 'boxed_take_ownership=', 'set_boxed_take_ownership'
    alias_method 'char', 'get_char'
    alias_method 'char=', 'set_char'
    alias_method 'double', 'get_double'
    alias_method 'double=', 'set_double'
    alias_method 'enum', 'get_enum'
    alias_method 'enum=', 'set_enum'
    alias_method 'flags', 'get_flags'
    alias_method 'flags=', 'set_flags'
    alias_method 'float', 'get_float'
    alias_method 'float=', 'set_float'
    alias_method 'gtype', 'get_gtype'
    alias_method 'gtype=', 'set_gtype'
    alias_method 'instance=', 'set_instance'
    alias_method 'int', 'get_int'
    alias_method 'int64', 'get_int64'
    alias_method 'int64=', 'set_int64'
    alias_method 'int=', 'set_int'
    alias_method 'interned_string=', 'set_interned_string'
    alias_method 'long', 'get_long'
    alias_method 'long=', 'set_long'
    alias_method 'object', 'get_object'
    alias_method 'object=', 'set_object'
    alias_method 'param', 'get_param'
    alias_method 'param=', 'set_param'
    alias_method 'pointer', 'get_pointer'
    alias_method 'pointer=', 'set_pointer'
    alias_method 'schar', 'get_schar'
    alias_method 'schar=', 'set_schar'
    alias_method 'static_boxed=', 'set_static_boxed'
    alias_method 'static_string=', 'set_static_string'
    alias_method 'string', 'get_string'
    alias_method 'string=', 'set_string'
    alias_method 'string_take_ownership=', 'set_string_take_ownership'
    alias_method 'uchar', 'get_uchar'
    alias_method 'uchar=', 'set_uchar'
    alias_method 'uint', 'get_uint'
    alias_method 'uint64', 'get_uint64'
    alias_method 'uint64=', 'set_uint64'
    alias_method 'uint=', 'set_uint'
    alias_method 'ulong', 'get_ulong'
    alias_method 'ulong=', 'set_ulong'
    alias_method 'variant', 'get_variant'
    alias_method 'variant=', 'set_variant'
  end
  class GObject::ValueArray < GirFFI::BoxedBase
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def append(value = nil)
      _v1 = GObject::Value.from(value)
      _v2 = GObject::Lib.g_value_array_append(self, _v1)
      _v3 = GObject::ValueArray.wrap_copy(_v2)
      return _v3
    end
    def copy
      _v1 = GObject::Lib.g_value_array_copy(self)
      _v2 = GObject::ValueArray.wrap_own(_v1)
      return _v2
    end
    def get_nth(index_)
      _v1 = index_
      _v2 = GObject::Lib.g_value_array_get_nth(self, _v1)
      _v3 = GObject::Value.wrap(_v2).get_value
      return _v3
    end
    def insert(index_, value = nil)
      _v1 = index_
      _v2 = GObject::Value.from(value)
      _v3 = GObject::Lib.g_value_array_insert(self, _v1, _v2)
      _v4 = GObject::ValueArray.wrap_copy(_v3)
      return _v4
    end
    def n_prealloced
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(16)
      _v2
    end
    def n_values
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(0)
      _v2
    end
    def n_values=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(0, _v2)
    end
    def prepend(value = nil)
      _v1 = GObject::Value.from(value)
      _v2 = GObject::Lib.g_value_array_prepend(self, _v1)
      _v3 = GObject::ValueArray.wrap_copy(_v2)
      return _v3
    end
    def remove(index_)
      _v1 = index_
      _v2 = GObject::Lib.g_value_array_remove(self, _v1)
      _v3 = GObject::ValueArray.wrap_copy(_v2)
      return _v3
    end
    def sort(&compare_func)
      _v1 = GLib::CompareDataFunc.from(compare_func)
      _v2 = GirFFI::ArgHelper.store(_v1)
      _v3 = GObject::Lib.g_value_array_sort_with_data(self, _v1, _v2)
      _v4 = GObject::ValueArray.wrap_copy(_v3)
      return _v4
    end
    def values
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(8)
      _v3 = GObject::Value.wrap(_v2)
      _v3
    end
    def values=(value)
      _v1 = @struct.to_ptr
      _v2 = GObject::Value.copy_from(value)
      _v1.put_pointer(8, _v2)
    end
    alias_method 'nth', 'get_nth'
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print boxed
  # XXX: Don't know how to print callback
  class GObject::WeakRef < GirFFI::StructBase
  
  
  end
  # XXX: Don't know how to print union
  def self.boxed_copy(boxed_type, src_boxed)
    _v1 = boxed_type
    _v2 = src_boxed
    _v3 = GObject::Lib.g_boxed_copy(_v1, _v2)
    return _v3
  end
  def self.boxed_free(boxed_type, boxed)
    _v1 = boxed_type
    _v2 = boxed
    GObject::Lib.g_boxed_free(_v1, _v2)
  end
  def self.boxed_type_register_static(name, boxed_copy, boxed_free)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GObject::BoxedCopyFunc.from(boxed_copy)
    _v3 = GObject::BoxedFreeFunc.from(boxed_free)
    _v4 = GObject::Lib.g_boxed_type_register_static(_v1, _v2, _v3)
    return _v4
  end
  def self.cclosure_marshal_BOOLEAN__BOXED_BOXED(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = invocation_hint
    _v6 = marshal_data
    GObject::Lib.g_cclosure_marshal_BOOLEAN__BOXED_BOXED(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_BOOLEAN__FLAGS(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = invocation_hint
    _v6 = marshal_data
    GObject::Lib.g_cclosure_marshal_BOOLEAN__FLAGS(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_STRING__OBJECT_POINTER(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = invocation_hint
    _v6 = marshal_data
    GObject::Lib.g_cclosure_marshal_STRING__OBJECT_POINTER(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__BOOLEAN(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = invocation_hint
    _v6 = marshal_data
    GObject::Lib.g_cclosure_marshal_VOID__BOOLEAN(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__BOXED(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = invocation_hint
    _v6 = marshal_data
    GObject::Lib.g_cclosure_marshal_VOID__BOXED(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__CHAR(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = invocation_hint
    _v6 = marshal_data
    GObject::Lib.g_cclosure_marshal_VOID__CHAR(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__DOUBLE(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = invocation_hint
    _v6 = marshal_data
    GObject::Lib.g_cclosure_marshal_VOID__DOUBLE(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__ENUM(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = invocation_hint
    _v6 = marshal_data
    GObject::Lib.g_cclosure_marshal_VOID__ENUM(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__FLAGS(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = invocation_hint
    _v6 = marshal_data
    GObject::Lib.g_cclosure_marshal_VOID__FLAGS(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__FLOAT(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = invocation_hint
    _v6 = marshal_data
    GObject::Lib.g_cclosure_marshal_VOID__FLOAT(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__INT(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = invocation_hint
    _v6 = marshal_data
    GObject::Lib.g_cclosure_marshal_VOID__INT(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__LONG(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = invocation_hint
    _v6 = marshal_data
    GObject::Lib.g_cclosure_marshal_VOID__LONG(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__OBJECT(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = invocation_hint
    _v6 = marshal_data
    GObject::Lib.g_cclosure_marshal_VOID__OBJECT(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__PARAM(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = invocation_hint
    _v6 = marshal_data
    GObject::Lib.g_cclosure_marshal_VOID__PARAM(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__POINTER(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = invocation_hint
    _v6 = marshal_data
    GObject::Lib.g_cclosure_marshal_VOID__POINTER(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__STRING(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = invocation_hint
    _v6 = marshal_data
    GObject::Lib.g_cclosure_marshal_VOID__STRING(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__UCHAR(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = invocation_hint
    _v6 = marshal_data
    GObject::Lib.g_cclosure_marshal_VOID__UCHAR(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__UINT(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = invocation_hint
    _v6 = marshal_data
    GObject::Lib.g_cclosure_marshal_VOID__UINT(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__UINT_POINTER(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = invocation_hint
    _v6 = marshal_data
    GObject::Lib.g_cclosure_marshal_VOID__UINT_POINTER(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__ULONG(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = invocation_hint
    _v6 = marshal_data
    GObject::Lib.g_cclosure_marshal_VOID__ULONG(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__VARIANT(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = invocation_hint
    _v6 = marshal_data
    GObject::Lib.g_cclosure_marshal_VOID__VARIANT(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__VOID(closure, return_value, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = invocation_hint
    _v6 = marshal_data
    GObject::Lib.g_cclosure_marshal_VOID__VOID(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_generic(closure, return_gvalue, n_param_values, param_values, invocation_hint = nil, marshal_data = nil)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_gvalue)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = invocation_hint
    _v6 = marshal_data
    GObject::Lib.g_cclosure_marshal_generic(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.clear_signal_handler(handler_id_ptr, instance)
    _v1 = handler_id_ptr
    _v2 = GObject::Object.from(instance)
    GObject::Lib.g_clear_signal_handler(_v1, _v2)
  end
  def self.enum_complete_type_info(g_enum_type, const_values)
    _v1 = g_enum_type
    _v2 = FFI::MemoryPointer.new(GObject::TypeInfo)
    _v3 = GirFFI::ZeroTerminated.from(GObject::EnumValue, const_values)
    GObject::Lib.g_enum_complete_type_info(_v1, _v2, _v3)
    _v4 = GObject::TypeInfo.wrap_own(GObject::TypeInfo.get_value_from_pointer(_v2, 0))
    return _v4
  end
  def self.enum_get_value(enum_class, value)
    _v1 = GObject::EnumClass.from(enum_class)
    _v2 = value
    _v3 = GObject::Lib.g_enum_get_value(_v1, _v2)
    _v4 = GObject::EnumValue.wrap_copy(_v3)
    return _v4
  end
  def self.enum_get_value_by_name(enum_class, name)
    _v1 = GObject::EnumClass.from(enum_class)
    _v2 = GirFFI::InPointer.from_utf8(name)
    _v3 = GObject::Lib.g_enum_get_value_by_name(_v1, _v2)
    _v4 = GObject::EnumValue.wrap_copy(_v3)
    return _v4
  end
  def self.enum_get_value_by_nick(enum_class, nick)
    _v1 = GObject::EnumClass.from(enum_class)
    _v2 = GirFFI::InPointer.from_utf8(nick)
    _v3 = GObject::Lib.g_enum_get_value_by_nick(_v1, _v2)
    _v4 = GObject::EnumValue.wrap_copy(_v3)
    return _v4
  end
  def self.enum_register_static(name, const_static_values)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GirFFI::ZeroTerminated.from(GObject::EnumValue, const_static_values)
    _v3 = GObject::Lib.g_enum_register_static(_v1, _v2)
    return _v3
  end
  def self.enum_to_string(g_enum_type, value)
    _v1 = g_enum_type
    _v2 = value
    _v3 = GObject::Lib.g_enum_to_string(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.flags_complete_type_info(g_flags_type, const_values)
    _v1 = g_flags_type
    _v2 = FFI::MemoryPointer.new(GObject::TypeInfo)
    _v3 = GirFFI::ZeroTerminated.from(GObject::FlagsValue, const_values)
    GObject::Lib.g_flags_complete_type_info(_v1, _v2, _v3)
    _v4 = GObject::TypeInfo.wrap_own(GObject::TypeInfo.get_value_from_pointer(_v2, 0))
    return _v4
  end
  def self.flags_get_first_value(flags_class, value)
    _v1 = GObject::FlagsClass.from(flags_class)
    _v2 = value
    _v3 = GObject::Lib.g_flags_get_first_value(_v1, _v2)
    _v4 = GObject::FlagsValue.wrap_copy(_v3)
    return _v4
  end
  def self.flags_get_value_by_name(flags_class, name)
    _v1 = GObject::FlagsClass.from(flags_class)
    _v2 = GirFFI::InPointer.from_utf8(name)
    _v3 = GObject::Lib.g_flags_get_value_by_name(_v1, _v2)
    _v4 = GObject::FlagsValue.wrap_copy(_v3)
    return _v4
  end
  def self.flags_get_value_by_nick(flags_class, nick)
    _v1 = GObject::FlagsClass.from(flags_class)
    _v2 = GirFFI::InPointer.from_utf8(nick)
    _v3 = GObject::Lib.g_flags_get_value_by_nick(_v1, _v2)
    _v4 = GObject::FlagsValue.wrap_copy(_v3)
    return _v4
  end
  def self.flags_register_static(name, const_static_values)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GirFFI::ZeroTerminated.from(GObject::FlagsValue, const_static_values)
    _v3 = GObject::Lib.g_flags_register_static(_v1, _v2)
    return _v3
  end
  def self.flags_to_string(flags_type, value)
    _v1 = flags_type
    _v2 = value
    _v3 = GObject::Lib.g_flags_to_string(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.gtype_get_type
    _v1 = GObject::Lib.g_gtype_get_type
    return _v1
  end
  def self.param_spec_boolean(name, nick, blurb, default_value, flags)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GirFFI::InPointer.from_utf8(nick)
    _v3 = GirFFI::InPointer.from_utf8(blurb)
    _v4 = default_value
    _v5 = flags
    _v6 = GObject::Lib.g_param_spec_boolean(_v1, _v2, _v3, _v4, _v5)
    _v7 = GObject::ParamSpec.wrap(_v6)
    return _v7
  end
  def self.param_spec_boxed(name, nick, blurb, boxed_type, flags)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GirFFI::InPointer.from_utf8(nick)
    _v3 = GirFFI::InPointer.from_utf8(blurb)
    _v4 = boxed_type
    _v5 = flags
    _v6 = GObject::Lib.g_param_spec_boxed(_v1, _v2, _v3, _v4, _v5)
    _v7 = GObject::ParamSpec.wrap(_v6)
    return _v7
  end
  def self.param_spec_char(name, nick, blurb, minimum, maximum, default_value, flags)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GirFFI::InPointer.from_utf8(nick)
    _v3 = GirFFI::InPointer.from_utf8(blurb)
    _v4 = minimum
    _v5 = maximum
    _v6 = default_value
    _v7 = flags
    _v8 = GObject::Lib.g_param_spec_char(_v1, _v2, _v3, _v4, _v5, _v6, _v7)
    _v9 = GObject::ParamSpec.wrap(_v8)
    return _v9
  end
  def self.param_spec_double(name, nick, blurb, minimum, maximum, default_value, flags)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GirFFI::InPointer.from_utf8(nick)
    _v3 = GirFFI::InPointer.from_utf8(blurb)
    _v4 = minimum
    _v5 = maximum
    _v6 = default_value
    _v7 = flags
    _v8 = GObject::Lib.g_param_spec_double(_v1, _v2, _v3, _v4, _v5, _v6, _v7)
    _v9 = GObject::ParamSpec.wrap(_v8)
    return _v9
  end
  def self.param_spec_enum(name, nick, blurb, enum_type, default_value, flags)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GirFFI::InPointer.from_utf8(nick)
    _v3 = GirFFI::InPointer.from_utf8(blurb)
    _v4 = enum_type
    _v5 = default_value
    _v6 = flags
    _v7 = GObject::Lib.g_param_spec_enum(_v1, _v2, _v3, _v4, _v5, _v6)
    _v8 = GObject::ParamSpec.wrap(_v7)
    return _v8
  end
  def self.param_spec_flags(name, nick, blurb, flags_type, default_value, flags)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GirFFI::InPointer.from_utf8(nick)
    _v3 = GirFFI::InPointer.from_utf8(blurb)
    _v4 = flags_type
    _v5 = default_value
    _v6 = flags
    _v7 = GObject::Lib.g_param_spec_flags(_v1, _v2, _v3, _v4, _v5, _v6)
    _v8 = GObject::ParamSpec.wrap(_v7)
    return _v8
  end
  def self.param_spec_float(name, nick, blurb, minimum, maximum, default_value, flags)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GirFFI::InPointer.from_utf8(nick)
    _v3 = GirFFI::InPointer.from_utf8(blurb)
    _v4 = minimum
    _v5 = maximum
    _v6 = default_value
    _v7 = flags
    _v8 = GObject::Lib.g_param_spec_float(_v1, _v2, _v3, _v4, _v5, _v6, _v7)
    _v9 = GObject::ParamSpec.wrap(_v8)
    return _v9
  end
  def self.param_spec_gtype(name, nick, blurb, is_a_type, flags)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GirFFI::InPointer.from_utf8(nick)
    _v3 = GirFFI::InPointer.from_utf8(blurb)
    _v4 = is_a_type
    _v5 = flags
    _v6 = GObject::Lib.g_param_spec_gtype(_v1, _v2, _v3, _v4, _v5)
    _v7 = GObject::ParamSpec.wrap(_v6)
    return _v7
  end
  def self.param_spec_int(name, nick, blurb, minimum, maximum, default_value, flags)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GirFFI::InPointer.from_utf8(nick)
    _v3 = GirFFI::InPointer.from_utf8(blurb)
    _v4 = minimum
    _v5 = maximum
    _v6 = default_value
    _v7 = flags
    _v8 = GObject::Lib.g_param_spec_int(_v1, _v2, _v3, _v4, _v5, _v6, _v7)
    _v9 = GObject::ParamSpec.wrap(_v8)
    return _v9
  end
  def self.param_spec_int64(name, nick, blurb, minimum, maximum, default_value, flags)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GirFFI::InPointer.from_utf8(nick)
    _v3 = GirFFI::InPointer.from_utf8(blurb)
    _v4 = minimum
    _v5 = maximum
    _v6 = default_value
    _v7 = flags
    _v8 = GObject::Lib.g_param_spec_int64(_v1, _v2, _v3, _v4, _v5, _v6, _v7)
    _v9 = GObject::ParamSpec.wrap(_v8)
    return _v9
  end
  def self.param_spec_long(name, nick, blurb, minimum, maximum, default_value, flags)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GirFFI::InPointer.from_utf8(nick)
    _v3 = GirFFI::InPointer.from_utf8(blurb)
    _v4 = minimum
    _v5 = maximum
    _v6 = default_value
    _v7 = flags
    _v8 = GObject::Lib.g_param_spec_long(_v1, _v2, _v3, _v4, _v5, _v6, _v7)
    _v9 = GObject::ParamSpec.wrap(_v8)
    return _v9
  end
  def self.param_spec_object(name, nick, blurb, object_type, flags)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GirFFI::InPointer.from_utf8(nick)
    _v3 = GirFFI::InPointer.from_utf8(blurb)
    _v4 = object_type
    _v5 = flags
    _v6 = GObject::Lib.g_param_spec_object(_v1, _v2, _v3, _v4, _v5)
    _v7 = GObject::ParamSpec.wrap(_v6)
    return _v7
  end
  def self.param_spec_param(name, nick, blurb, param_type, flags)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GirFFI::InPointer.from_utf8(nick)
    _v3 = GirFFI::InPointer.from_utf8(blurb)
    _v4 = param_type
    _v5 = flags
    _v6 = GObject::Lib.g_param_spec_param(_v1, _v2, _v3, _v4, _v5)
    _v7 = GObject::ParamSpec.wrap(_v6)
    return _v7
  end
  def self.param_spec_pointer(name, nick, blurb, flags)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GirFFI::InPointer.from_utf8(nick)
    _v3 = GirFFI::InPointer.from_utf8(blurb)
    _v4 = flags
    _v5 = GObject::Lib.g_param_spec_pointer(_v1, _v2, _v3, _v4)
    _v6 = GObject::ParamSpec.wrap(_v5)
    return _v6
  end
  def self.param_spec_string(name, nick, blurb, default_value, flags)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GirFFI::InPointer.from_utf8(nick)
    _v3 = GirFFI::InPointer.from_utf8(blurb)
    _v4 = GirFFI::InPointer.from_utf8(default_value)
    _v5 = flags
    _v6 = GObject::Lib.g_param_spec_string(_v1, _v2, _v3, _v4, _v5)
    _v7 = GObject::ParamSpec.wrap(_v6)
    return _v7
  end
  def self.param_spec_uchar(name, nick, blurb, minimum, maximum, default_value, flags)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GirFFI::InPointer.from_utf8(nick)
    _v3 = GirFFI::InPointer.from_utf8(blurb)
    _v4 = minimum
    _v5 = maximum
    _v6 = default_value
    _v7 = flags
    _v8 = GObject::Lib.g_param_spec_uchar(_v1, _v2, _v3, _v4, _v5, _v6, _v7)
    _v9 = GObject::ParamSpec.wrap(_v8)
    return _v9
  end
  def self.param_spec_uint(name, nick, blurb, minimum, maximum, default_value, flags)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GirFFI::InPointer.from_utf8(nick)
    _v3 = GirFFI::InPointer.from_utf8(blurb)
    _v4 = minimum
    _v5 = maximum
    _v6 = default_value
    _v7 = flags
    _v8 = GObject::Lib.g_param_spec_uint(_v1, _v2, _v3, _v4, _v5, _v6, _v7)
    _v9 = GObject::ParamSpec.wrap(_v8)
    return _v9
  end
  def self.param_spec_uint64(name, nick, blurb, minimum, maximum, default_value, flags)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GirFFI::InPointer.from_utf8(nick)
    _v3 = GirFFI::InPointer.from_utf8(blurb)
    _v4 = minimum
    _v5 = maximum
    _v6 = default_value
    _v7 = flags
    _v8 = GObject::Lib.g_param_spec_uint64(_v1, _v2, _v3, _v4, _v5, _v6, _v7)
    _v9 = GObject::ParamSpec.wrap(_v8)
    return _v9
  end
  def self.param_spec_ulong(name, nick, blurb, minimum, maximum, default_value, flags)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GirFFI::InPointer.from_utf8(nick)
    _v3 = GirFFI::InPointer.from_utf8(blurb)
    _v4 = minimum
    _v5 = maximum
    _v6 = default_value
    _v7 = flags
    _v8 = GObject::Lib.g_param_spec_ulong(_v1, _v2, _v3, _v4, _v5, _v6, _v7)
    _v9 = GObject::ParamSpec.wrap(_v8)
    return _v9
  end
  def self.param_spec_unichar(name, nick, blurb, default_value, flags)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GirFFI::InPointer.from_utf8(nick)
    _v3 = GirFFI::InPointer.from_utf8(blurb)
    _v4 = default_value
    _v5 = flags
    _v6 = GObject::Lib.g_param_spec_unichar(_v1, _v2, _v3, _v4, _v5)
    _v7 = GObject::ParamSpec.wrap(_v6)
    return _v7
  end
  def self.param_spec_variant(name, nick, blurb, type, default_value, flags)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GirFFI::InPointer.from_utf8(nick)
    _v3 = GirFFI::InPointer.from_utf8(blurb)
    _v4 = GLib::VariantType.from(type)
    _v5 = GLib::Variant.copy_from(default_value)
    _v6 = flags
    _v7 = GObject::Lib.g_param_spec_variant(_v1, _v2, _v3, _v4, _v5, _v6)
    _v8 = GObject::ParamSpec.wrap(_v7)
    return _v8
  end
  def self.param_type_register_static(name, pspec_info)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GObject::ParamSpecTypeInfo.from(pspec_info)
    _v3 = GObject::Lib.g_param_type_register_static(_v1, _v2)
    return _v3
  end
  def self.param_value_convert(pspec, src_value, dest_value, strict_validation)
    _v1 = GObject::ParamSpec.from(pspec)
    _v2 = GObject::Value.from(src_value)
    _v3 = GObject::Value.from(dest_value)
    _v4 = strict_validation
    _v5 = GObject::Lib.g_param_value_convert(_v1, _v2, _v3, _v4)
    return _v5
  end
  def self.param_value_defaults(pspec, value)
    _v1 = GObject::ParamSpec.from(pspec)
    _v2 = GObject::Value.from(value)
    _v3 = GObject::Lib.g_param_value_defaults(_v1, _v2)
    return _v3
  end
  def self.param_value_is_valid(pspec, value)
    _v1 = GObject::ParamSpec.from(pspec)
    _v2 = GObject::Value.from(value)
    _v3 = GObject::Lib.g_param_value_is_valid(_v1, _v2)
    return _v3
  end
  def self.param_value_set_default(pspec, value)
    _v1 = GObject::ParamSpec.from(pspec)
    _v2 = GObject::Value.from(value)
    GObject::Lib.g_param_value_set_default(_v1, _v2)
  end
  def self.param_value_validate(pspec, value)
    _v1 = GObject::ParamSpec.from(pspec)
    _v2 = GObject::Value.from(value)
    _v3 = GObject::Lib.g_param_value_validate(_v1, _v2)
    return _v3
  end
  def self.param_values_cmp(pspec, value1, value2)
    _v1 = GObject::ParamSpec.from(pspec)
    _v2 = GObject::Value.from(value1)
    _v3 = GObject::Value.from(value2)
    _v4 = GObject::Lib.g_param_values_cmp(_v1, _v2, _v3)
    return _v4
  end
  def self.pointer_type_register_static(name)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GObject::Lib.g_pointer_type_register_static(_v1)
    return _v2
  end
  def self.signal_accumulator_first_wins(ihint, return_accu, handler_return, dummy = nil)
    _v1 = GObject::SignalInvocationHint.from(ihint)
    _v2 = GObject::Value.from(return_accu)
    _v3 = GObject::Value.from(handler_return)
    _v4 = dummy
    _v5 = GObject::Lib.g_signal_accumulator_first_wins(_v1, _v2, _v3, _v4)
    return _v5
  end
  def self.signal_accumulator_true_handled(ihint, return_accu, handler_return, dummy = nil)
    _v1 = GObject::SignalInvocationHint.from(ihint)
    _v2 = GObject::Value.from(return_accu)
    _v3 = GObject::Value.from(handler_return)
    _v4 = dummy
    _v5 = GObject::Lib.g_signal_accumulator_true_handled(_v1, _v2, _v3, _v4)
    return _v5
  end
  def self.signal_add_emission_hook(signal_id, detail, &hook_func)
    _v1 = signal_id
    _v2 = detail
    _v3 = GObject::SignalEmissionHook.from(hook_func)
    _v4 = GirFFI::ArgHelper.store(_v3)
    _v5 = GLib::DestroyNotify.default
    _v6 = GObject::Lib.g_signal_add_emission_hook(_v1, _v2, _v3, _v4, _v5)
    return _v6
  end
  def self.signal_chain_from_overridden(instance_and_params, return_value)
    _v1 = GirFFI::SizedArray.from(GObject::Value, -1, instance_and_params)
    _v2 = GObject::Value.from(return_value)
    GObject::Lib.g_signal_chain_from_overridden(_v1, _v2)
  end
  def self.signal_connect_closure(instance, detailed_signal, closure, after)
    _v1 = GObject::Object.from(instance)
    _v2 = GirFFI::InPointer.from_utf8(detailed_signal)
    _v3 = GObject::Closure.from(closure)
    _v4 = after
    _v5 = GObject::Lib.g_signal_connect_closure(_v1, _v2, _v3, _v4)
    return _v5
  end
  def self.signal_connect_closure_by_id(instance, signal_id, detail, closure, after)
    _v1 = GObject::Object.from(instance)
    _v2 = signal_id
    _v3 = detail
    _v4 = GObject::Closure.from(closure)
    _v5 = after
    _v6 = GObject::Lib.g_signal_connect_closure_by_id(_v1, _v2, _v3, _v4, _v5)
    return _v6
  end
  def self.signal_emitv(instance_and_params, signal_id, detail, return_value)
    _v1 = GirFFI::SizedArray.from(GObject::Value, -1, instance_and_params)
    _v2 = signal_id
    _v3 = detail
    _v4 = FFI::MemoryPointer.new(GObject::Value)
    GObject::Value.copy_value_to_pointer(GObject::Value.copy_from(return_value), _v4)
    GObject::Lib.g_signal_emitv(_v1, _v2, _v3, _v4)
    _v5 = GObject::Value.wrap(GObject::Value.get_value_from_pointer(_v4, 0)).get_value
    return _v5
  end
  def self.signal_get_invocation_hint(instance)
    _v1 = GObject::Object.from(instance)
    _v2 = GObject::Lib.g_signal_get_invocation_hint(_v1)
    _v3 = GObject::SignalInvocationHint.wrap_copy(_v2)
    return _v3
  end
  def self.signal_handler_block(instance, handler_id)
    _v1 = GObject::Object.from(instance)
    _v2 = handler_id
    GObject::Lib.g_signal_handler_block(_v1, _v2)
  end
  def self.signal_handler_disconnect(instance, handler_id)
    _v1 = GObject::Object.from(instance)
    _v2 = handler_id
    GObject::Lib.g_signal_handler_disconnect(_v1, _v2)
  end
  def self.signal_handler_find(instance, mask, signal_id, detail, closure = nil, func = nil, data = nil)
    _v1 = GObject::Object.from(instance)
    _v2 = mask
    _v3 = signal_id
    _v4 = detail
    _v5 = GObject::Closure.from(closure)
    _v6 = func
    _v7 = data
    _v8 = GObject::Lib.g_signal_handler_find(_v1, _v2, _v3, _v4, _v5, _v6, _v7)
    return _v8
  end
  def self.signal_handler_is_connected(instance, handler_id)
    _v1 = GObject::Object.from(instance)
    _v2 = handler_id
    _v3 = GObject::Lib.g_signal_handler_is_connected(_v1, _v2)
    return _v3
  end
  def self.signal_handler_unblock(instance, handler_id)
    _v1 = GObject::Object.from(instance)
    _v2 = handler_id
    GObject::Lib.g_signal_handler_unblock(_v1, _v2)
  end
  def self.signal_handlers_block_matched(instance, mask, signal_id, detail, closure = nil, func = nil, data = nil)
    _v1 = GObject::Object.from(instance)
    _v2 = mask
    _v3 = signal_id
    _v4 = detail
    _v5 = GObject::Closure.from(closure)
    _v6 = func
    _v7 = data
    _v8 = GObject::Lib.g_signal_handlers_block_matched(_v1, _v2, _v3, _v4, _v5, _v6, _v7)
    return _v8
  end
  def self.signal_handlers_destroy(instance)
    _v1 = GObject::Object.from(instance)
    GObject::Lib.g_signal_handlers_destroy(_v1)
  end
  def self.signal_handlers_disconnect_matched(instance, mask, signal_id, detail, closure = nil, func = nil, data = nil)
    _v1 = GObject::Object.from(instance)
    _v2 = mask
    _v3 = signal_id
    _v4 = detail
    _v5 = GObject::Closure.from(closure)
    _v6 = func
    _v7 = data
    _v8 = GObject::Lib.g_signal_handlers_disconnect_matched(_v1, _v2, _v3, _v4, _v5, _v6, _v7)
    return _v8
  end
  def self.signal_handlers_unblock_matched(instance, mask, signal_id, detail, closure = nil, func = nil, data = nil)
    _v1 = GObject::Object.from(instance)
    _v2 = mask
    _v3 = signal_id
    _v4 = detail
    _v5 = GObject::Closure.from(closure)
    _v6 = func
    _v7 = data
    _v8 = GObject::Lib.g_signal_handlers_unblock_matched(_v1, _v2, _v3, _v4, _v5, _v6, _v7)
    return _v8
  end
  def self.signal_has_handler_pending(instance, signal_id, detail, may_be_blocked)
    _v1 = GObject::Object.from(instance)
    _v2 = signal_id
    _v3 = detail
    _v4 = may_be_blocked
    _v5 = GObject::Lib.g_signal_has_handler_pending(_v1, _v2, _v3, _v4)
    return _v5
  end
  def self.signal_is_valid_name(name)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = GObject::Lib.g_signal_is_valid_name(_v1)
    return _v2
  end
  def self.signal_list_ids(itype)
    _v1 = itype
    _v2 = FFI::MemoryPointer.new(:uint32)
    _v3 = GObject::Lib.g_signal_list_ids(_v1, _v2)
    _v4 = _v2.get_uint32(0)
    _v5 = GirFFI::SizedArray.wrap(:guint32, _v4, _v3)
    return _v5
  end
  def self.signal_lookup(name, itype)
    _v1 = GirFFI::InPointer.from_utf8(name)
    _v2 = itype
    _v3 = GObject::Lib.g_signal_lookup(_v1, _v2)
    return _v3
  end
  def self.signal_name(signal_id)
    _v1 = signal_id
    _v2 = GObject::Lib.g_signal_name(_v1)
    _v3 = _v2.to_utf8
    return _v3
  end
  def self.signal_override_class_closure(signal_id, instance_type, class_closure)
    _v1 = signal_id
    _v2 = instance_type
    _v3 = GObject::Closure.from(class_closure)
    GObject::Lib.g_signal_override_class_closure(_v1, _v2, _v3)
  end
  def self.signal_override_class_handler(signal_name, instance_type, &class_handler)
    _v1 = GirFFI::InPointer.from_utf8(signal_name)
    _v2 = instance_type
    _v3 = GObject::Callback.from(class_handler)
    GObject::Lib.g_signal_override_class_handler(_v1, _v2, _v3)
  end
  def self.signal_parse_name(detailed_signal, itype, force_detail_quark)
    _v1 = GirFFI::InPointer.from_utf8(detailed_signal)
    _v2 = itype
    _v3 = FFI::MemoryPointer.new(:uint32)
    _v4 = FFI::MemoryPointer.new(:uint32)
    _v5 = force_detail_quark
    _v6 = GObject::Lib.g_signal_parse_name(_v1, _v2, _v3, _v4, _v5)
    _v7 = _v3.get_uint32(0)
    _v8 = _v4.get_uint32(0)
    return [_v6, _v7, _v8]
  end
  def self.signal_query(signal_id)
    _v1 = signal_id
    _v2 = GObject::SignalQuery.new
    GObject::Lib.g_signal_query(_v1, _v2)
    return _v2
  end
  def self.signal_remove_emission_hook(signal_id, hook_id)
    _v1 = signal_id
    _v2 = hook_id
    GObject::Lib.g_signal_remove_emission_hook(_v1, _v2)
  end
  def self.signal_stop_emission(instance, signal_id, detail)
    _v1 = GObject::Object.from(instance)
    _v2 = signal_id
    _v3 = detail
    GObject::Lib.g_signal_stop_emission(_v1, _v2, _v3)
  end
  def self.signal_stop_emission_by_name(instance, detailed_signal)
    _v1 = GObject::Object.from(instance)
    _v2 = GirFFI::InPointer.from_utf8(detailed_signal)
    GObject::Lib.g_signal_stop_emission_by_name(_v1, _v2)
  end
  def self.signal_type_cclosure_new(itype, struct_offset)
    _v1 = itype
    _v2 = struct_offset
    _v3 = GObject::Lib.g_signal_type_cclosure_new(_v1, _v2)
    _v4 = GObject::Closure.wrap_copy(_v3)
    return _v4
  end
  def self.source_set_closure(source, closure)
    _v1 = GLib::Source.from(source)
    _v2 = GObject::Closure.from(closure)
    GObject::Lib.g_source_set_closure(_v1, _v2)
  end
  def self.source_set_dummy_callback(source)
    _v1 = GLib::Source.from(source)
    GObject::Lib.g_source_set_dummy_callback(_v1)
  end
  def self.strdup_value_contents(value)
    _v1 = GObject::Value.from(value)
    _v2 = GObject::Lib.g_strdup_value_contents(_v1)
    _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
    return _v3
  end
  def self.type_add_class_private(class_type, private_size)
    _v1 = class_type
    _v2 = private_size
    GObject::Lib.g_type_add_class_private(_v1, _v2)
  end
  def self.type_add_instance_private(class_type, private_size)
    _v1 = class_type
    _v2 = private_size
    _v3 = GObject::Lib.g_type_add_instance_private(_v1, _v2)
    return _v3
  end
  def self.type_add_interface_dynamic(instance_type, interface_type, plugin)
    _v1 = instance_type
    _v2 = interface_type
    _v3 = plugin
    GObject::Lib.g_type_add_interface_dynamic(_v1, _v2, _v3)
  end
  def self.type_add_interface_static(instance_type, interface_type, info)
    _v1 = instance_type
    _v2 = interface_type
    _v3 = GObject::InterfaceInfo.from(info)
    GObject::Lib.g_type_add_interface_static(_v1, _v2, _v3)
  end
  def self.type_check_class_is_a(g_class, is_a_type)
    _v1 = GObject::TypeClass.from(g_class)
    _v2 = is_a_type
    _v3 = GObject::Lib.g_type_check_class_is_a(_v1, _v2)
    return _v3
  end
  def self.type_check_instance(instance)
    _v1 = GObject::TypeInstance.from(instance)
    _v2 = GObject::Lib.g_type_check_instance(_v1)
    return _v2
  end
  def self.type_check_instance_is_a(instance, iface_type)
    _v1 = GObject::TypeInstance.from(instance)
    _v2 = iface_type
    _v3 = GObject::Lib.g_type_check_instance_is_a(_v1, _v2)
    return _v3
  end
  def self.type_check_instance_is_fundamentally_a(instance, fundamental_type)
    _v1 = GObject::TypeInstance.from(instance)
    _v2 = fundamental_type
    _v3 = GObject::Lib.g_type_check_instance_is_fundamentally_a(_v1, _v2)
    return _v3
  end
  def self.type_check_is_value_type(type)
    _v1 = type
    _v2 = GObject::Lib.g_type_check_is_value_type(_v1)
    return _v2
  end
  def self.type_check_value(value)
    _v1 = GObject::Value.from(value)
    _v2 = GObject::Lib.g_type_check_value(_v1)
    return _v2
  end
  def self.type_check_value_holds(value, type)
    _v1 = GObject::Value.from(value)
    _v2 = type
    _v3 = GObject::Lib.g_type_check_value_holds(_v1, _v2)
    return _v3
  end
  def self.type_children(type)
    _v1 = type
    _v2 = FFI::MemoryPointer.new(:uint32)
    _v3 = GObject::Lib.g_type_children(_v1, _v2)
    _v4 = _v2.get_uint32(0)
    _v5 = GirFFI::SizedArray.wrap(:GType, _v4, _v3)
    return _v5
  end
  def self.type_class_adjust_private_offset(g_class, private_size_or_offset)
    _v1 = g_class
    _v2 = private_size_or_offset
    GObject::Lib.g_type_class_adjust_private_offset(_v1, _v2)
  end
  def self.type_class_get(type)
    _v1 = type
    _v2 = GObject::Lib.g_type_class_get(_v1)
    _v3 = GObject::TypeClass.wrap_copy(_v2)
    return _v3
  end
  def self.type_class_peek(type)
    _v1 = type
    _v2 = GObject::Lib.g_type_class_peek(_v1)
    _v3 = GObject::TypeClass.wrap_copy(_v2)
    return _v3
  end
  def self.type_class_peek_static(type)
    _v1 = type
    _v2 = GObject::Lib.g_type_class_peek_static(_v1)
    _v3 = GObject::TypeClass.wrap_copy(_v2)
    return _v3
  end
  def self.type_class_ref(type)
    _v1 = type
    _v2 = GObject::Lib.g_type_class_ref(_v1)
    _v3 = GObject::TypeClass.wrap_copy(_v2)
    return _v3
  end
  def self.type_default_interface_get(g_type)
    _v1 = g_type
    _v2 = GObject::Lib.g_type_default_interface_get(_v1)
    _v3 = GObject::TypeInterface.wrap_copy(_v2)
    return _v3
  end
  def self.type_default_interface_peek(g_type)
    _v1 = g_type
    _v2 = GObject::Lib.g_type_default_interface_peek(_v1)
    _v3 = GObject::TypeInterface.wrap_copy(_v2)
    return _v3
  end
  def self.type_default_interface_ref(g_type)
    _v1 = g_type
    _v2 = GObject::Lib.g_type_default_interface_ref(_v1)
    _v3 = GObject::TypeInterface.wrap_copy(_v2)
    return _v3
  end
  def self.type_default_interface_unref(g_iface)
    _v1 = GObject::TypeInterface.from(g_iface)
    GObject::Lib.g_type_default_interface_unref(_v1)
  end
  def self.type_depth(type)
    _v1 = type
    _v2 = GObject::Lib.g_type_depth(_v1)
    return _v2
  end
  def self.type_ensure(type)
    _v1 = type
    GObject::Lib.g_type_ensure(_v1)
  end
  def self.type_free_instance(instance)
    _v1 = GObject::TypeInstance.from(instance)
    GObject::Lib.g_type_free_instance(_v1)
  end
  def self.type_from_name(name)
    Lib.g_type_from_name(name)
  end
  def self.type_fundamental(gtype)
    Lib.g_type_fundamental(gtype)
  end
  def self.type_fundamental_next
    _v1 = GObject::Lib.g_type_fundamental_next
    return _v1
  end
  def self.type_get_instance_count(type)
    _v1 = type
    _v2 = GObject::Lib.g_type_get_instance_count(_v1)
    return _v2
  end
  def self.type_get_plugin(type)
    _v1 = type
    _v2 = GObject::Lib.g_type_get_plugin(_v1)
    _v3 = GObject::TypePlugin.wrap(_v2)
    return _v3
  end
  def self.type_get_qdata(type, quark)
    _v1 = type
    _v2 = quark
    _v3 = GObject::Lib.g_type_get_qdata(_v1, _v2)
    return _v3
  end
  def self.type_get_type_registration_serial
    _v1 = GObject::Lib.g_type_get_type_registration_serial
    return _v1
  end
  def self.type_init
    GObject::Lib.g_type_init
  end
  def self.type_init_with_debug_flags(debug_flags)
    _v1 = debug_flags
    GObject::Lib.g_type_init_with_debug_flags(_v1)
  end
  def self.type_interface_add_prerequisite(interface_type, prerequisite_type)
    _v1 = interface_type
    _v2 = prerequisite_type
    GObject::Lib.g_type_interface_add_prerequisite(_v1, _v2)
  end
  def self.type_interface_get_plugin(instance_type, interface_type)
    _v1 = instance_type
    _v2 = interface_type
    _v3 = GObject::Lib.g_type_interface_get_plugin(_v1, _v2)
    _v4 = GObject::TypePlugin.wrap(_v3)
    return _v4
  end
  def self.type_interface_instantiatable_prerequisite(interface_type)
    _v1 = interface_type
    _v2 = GObject::Lib.g_type_interface_instantiatable_prerequisite(_v1)
    return _v2
  end
  def self.type_interface_peek(instance_class, iface_type)
    _v1 = GObject::TypeClass.from(instance_class)
    _v2 = iface_type
    _v3 = GObject::Lib.g_type_interface_peek(_v1, _v2)
    _v4 = GObject::TypeInterface.wrap_copy(_v3)
    return _v4
  end
  def self.type_interface_prerequisites(interface_type)
    _v1 = interface_type
    _v2 = FFI::MemoryPointer.new(:uint32)
    _v3 = GObject::Lib.g_type_interface_prerequisites(_v1, _v2)
    _v4 = _v2.get_uint32(0)
    _v5 = GirFFI::SizedArray.wrap(:GType, _v4, _v3)
    return _v5
  end
  def self.type_interfaces(type)
    _v1 = type
    _v2 = FFI::MemoryPointer.new(:uint32)
    _v3 = GObject::Lib.g_type_interfaces(_v1, _v2)
    _v4 = _v2.get_uint32(0)
    _v5 = GirFFI::SizedArray.wrap(:GType, _v4, _v3)
    return _v5
  end
  def self.type_is_a(type, is_a_type)
    _v1 = type
    _v2 = is_a_type
    _v3 = GObject::Lib.g_type_is_a(_v1, _v2)
    return _v3
  end
  def self.type_name(type)
    _v1 = type
    _v2 = GObject::Lib.g_type_name(_v1)
    _v3 = _v2.to_utf8
    return _v3
  end
  def self.type_name_from_class(g_class)
    _v1 = GObject::TypeClass.from(g_class)
    _v2 = GObject::Lib.g_type_name_from_class(_v1)
    _v3 = _v2.to_utf8
    return _v3
  end
  def self.type_name_from_instance(instance)
    type_name(type_from_instance(instance))
  end
  def self.type_next_base(leaf_type, root_type)
    _v1 = leaf_type
    _v2 = root_type
    _v3 = GObject::Lib.g_type_next_base(_v1, _v2)
    return _v3
  end
  def self.type_parent(type)
    _v1 = type
    _v2 = GObject::Lib.g_type_parent(_v1)
    return _v2
  end
  def self.type_qname(type)
    _v1 = type
    _v2 = GObject::Lib.g_type_qname(_v1)
    return _v2
  end
  def self.type_query(type)
    _v1 = type
    _v2 = GObject::TypeQuery.new
    GObject::Lib.g_type_query(_v1, _v2)
    return _v2
  end
  def self.type_register_dynamic(parent_type, type_name, plugin, flags)
    _v1 = parent_type
    _v2 = GirFFI::InPointer.from_utf8(type_name)
    _v3 = plugin
    _v4 = flags
    _v5 = GObject::Lib.g_type_register_dynamic(_v1, _v2, _v3, _v4)
    return _v5
  end
  def self.type_register_fundamental(type_id, type_name, info, finfo, flags)
    _v1 = type_id
    _v2 = GirFFI::InPointer.from_utf8(type_name)
    _v3 = GObject::TypeInfo.from(info)
    _v4 = GObject::TypeFundamentalInfo.from(finfo)
    _v5 = flags
    _v6 = GObject::Lib.g_type_register_fundamental(_v1, _v2, _v3, _v4, _v5)
    return _v6
  end
  def self.type_register_static(parent_type, type_name, info, flags)
    _v1 = parent_type
    _v2 = GirFFI::InPointer.from_utf8(type_name)
    _v3 = GObject::TypeInfo.from(info)
    _v4 = flags
    _v5 = GObject::Lib.g_type_register_static(_v1, _v2, _v3, _v4)
    return _v5
  end
  def self.type_set_qdata(type, quark, data = nil)
    _v1 = type
    _v2 = quark
    _v3 = data
    GObject::Lib.g_type_set_qdata(_v1, _v2, _v3)
  end
  def self.type_test_flags(type, flags)
    _v1 = type
    _v2 = flags
    _v3 = GObject::Lib.g_type_test_flags(_v1, _v2)
    return _v3
  end
  def self.value_type_compatible(src_type, dest_type)
    _v1 = src_type
    _v2 = dest_type
    _v3 = GObject::Lib.g_value_type_compatible(_v1, _v2)
    return _v3
  end
  def self.value_type_transformable(src_type, dest_type)
    _v1 = src_type
    _v2 = dest_type
    _v3 = GObject::Lib.g_value_type_transformable(_v1, _v2)
    return _v3
  end
  def self.variant_get_gtype
    _v1 = GObject::Lib.g_variant_get_gtype
    return _v1
  end
end
