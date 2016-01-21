module GObject
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  class GObject::Binding < GObject::Object
  
    def get_flags
      _v1 = GObject::Lib.g_binding_get_flags(self)
      return _v1
    end
    def get_source
      _v1 = GObject::Lib.g_binding_get_source(self)
      _v2 = GObject::Object.wrap(_v1)
      return _v2
    end
    def get_source_property
      _v1 = GObject::Lib.g_binding_get_source_property(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def get_target
      _v1 = GObject::Lib.g_binding_get_target(self)
      _v2 = GObject::Object.wrap(_v1)
      return _v2
    end
    def get_target_property
      _v1 = GObject::Lib.g_binding_get_target_property(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def unbind
      GObject::Lib.g_binding_unbind(self)
    end
    def flags
      get_property("flags")
    end
    def source
      get_property("source")
    end
    def source_property
      get_property("source-property")
    end
    def target
      get_property("target")
    end
    def target_property
      get_property("target-property")
    end
  end
  # XXX: Don't know how to print flags
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  class GObject::CClosure < GirFFI::StructBase
    def self.marshal_BOOLEAN__BOXED_BOXED(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = GirFFI::InPointer.from(:void, invocation_hint)
      _v6 = GirFFI::InPointer.from(:void, marshal_data)
      GObject::Lib.g_cclosure_marshal_BOOLEAN__BOXED_BOXED(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_BOOLEAN__FLAGS(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = GirFFI::InPointer.from(:void, invocation_hint)
      _v6 = GirFFI::InPointer.from(:void, marshal_data)
      GObject::Lib.g_cclosure_marshal_BOOLEAN__FLAGS(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_STRING__OBJECT_POINTER(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = GirFFI::InPointer.from(:void, invocation_hint)
      _v6 = GirFFI::InPointer.from(:void, marshal_data)
      GObject::Lib.g_cclosure_marshal_STRING__OBJECT_POINTER(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__BOOLEAN(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = GirFFI::InPointer.from(:void, invocation_hint)
      _v6 = GirFFI::InPointer.from(:void, marshal_data)
      GObject::Lib.g_cclosure_marshal_VOID__BOOLEAN(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__BOXED(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = GirFFI::InPointer.from(:void, invocation_hint)
      _v6 = GirFFI::InPointer.from(:void, marshal_data)
      GObject::Lib.g_cclosure_marshal_VOID__BOXED(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__CHAR(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = GirFFI::InPointer.from(:void, invocation_hint)
      _v6 = GirFFI::InPointer.from(:void, marshal_data)
      GObject::Lib.g_cclosure_marshal_VOID__CHAR(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__DOUBLE(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = GirFFI::InPointer.from(:void, invocation_hint)
      _v6 = GirFFI::InPointer.from(:void, marshal_data)
      GObject::Lib.g_cclosure_marshal_VOID__DOUBLE(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__ENUM(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = GirFFI::InPointer.from(:void, invocation_hint)
      _v6 = GirFFI::InPointer.from(:void, marshal_data)
      GObject::Lib.g_cclosure_marshal_VOID__ENUM(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__FLAGS(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = GirFFI::InPointer.from(:void, invocation_hint)
      _v6 = GirFFI::InPointer.from(:void, marshal_data)
      GObject::Lib.g_cclosure_marshal_VOID__FLAGS(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__FLOAT(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = GirFFI::InPointer.from(:void, invocation_hint)
      _v6 = GirFFI::InPointer.from(:void, marshal_data)
      GObject::Lib.g_cclosure_marshal_VOID__FLOAT(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__INT(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = GirFFI::InPointer.from(:void, invocation_hint)
      _v6 = GirFFI::InPointer.from(:void, marshal_data)
      GObject::Lib.g_cclosure_marshal_VOID__INT(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__LONG(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = GirFFI::InPointer.from(:void, invocation_hint)
      _v6 = GirFFI::InPointer.from(:void, marshal_data)
      GObject::Lib.g_cclosure_marshal_VOID__LONG(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__OBJECT(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = GirFFI::InPointer.from(:void, invocation_hint)
      _v6 = GirFFI::InPointer.from(:void, marshal_data)
      GObject::Lib.g_cclosure_marshal_VOID__OBJECT(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__PARAM(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = GirFFI::InPointer.from(:void, invocation_hint)
      _v6 = GirFFI::InPointer.from(:void, marshal_data)
      GObject::Lib.g_cclosure_marshal_VOID__PARAM(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__POINTER(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = GirFFI::InPointer.from(:void, invocation_hint)
      _v6 = GirFFI::InPointer.from(:void, marshal_data)
      GObject::Lib.g_cclosure_marshal_VOID__POINTER(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__STRING(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = GirFFI::InPointer.from(:void, invocation_hint)
      _v6 = GirFFI::InPointer.from(:void, marshal_data)
      GObject::Lib.g_cclosure_marshal_VOID__STRING(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__UCHAR(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = GirFFI::InPointer.from(:void, invocation_hint)
      _v6 = GirFFI::InPointer.from(:void, marshal_data)
      GObject::Lib.g_cclosure_marshal_VOID__UCHAR(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__UINT(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = GirFFI::InPointer.from(:void, invocation_hint)
      _v6 = GirFFI::InPointer.from(:void, marshal_data)
      GObject::Lib.g_cclosure_marshal_VOID__UINT(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__UINT_POINTER(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = GirFFI::InPointer.from(:void, invocation_hint)
      _v6 = GirFFI::InPointer.from(:void, marshal_data)
      GObject::Lib.g_cclosure_marshal_VOID__UINT_POINTER(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__ULONG(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = GirFFI::InPointer.from(:void, invocation_hint)
      _v6 = GirFFI::InPointer.from(:void, marshal_data)
      GObject::Lib.g_cclosure_marshal_VOID__ULONG(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__VARIANT(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = GirFFI::InPointer.from(:void, invocation_hint)
      _v6 = GirFFI::InPointer.from(:void, marshal_data)
      GObject::Lib.g_cclosure_marshal_VOID__VARIANT(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_VOID__VOID(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_value)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = GirFFI::InPointer.from(:void, invocation_hint)
      _v6 = GirFFI::InPointer.from(:void, marshal_data)
      GObject::Lib.g_cclosure_marshal_VOID__VOID(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def self.marshal_generic(closure, return_gvalue, n_param_values, param_values, invocation_hint, marshal_data)
      _v1 = GObject::Closure.from(closure)
      _v2 = GObject::Value.from(return_gvalue)
      _v3 = n_param_values
      _v4 = GObject::Value.from(param_values)
      _v5 = GirFFI::InPointer.from(:void, invocation_hint)
      _v6 = GirFFI::InPointer.from(:void, marshal_data)
      GObject::Lib.g_cclosure_marshal_generic(_v1, _v2, _v3, _v4, _v5, _v6)
    end
    def closure
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::Closure, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::Closure.wrap(_v3)
      _v4
    end
    def closure=(value)
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::Closure, _v1)
      _v3 = GObject::Closure.from(value)
      _v2.set_value(_v3)
    end
    def callback
      _v1 = (@struct.to_ptr + 64)
      _v2 = GirFFI::InOutPointer.new([:pointer, :void], _v1)
      _v3 = _v2.to_value
      _v3
    end
    def callback=(value)
      _v1 = (@struct.to_ptr + 64)
      _v2 = GirFFI::InOutPointer.new([:pointer, :void], _v1)
      _v3 = GirFFI::InPointer.from(:void, value)
      _v2.set_value(_v3)
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  class GObject::Closure < GirFFI::StructBase
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
    def invalidate
      GObject::Lib.g_closure_invalidate(self)
    end
    def invoke(return_value, param_values, invocation_hint)
      _v1 = GObject::Value.from(return_value)
      n_param_values = param_values.nil? ? (0) : (param_values.length)
      _v2 = n_param_values
      _v3 = GirFFI::InPointer.from(:void, invocation_hint)
      _v4 = GirFFI::SizedArray.from(GObject::Value, -1, param_values)
      GObject::Lib.g_closure_invoke(self, _v1, _v2, _v4, _v3)
    end
    def ref
      _v1 = GObject::Lib.g_closure_ref(self)
      _v2 = GObject::Closure.wrap(_v1)
      return _v2
    end
    def sink
      GObject::Lib.g_closure_sink(self)
    end
    def unref
      GObject::Lib.g_closure_unref(self)
    end
    def ref_count
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def meta_marshal_nouse
      _v1 = (@struct.to_ptr + 4)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def n_guards
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def n_fnotifiers
      _v1 = (@struct.to_ptr + 12)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def n_inotifiers
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def in_inotify
      _v1 = (@struct.to_ptr + 20)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def floating
      _v1 = (@struct.to_ptr + 24)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def derivative_flag
      _v1 = (@struct.to_ptr + 28)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def in_marshal
      _v1 = (@struct.to_ptr + 32)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def in_marshal=(value)
      _v1 = (@struct.to_ptr + 32)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
    def is_invalid
      _v1 = (@struct.to_ptr + 36)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def is_invalid=(value)
      _v1 = (@struct.to_ptr + 36)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
    def marshal
      _v1 = (@struct.to_ptr + 40)
      _v2 = GirFFI::InOutPointer.new(GObject::Marshal, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def data
      _v1 = (@struct.to_ptr + 48)
      _v2 = GirFFI::InOutPointer.new([:pointer, :void], _v1)
      _v3 = _v2.to_value
      _v3
    end
    def notifiers
      _v1 = (@struct.to_ptr + 56)
      _v2 = GirFFI::InOutPointer.new([:pointer, GObject::ClosureNotifyData], _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ClosureNotifyData.wrap(_v3)
      _v4
    end
    def initialize_simple(sizeof_closure, data)
      _v1 = sizeof_closure
      _v2 = GirFFI::InPointer.from(:void, data)
      _v3 = GObject::Lib.g_closure_new_simple(_v1, _v2)
      store_pointer(_v3)
    end
    # @override
    #
    # @param [Proc] marshal The marshaller to use for this closure object
    def set_marshal(marshal)
      callback = GObject::ClosureMarshal.from(marshal)
      Lib.g_closure_set_marshal(self, callback)
    end
    def initialize_object(sizeof_closure, object)
      _v1 = sizeof_closure
      _v2 = GObject::Object.from(object)
      _v3 = GObject::Lib.g_closure_new_object(_v1, _v2)
      store_pointer(_v3)
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  class GObject::ClosureNotifyData < GirFFI::StructBase
  
    def data
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new([:pointer, :void], _v1)
      _v3 = _v2.to_value
      _v3
    end
    def data=(value)
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new([:pointer, :void], _v1)
      _v3 = GirFFI::InPointer.from(:void, value)
      _v2.set_value(_v3)
    end
    def notify
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(GObject::ClosureNotify, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def notify=(value)
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(GObject::ClosureNotify, _v1)
      _v3 = GObject::ClosureNotify.from(value)
      _v2.set_value(_v3)
    end
  end
  # XXX: Don't know how to print flags
  class GObject::EnumClass < GirFFI::StructBase
  
    def g_type_class
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::TypeClass, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::TypeClass.wrap(_v3)
      _v4
    end
    def g_type_class=(value)
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::TypeClass, _v1)
      _v3 = GObject::TypeClass.from(value)
      _v2.set_value(_v3)
    end
    def minimum
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(:gint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def minimum=(value)
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(:gint32, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
    def maximum
      _v1 = (@struct.to_ptr + 12)
      _v2 = GirFFI::InOutPointer.new(:gint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def maximum=(value)
      _v1 = (@struct.to_ptr + 12)
      _v2 = GirFFI::InOutPointer.new(:gint32, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
    def n_values
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def n_values=(value)
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
    def values
      _v1 = (@struct.to_ptr + 24)
      _v2 = GirFFI::InOutPointer.new([:pointer, GObject::EnumValue], _v1)
      _v3 = _v2.to_value
      _v4 = GObject::EnumValue.wrap(_v3)
      _v4
    end
    def values=(value)
      _v1 = (@struct.to_ptr + 24)
      _v2 = GirFFI::InOutPointer.new([:pointer, GObject::EnumValue], _v1)
      _v3 = GObject::EnumValue.from(value)
      _v2.set_value(_v3)
    end
  end
  class GObject::EnumValue < GirFFI::StructBase
  
    def value
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(:gint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def value=(value)
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(:gint32, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
    def value_name
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(:utf8, _v1)
      _v3 = _v2.to_value
      _v4 = _v3.to_utf8
      _v4
    end
    def value_name=(value)
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(:utf8, _v1)
      _v3 = GirFFI::InPointer.from(:utf8, value)
      _v2.set_value(_v3)
    end
    def value_nick
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new(:utf8, _v1)
      _v3 = _v2.to_value
      _v4 = _v3.to_utf8
      _v4
    end
    def value_nick=(value)
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new(:utf8, _v1)
      _v3 = GirFFI::InPointer.from(:utf8, value)
      _v2.set_value(_v3)
    end
  end
  class GObject::FlagsClass < GirFFI::StructBase
  
    def g_type_class
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::TypeClass, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::TypeClass.wrap(_v3)
      _v4
    end
    def g_type_class=(value)
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::TypeClass, _v1)
      _v3 = GObject::TypeClass.from(value)
      _v2.set_value(_v3)
    end
    def mask
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def mask=(value)
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
    def n_values
      _v1 = (@struct.to_ptr + 12)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def n_values=(value)
      _v1 = (@struct.to_ptr + 12)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
    def values
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new([:pointer, GObject::FlagsValue], _v1)
      _v3 = _v2.to_value
      _v4 = GObject::FlagsValue.wrap(_v3)
      _v4
    end
    def values=(value)
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new([:pointer, GObject::FlagsValue], _v1)
      _v3 = GObject::FlagsValue.from(value)
      _v2.set_value(_v3)
    end
  end
  class GObject::FlagsValue < GirFFI::StructBase
  
    def value
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def value=(value)
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
    def value_name
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(:utf8, _v1)
      _v3 = _v2.to_value
      _v4 = _v3.to_utf8
      _v4
    end
    def value_name=(value)
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(:utf8, _v1)
      _v3 = GirFFI::InPointer.from(:utf8, value)
      _v2.set_value(_v3)
    end
    def value_nick
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new(:utf8, _v1)
      _v3 = _v2.to_value
      _v4 = _v3.to_utf8
      _v4
    end
    def value_nick=(value)
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new(:utf8, _v1)
      _v3 = GirFFI::InPointer.from(:utf8, value)
      _v2.set_value(_v3)
    end
  end
  class GObject::InitiallyUnowned < GObject::Object
  
    # Initializing method used in constructors. For InitiallyUnowned and
    # descendants, this needs to sink the object's floating reference.
    def store_pointer(ptr)
      super
      ::GObject::Lib.g_object_ref_sink(ptr)
    end
  end
  class GObject::InitiallyUnownedClass < GObject::ObjectClass
  
    def g_type_class
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::TypeClass, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::TypeClass.wrap(_v3)
      _v4
    end
    def construct_properties
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new([:pointer, :gslist], _v1)
      _v3 = _v2.to_value
      _v4 = GLib::SList.wrap([:pointer, :void], _v3)
      _v4
    end
    def constructor
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new([:pointer, :void], _v1)
      _v3 = _v2.to_value
      _v3
    end
    def set_property
      _v1 = (@struct.to_ptr + 24)
      _v2 = GirFFI::InOutPointer.new(GObject::Set_property, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def get_property
      _v1 = (@struct.to_ptr + 32)
      _v2 = GirFFI::InOutPointer.new(GObject::Get_property, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def dispose
      _v1 = (@struct.to_ptr + 40)
      _v2 = GirFFI::InOutPointer.new(GObject::Dispose, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def finalize
      _v1 = (@struct.to_ptr + 48)
      _v2 = GirFFI::InOutPointer.new(GObject::Finalize, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def dispatch_properties_changed
      _v1 = (@struct.to_ptr + 56)
      _v2 = GirFFI::InOutPointer.new(GObject::Dispatch_properties_changed, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def notify
      _v1 = (@struct.to_ptr + 64)
      _v2 = GirFFI::InOutPointer.new(GObject::Notify, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def constructed
      _v1 = (@struct.to_ptr + 72)
      _v2 = GirFFI::InOutPointer.new(GObject::Constructed, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def flags
      _v1 = (@struct.to_ptr + 80)
      _v2 = GirFFI::InOutPointer.new(:guint64, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def pdummy
      _v1 = (@struct.to_ptr + 88)
      _v2 = GirFFI::InOutPointer.new(:c, _v1)
      _v3 = _v2.to_value
      _v4 = GirFFI::SizedArray.wrap([:pointer, :void], 6, _v3)
      _v4
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  class GObject::InterfaceInfo < GirFFI::StructBase
  
    def interface_init
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::InterfaceInitFunc, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def interface_init=(value)
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::InterfaceInitFunc, _v1)
      _v3 = GObject::InterfaceInitFunc.from(value)
      _v2.set_value(_v3)
    end
    def interface_finalize
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(GObject::InterfaceFinalizeFunc, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def interface_finalize=(value)
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(GObject::InterfaceFinalizeFunc, _v1)
      _v3 = GObject::InterfaceFinalizeFunc.from(value)
      _v2.set_value(_v3)
    end
    def interface_data
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new([:pointer, :void], _v1)
      _v3 = _v2.to_value
      _v3
    end
    def interface_data=(value)
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new([:pointer, :void], _v1)
      _v3 = GirFFI::InPointer.from(:void, value)
      _v2.set_value(_v3)
    end
  end
  # XXX: Don't know how to print callback
  class GObject::Object < GirFFI::ObjectBase
    def self.compat_control(what, data)
      _v1 = what
      _v2 = GirFFI::InPointer.from(:void, data)
      _v3 = GObject::Lib.g_object_compat_control(_v1, _v2)
      return _v3
    end
    def self.interface_find_property(g_iface, property_name)
      _v1 = GirFFI::InPointer.from(:void, g_iface)
      _v2 = GirFFI::InPointer.from(:utf8, property_name)
      _v3 = GObject::Lib.g_object_interface_find_property(_v1, _v2)
      _v4 = GObject::ParamSpec.wrap(_v3)
      return _v4
    end
    def self.interface_install_property(g_iface, pspec)
      _v1 = GirFFI::InPointer.from(:void, g_iface)
      _v2 = GObject::ParamSpec.from(pspec)
      GObject::Lib.g_object_interface_install_property(_v1, _v2)
    end
    def self.interface_list_properties(g_iface)
      _v1 = GirFFI::InPointer.from(:void, g_iface)
      _v2 = GirFFI::InOutPointer.for(:guint32)
      _v3 = GObject::Lib.g_object_interface_list_properties(_v1, _v2)
      _v4 = _v2.to_value
      _v5 = GirFFI::SizedArray.wrap([:pointer, GObject::ParamSpec], _v4, _v3)
      return _v5
    end
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def self.make_finalizer(ptr, name)
      proc do
        rc = GObject::Object::Struct.new(ptr)[:ref_count]
        if (rc == 0) then
          warn("not unreffing #{name}:#{ptr} (#{rc})")
        else
          GObject::Lib.g_object_unref(ptr)
        end
      end
    end
    def bind_property(source_property, target, target_property, flags)
      _v1 = GirFFI::InPointer.from(:utf8, source_property)
      _v2 = GObject::Object.from(target)
      _v3 = GirFFI::InPointer.from(:utf8, target_property)
      _v4 = flags
      _v5 = GObject::Lib.g_object_bind_property(self, _v1, _v2, _v3, _v4)
      _v6 = GObject::Binding.wrap(_v5)
      return _v6
    end
    def bind_property_full(source_property, target, target_property, flags, transform_to, transform_from)
      _v1 = GirFFI::InPointer.from(:utf8, source_property)
      _v2 = GObject::Object.from(target)
      _v3 = GirFFI::InPointer.from(:utf8, target_property)
      _v4 = flags
      _v5 = GObject::Closure.from(transform_to)
      _v6 = GObject::Closure.from(transform_from)
      _v7 = GObject::Lib.g_object_bind_property_with_closures(self, _v1, _v2, _v3, _v4, _v5, _v6)
      _v8 = GObject::Binding.wrap(_v7)
      return _v8
    end
    def force_floating
      GObject::Lib.g_object_force_floating(self)
    end
    def freeze_notify
      GObject::Lib.g_object_freeze_notify(self)
    end
    def get_data(key)
      _v1 = GirFFI::InPointer.from(:utf8, key)
      _v2 = GObject::Lib.g_object_get_data(self, _v1)
      return _v2
    end
    def get_qdata(quark)
      _v1 = quark
      _v2 = GObject::Lib.g_object_get_qdata(self, _v1)
      return _v2
    end
    def notify(property_name)
      _v1 = GirFFI::InPointer.from(:utf8, property_name)
      GObject::Lib.g_object_notify(self, _v1)
    end
    def notify_by_pspec(pspec)
      _v1 = GObject::ParamSpec.from(pspec)
      GObject::Lib.g_object_notify_by_pspec(self, _v1)
    end
    def ref
      _v1 = GObject::Lib.g_object_ref(self)
      _v2 = GObject::Object.wrap(_v1)
      return _v2
    end
    def ref_sink
      _v1 = GObject::Lib.g_object_ref_sink(self)
      _v2 = GObject::Object.wrap(_v1)
      return _v2
    end
    def replace_data(key, oldval, newval, old_destroy, &destroy)
      _v1 = GirFFI::InPointer.from(:utf8, key)
      _v2 = GirFFI::InPointer.from(:void, oldval)
      _v3 = GirFFI::InPointer.from(:void, newval)
      _v4 = GLib::DestroyNotify.from(destroy)
      _v5 = GLib::DestroyNotify.from(old_destroy)
      _v6 = GObject::Lib.g_object_replace_data(self, _v1, _v2, _v3, _v4, _v5)
      return _v6
    end
    def replace_qdata(quark, oldval, newval, old_destroy, &destroy)
      _v1 = quark
      _v2 = GirFFI::InPointer.from(:void, oldval)
      _v3 = GirFFI::InPointer.from(:void, newval)
      _v4 = GLib::DestroyNotify.from(destroy)
      _v5 = GLib::DestroyNotify.from(old_destroy)
      _v6 = GObject::Lib.g_object_replace_qdata(self, _v1, _v2, _v3, _v4, _v5)
      return _v6
    end
    def run_dispose
      GObject::Lib.g_object_run_dispose(self)
    end
    def set_data(key, data)
      _v1 = GirFFI::InPointer.from(:utf8, key)
      _v2 = GirFFI::InPointer.from(:void, data)
      GObject::Lib.g_object_set_data(self, _v1, _v2)
    end
    def steal_data(key)
      _v1 = GirFFI::InPointer.from(:utf8, key)
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
      GObject::Lib.g_object_unref(self)
    end
    def watch_closure(closure)
      _v1 = GObject::Closure.from(closure)
      GObject::Lib.g_object_watch_closure(self, _v1)
    end
    def initialize_with_automatic_gtype(properties = {})
      gparameters = properties.map do |name, value|
        name = name.to_s
        unless property_param_spec(name) then
          raise(ArgumentError, "Property '#{name}' not found in class #{self.class}")
        end
        GObject::Parameter.new.tap do |gparam|
          gparam.name = name
          gparam.value = value
        end
      end
      initialize_without_automatic_gtype(self.class.gtype, gparameters)
    end
    def store_pointer(ptr)
      super
      klass = self.class
      ObjectSpace.define_finalizer(self, klass.make_finalizer(ptr, klass.name))
    end
    # TODO: Generate accessor methods from GIR at class definition time
    def method_missing(method, *args)
      getter_name = "get_#{method}"
      return send(getter_name, *args) if respond_to?(getter_name)
      if method.to_s =~ /(.*)=$/ then
        setter_name = "set_#{Regexp.last_match[1]}"
        return send(setter_name, *args) if respond_to?(setter_name)
      end
      super
    end
    def signal_connect(event, data = nil, &block)
      GObject.signal_connect(self, event, data, &block)
    end
    def signal_connect_after(event, data = nil, &block)
      GObject.signal_connect_after(self, event, data, &block)
    end
    def get_property_with_override(property_name)
      gvalue = gvalue_for_property(property_name)
      get_property_without_override(property_name, gvalue)
      gvalue.get_value
    end
    def set_property_with_override(property_name, value)
      gvalue = gvalue_for_property(property_name)
      gvalue.set_value(value)
      set_property_without_override(property_name, gvalue)
    end
    def get_property_extended(property_name)
      value = get_property(property_name)
      type_info = get_property_type(property_name)
      case type_info.tag
      when :ghash, :glist then
        adjust_value_to_type(value, type_info)
      else
        value
      end
    end
    def set_property_extended(property_name, value)
      type_info = get_property_type(property_name)
      adjusted_value = adjust_value_to_type(value, type_info)
      set_property(property_name, adjusted_value)
    end
    def get_property(property_name, value)
      _v1 = GirFFI::InPointer.from(:utf8, property_name)
      _v2 = GObject::Value.from(value)
      GObject::Lib.g_object_get_property(self, _v1, _v2)
    end
    def set_property(property_name, value)
      _v1 = GirFFI::InPointer.from(:utf8, property_name)
      _v2 = GObject::Value.from(value)
      GObject::Lib.g_object_set_property(self, _v1, _v2)
    end
    def is_floating
      _v1 = GObject::Lib.g_object_is_floating(self)
      return _v1
    end
    alias_method 'get_property', 'get_property_with_override'
    alias_method 'set_property', 'set_property_with_override'
    alias_method 'get_property_without_override', 'get_property'
    alias_method 'set_property_without_override', 'set_property'
    alias_method 'floating?', 'is_floating'
  end
  class GObject::ObjectClass < GObject::TypeClass
  
    def find_property(property_name)
      _v1 = GirFFI::InPointer.from(:utf8, property_name)
      _v2 = GObject::Lib.g_object_class_find_property(self, _v1)
      _v3 = GObject::ParamSpec.wrap(_v2)
      return _v3
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
      _v1 = GirFFI::InOutPointer.for(:guint32)
      _v2 = GObject::Lib.g_object_class_list_properties(self, _v1)
      _v3 = _v1.to_value
      _v4 = GirFFI::SizedArray.wrap([:pointer, GObject::ParamSpec], _v3, _v2)
      return _v4
    end
    def override_property(property_id, name)
      _v1 = property_id
      _v2 = GirFFI::InPointer.from(:utf8, name)
      GObject::Lib.g_object_class_override_property(self, _v1, _v2)
    end
    def g_type_class
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::TypeClass, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::TypeClass.wrap(_v3)
      _v4
    end
    def construct_properties
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new([:pointer, :gslist], _v1)
      _v3 = _v2.to_value
      _v4 = GLib::SList.wrap([:pointer, :void], _v3)
      _v4
    end
    def constructor
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new([:pointer, :void], _v1)
      _v3 = _v2.to_value
      _v3
    end
    def set_property
      _v1 = (@struct.to_ptr + 24)
      _v2 = GirFFI::InOutPointer.new(GObject::Set_property, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def get_property
      _v1 = (@struct.to_ptr + 32)
      _v2 = GirFFI::InOutPointer.new(GObject::Get_property, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def dispose
      _v1 = (@struct.to_ptr + 40)
      _v2 = GirFFI::InOutPointer.new(GObject::Dispose, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def finalize
      _v1 = (@struct.to_ptr + 48)
      _v2 = GirFFI::InOutPointer.new(GObject::Finalize, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def dispatch_properties_changed
      _v1 = (@struct.to_ptr + 56)
      _v2 = GirFFI::InOutPointer.new(GObject::Dispatch_properties_changed, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def notify
      _v1 = (@struct.to_ptr + 64)
      _v2 = GirFFI::InOutPointer.new(GObject::Notify, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def constructed
      _v1 = (@struct.to_ptr + 72)
      _v2 = GirFFI::InOutPointer.new(GObject::Constructed, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def flags
      _v1 = (@struct.to_ptr + 80)
      _v2 = GirFFI::InOutPointer.new(:guint64, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def pdummy
      _v1 = (@struct.to_ptr + 88)
      _v2 = GirFFI::InOutPointer.new(:c, _v1)
      _v3 = _v2.to_value
      _v4 = GirFFI::SizedArray.wrap([:pointer, :void], 6, _v3)
      _v4
    end
    def set_property=(callback)
      @struct[:set_property] = GObject::ObjectSetPropertyFunc.from(callback)
    end
    def get_property=(callback)
      @struct[:get_property] = GObject::ObjectGetPropertyFunc.from(callback)
    end
    def gtype
      GirFFI::InOutPointer.new(:GType, to_ptr).to_value
    end
  end
  class GObject::ObjectConstructParam < GirFFI::StructBase
  
    def pspec
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new([:pointer, GObject::ParamSpec], _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
    def pspec=(value)
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new([:pointer, GObject::ParamSpec], _v1)
      _v3 = GObject::ParamSpec.from(value.ref)
      _v2.set_value(_v3)
    end
    def value
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new([:pointer, GObject::Value], _v1)
      _v3 = _v2.to_value
      _v4 = GObject::Value.wrap(_v3)
      _v4
    end
    def value=(value)
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new([:pointer, GObject::Value], _v1)
      _v3 = GObject::Value.from(value)
      _v2.set_value(_v3)
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  PARAM_MASK = 255
  PARAM_STATIC_STRINGS = 0
  PARAM_USER_SHIFT = 8
  # XXX: Don't know how to print flags
  class GObject::ParamSpec < GirFFI::ObjectBase
  
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
      _v2 = GObject::ParamSpec.wrap(_v1)
      return _v2
    end
    def set_qdata(quark, data)
      _v1 = quark
      _v2 = GirFFI::InPointer.from(:void, data)
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
    def g_type_instance
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::TypeInstance, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::TypeInstance.wrap(_v3)
      _v4
    end
    def name
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(:utf8, _v1)
      _v3 = _v2.to_value
      _v4 = _v3.to_utf8
      _v4
    end
    def flags
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new(GObject::ParamFlags, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def value_type
      _v1 = (@struct.to_ptr + 24)
      _v2 = GirFFI::InOutPointer.new(:GType, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def owner_type
      _v1 = (@struct.to_ptr + 32)
      _v2 = GirFFI::InOutPointer.new(:GType, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def _nick
      _v1 = (@struct.to_ptr + 40)
      _v2 = GirFFI::InOutPointer.new(:utf8, _v1)
      _v3 = _v2.to_value
      _v4 = _v3.to_utf8
      _v4
    end
    def _blurb
      _v1 = (@struct.to_ptr + 48)
      _v2 = GirFFI::InOutPointer.new(:utf8, _v1)
      _v3 = _v2.to_value
      _v4 = _v3.to_utf8
      _v4
    end
    def qdata
      _v1 = (@struct.to_ptr + 56)
      _v2 = GirFFI::InOutPointer.new([:pointer, GLib::Data], _v1)
      _v3 = _v2.to_value
      _v4 = GLib::Data.wrap(_v3)
      _v4
    end
    def ref_count
      _v1 = (@struct.to_ptr + 64)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def param_id
      _v1 = (@struct.to_ptr + 68)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
  end
  class GObject::ParamSpecBoolean < GObject::ParamSpec
  
    def parent_instance
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::ParamSpec, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
    def default_value
      _v1 = (@struct.to_ptr + 72)
      _v2 = GirFFI::InOutPointer.new(:gboolean, _v1)
      _v3 = _v2.to_value
      _v3
    end
  end
  class GObject::ParamSpecBoxed < GObject::ParamSpec
  
    def parent_instance
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::ParamSpec, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
  end
  class GObject::ParamSpecChar < GObject::ParamSpec
  
    def parent_instance
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::ParamSpec, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
    def minimum
      _v1 = (@struct.to_ptr + 72)
      _v2 = GirFFI::InOutPointer.new(:gint8, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def maximum
      _v1 = (@struct.to_ptr + 73)
      _v2 = GirFFI::InOutPointer.new(:gint8, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def default_value
      _v1 = (@struct.to_ptr + 74)
      _v2 = GirFFI::InOutPointer.new(:gint8, _v1)
      _v3 = _v2.to_value
      _v3
    end
  end
  class GObject::ParamSpecClass < GObject::TypeClass
  
    def g_type_class
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::TypeClass, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::TypeClass.wrap(_v3)
      _v4
    end
    def value_type
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(:GType, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def finalize
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new(GObject::Finalize, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def value_set_default
      _v1 = (@struct.to_ptr + 24)
      _v2 = GirFFI::InOutPointer.new(GObject::Value_set_default, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def value_validate
      _v1 = (@struct.to_ptr + 32)
      _v2 = GirFFI::InOutPointer.new(GObject::Value_validate, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def values_cmp
      _v1 = (@struct.to_ptr + 40)
      _v2 = GirFFI::InOutPointer.new(GObject::Values_cmp, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def dummy
      _v1 = (@struct.to_ptr + 48)
      _v2 = GirFFI::InOutPointer.new(:c, _v1)
      _v3 = _v2.to_value
      _v4 = GirFFI::SizedArray.wrap([:pointer, :void], 4, _v3)
      _v4
    end
  end
  class GObject::ParamSpecDouble < GObject::ParamSpec
  
    def parent_instance
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::ParamSpec, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
    def minimum
      _v1 = (@struct.to_ptr + 72)
      _v2 = GirFFI::InOutPointer.new(:gdouble, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def maximum
      _v1 = (@struct.to_ptr + 80)
      _v2 = GirFFI::InOutPointer.new(:gdouble, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def default_value
      _v1 = (@struct.to_ptr + 88)
      _v2 = GirFFI::InOutPointer.new(:gdouble, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def epsilon
      _v1 = (@struct.to_ptr + 96)
      _v2 = GirFFI::InOutPointer.new(:gdouble, _v1)
      _v3 = _v2.to_value
      _v3
    end
  end
  class GObject::ParamSpecEnum < GObject::ParamSpec
  
    def parent_instance
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::ParamSpec, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
    def enum_class
      _v1 = (@struct.to_ptr + 72)
      _v2 = GirFFI::InOutPointer.new([:pointer, GObject::EnumClass], _v1)
      _v3 = _v2.to_value
      _v4 = GObject::EnumClass.wrap(_v3)
      _v4
    end
    def default_value
      _v1 = (@struct.to_ptr + 80)
      _v2 = GirFFI::InOutPointer.new(:gint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
  end
  class GObject::ParamSpecFlags < GObject::ParamSpec
  
    def parent_instance
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::ParamSpec, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
    def flags_class
      _v1 = (@struct.to_ptr + 72)
      _v2 = GirFFI::InOutPointer.new([:pointer, GObject::FlagsClass], _v1)
      _v3 = _v2.to_value
      _v4 = GObject::FlagsClass.wrap(_v3)
      _v4
    end
    def default_value
      _v1 = (@struct.to_ptr + 80)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
  end
  class GObject::ParamSpecFloat < GObject::ParamSpec
  
    def parent_instance
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::ParamSpec, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
    def minimum
      _v1 = (@struct.to_ptr + 72)
      _v2 = GirFFI::InOutPointer.new(:gfloat, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def maximum
      _v1 = (@struct.to_ptr + 76)
      _v2 = GirFFI::InOutPointer.new(:gfloat, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def default_value
      _v1 = (@struct.to_ptr + 80)
      _v2 = GirFFI::InOutPointer.new(:gfloat, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def epsilon
      _v1 = (@struct.to_ptr + 84)
      _v2 = GirFFI::InOutPointer.new(:gfloat, _v1)
      _v3 = _v2.to_value
      _v3
    end
  end
  class GObject::ParamSpecGType < GObject::ParamSpec
  
    def parent_instance
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::ParamSpec, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
    def is_a_type
      _v1 = (@struct.to_ptr + 72)
      _v2 = GirFFI::InOutPointer.new(:GType, _v1)
      _v3 = _v2.to_value
      _v3
    end
  end
  class GObject::ParamSpecInt < GObject::ParamSpec
  
    def parent_instance
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::ParamSpec, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
    def minimum
      _v1 = (@struct.to_ptr + 72)
      _v2 = GirFFI::InOutPointer.new(:gint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def maximum
      _v1 = (@struct.to_ptr + 76)
      _v2 = GirFFI::InOutPointer.new(:gint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def default_value
      _v1 = (@struct.to_ptr + 80)
      _v2 = GirFFI::InOutPointer.new(:gint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
  end
  class GObject::ParamSpecInt64 < GObject::ParamSpec
  
    def parent_instance
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::ParamSpec, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
    def minimum
      _v1 = (@struct.to_ptr + 72)
      _v2 = GirFFI::InOutPointer.new(:gint64, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def maximum
      _v1 = (@struct.to_ptr + 80)
      _v2 = GirFFI::InOutPointer.new(:gint64, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def default_value
      _v1 = (@struct.to_ptr + 88)
      _v2 = GirFFI::InOutPointer.new(:gint64, _v1)
      _v3 = _v2.to_value
      _v3
    end
  end
  class GObject::ParamSpecLong < GObject::ParamSpec
  
    def parent_instance
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::ParamSpec, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
    def minimum
      _v1 = (@struct.to_ptr + 72)
      _v2 = GirFFI::InOutPointer.new(:gint64, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def maximum
      _v1 = (@struct.to_ptr + 80)
      _v2 = GirFFI::InOutPointer.new(:gint64, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def default_value
      _v1 = (@struct.to_ptr + 88)
      _v2 = GirFFI::InOutPointer.new(:gint64, _v1)
      _v3 = _v2.to_value
      _v3
    end
  end
  class GObject::ParamSpecObject < GObject::ParamSpec
  
    def parent_instance
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::ParamSpec, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
  end
  class GObject::ParamSpecOverride < GObject::ParamSpec
  
    def parent_instance
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::ParamSpec, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
    def overridden
      _v1 = (@struct.to_ptr + 72)
      _v2 = GirFFI::InOutPointer.new([:pointer, GObject::ParamSpec], _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
  end
  class GObject::ParamSpecParam < GObject::ParamSpec
  
    def parent_instance
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::ParamSpec, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
  end
  class GObject::ParamSpecPointer < GObject::ParamSpec
  
    def parent_instance
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::ParamSpec, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
  end
  class GObject::ParamSpecPool < GirFFI::StructBase
    def self.new(type_prefixing)
      _v1 = type_prefixing
      _v2 = GObject::Lib.g_param_spec_pool_new(_v1)
      _v3 = GObject::ParamSpecPool.wrap(_v2)
      return _v3
    end
    def insert(pspec, owner_type)
      _v1 = GObject::ParamSpec.from(pspec)
      _v2 = owner_type
      GObject::Lib.g_param_spec_pool_insert(self, _v1, _v2)
    end
    def list(owner_type)
      _v1 = owner_type
      _v2 = GirFFI::InOutPointer.for(:guint32)
      _v3 = GObject::Lib.g_param_spec_pool_list(self, _v1, _v2)
      _v4 = _v2.to_value
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
      _v1 = GirFFI::InPointer.from(:utf8, param_name)
      _v2 = owner_type
      _v3 = walk_ancestors
      _v4 = GObject::Lib.g_param_spec_pool_lookup(self, _v1, _v2, _v3)
      _v5 = GObject::ParamSpec.wrap(_v4)
      return _v5
    end
    def remove(pspec)
      _v1 = GObject::ParamSpec.from(pspec)
      GObject::Lib.g_param_spec_pool_remove(self, _v1)
    end
  end
  class GObject::ParamSpecString < GObject::ParamSpec
  
    def parent_instance
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::ParamSpec, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
    def default_value
      _v1 = (@struct.to_ptr + 72)
      _v2 = GirFFI::InOutPointer.new(:utf8, _v1)
      _v3 = _v2.to_value
      _v4 = _v3.to_utf8
      _v4
    end
    def cset_first
      _v1 = (@struct.to_ptr + 80)
      _v2 = GirFFI::InOutPointer.new(:utf8, _v1)
      _v3 = _v2.to_value
      _v4 = _v3.to_utf8
      _v4
    end
    def cset_nth
      _v1 = (@struct.to_ptr + 88)
      _v2 = GirFFI::InOutPointer.new(:utf8, _v1)
      _v3 = _v2.to_value
      _v4 = _v3.to_utf8
      _v4
    end
    def substitutor
      _v1 = (@struct.to_ptr + 96)
      _v2 = GirFFI::InOutPointer.new(:gint8, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def null_fold_if_empty
      _v1 = (@struct.to_ptr + 100)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def ensure_non_null
      _v1 = (@struct.to_ptr + 104)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
  end
  class GObject::ParamSpecTypeInfo < GirFFI::StructBase
  
    def instance_size
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(:guint16, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def instance_size=(value)
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(:guint16, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
    def n_preallocs
      _v1 = (@struct.to_ptr + 2)
      _v2 = GirFFI::InOutPointer.new(:guint16, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def n_preallocs=(value)
      _v1 = (@struct.to_ptr + 2)
      _v2 = GirFFI::InOutPointer.new(:guint16, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
    def instance_init
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(GObject::Instance_init, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def value_type
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new(:GType, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def value_type=(value)
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new(:GType, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
    def finalize
      _v1 = (@struct.to_ptr + 24)
      _v2 = GirFFI::InOutPointer.new(GObject::Finalize, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def value_set_default
      _v1 = (@struct.to_ptr + 32)
      _v2 = GirFFI::InOutPointer.new(GObject::Value_set_default, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def value_validate
      _v1 = (@struct.to_ptr + 40)
      _v2 = GirFFI::InOutPointer.new(GObject::Value_validate, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def values_cmp
      _v1 = (@struct.to_ptr + 48)
      _v2 = GirFFI::InOutPointer.new(GObject::Values_cmp, _v1)
      _v3 = _v2.to_value
      _v3
    end
  end
  class GObject::ParamSpecUChar < GObject::ParamSpec
  
    def parent_instance
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::ParamSpec, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
    def minimum
      _v1 = (@struct.to_ptr + 72)
      _v2 = GirFFI::InOutPointer.new(:guint8, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def maximum
      _v1 = (@struct.to_ptr + 73)
      _v2 = GirFFI::InOutPointer.new(:guint8, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def default_value
      _v1 = (@struct.to_ptr + 74)
      _v2 = GirFFI::InOutPointer.new(:guint8, _v1)
      _v3 = _v2.to_value
      _v3
    end
  end
  class GObject::ParamSpecUInt < GObject::ParamSpec
  
    def parent_instance
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::ParamSpec, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
    def minimum
      _v1 = (@struct.to_ptr + 72)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def maximum
      _v1 = (@struct.to_ptr + 76)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def default_value
      _v1 = (@struct.to_ptr + 80)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
  end
  class GObject::ParamSpecUInt64 < GObject::ParamSpec
  
    def parent_instance
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::ParamSpec, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
    def minimum
      _v1 = (@struct.to_ptr + 72)
      _v2 = GirFFI::InOutPointer.new(:guint64, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def maximum
      _v1 = (@struct.to_ptr + 80)
      _v2 = GirFFI::InOutPointer.new(:guint64, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def default_value
      _v1 = (@struct.to_ptr + 88)
      _v2 = GirFFI::InOutPointer.new(:guint64, _v1)
      _v3 = _v2.to_value
      _v3
    end
  end
  class GObject::ParamSpecULong < GObject::ParamSpec
  
    def parent_instance
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::ParamSpec, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
    def minimum
      _v1 = (@struct.to_ptr + 72)
      _v2 = GirFFI::InOutPointer.new(:guint64, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def maximum
      _v1 = (@struct.to_ptr + 80)
      _v2 = GirFFI::InOutPointer.new(:guint64, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def default_value
      _v1 = (@struct.to_ptr + 88)
      _v2 = GirFFI::InOutPointer.new(:guint64, _v1)
      _v3 = _v2.to_value
      _v3
    end
  end
  class GObject::ParamSpecUnichar < GObject::ParamSpec
  
    def parent_instance
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::ParamSpec, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
    def default_value
      _v1 = (@struct.to_ptr + 72)
      _v2 = GirFFI::InOutPointer.new(:gunichar, _v1)
      _v3 = _v2.to_value
      _v3
    end
  end
  class GObject::ParamSpecValueArray < GObject::ParamSpec
  
    def parent_instance
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::ParamSpec, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
    def element_spec
      _v1 = (@struct.to_ptr + 72)
      _v2 = GirFFI::InOutPointer.new([:pointer, GObject::ParamSpec], _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
    def fixed_n_elements
      _v1 = (@struct.to_ptr + 80)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
  end
  class GObject::ParamSpecVariant < GObject::ParamSpec
  
    def parent_instance
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::ParamSpec, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ParamSpec.wrap(_v3)
      _v4
    end
    def type
      _v1 = (@struct.to_ptr + 72)
      _v2 = GirFFI::InOutPointer.new([:pointer, GLib::VariantType], _v1)
      _v3 = _v2.to_value
      _v4 = GLib::VariantType.wrap(_v3)
      _v4
    end
    def default_value
      _v1 = (@struct.to_ptr + 80)
      _v2 = GirFFI::InOutPointer.new([:pointer, GLib::Variant], _v1)
      _v3 = _v2.to_value
      _v4 = GLib::Variant.wrap(_v3)
      _v4
    end
    def padding
      _v1 = (@struct.to_ptr + 88)
      _v2 = GirFFI::InOutPointer.new(:c, _v1)
      _v3 = _v2.to_value
      _v4 = GirFFI::SizedArray.wrap([:pointer, :void], 4, _v3)
      _v4
    end
  end
  class GObject::Parameter < GirFFI::StructBase
  
    def name
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(:utf8, _v1)
      _v3 = _v2.to_value
      _v4 = _v3.to_utf8
      _v4
    end
    def name=(value)
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(:utf8, _v1)
      _v3 = GirFFI::InPointer.from(:utf8, value)
      _v2.set_value(_v3)
    end
    def value
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(GObject::Value, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::Value.wrap(_v3)
      _v4
    end
    def value=(value)
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(GObject::Value, _v1)
      _v3 = GObject::Value.from(value)
      _v2.set_value(_v3)
    end
  end
  SIGNAL_FLAGS_MASK = 511
  SIGNAL_MATCH_MASK = 63
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print flags
  class GObject::SignalInvocationHint < GirFFI::StructBase
  
    def signal_id
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def signal_id=(value)
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
    def detail
      _v1 = (@struct.to_ptr + 4)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def detail=(value)
      _v1 = (@struct.to_ptr + 4)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
    def run_type
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(GObject::SignalFlags, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def run_type=(value)
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(GObject::SignalFlags, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
  end
  # XXX: Don't know how to print flags
  class GObject::SignalQuery < GirFFI::StructBase
  
    def signal_id
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def signal_id=(value)
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
    def signal_name
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(:utf8, _v1)
      _v3 = _v2.to_value
      _v4 = _v3.to_utf8
      _v4
    end
    def signal_name=(value)
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(:utf8, _v1)
      _v3 = GirFFI::InPointer.from(:utf8, value)
      _v2.set_value(_v3)
    end
    def itype
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new(:GType, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def itype=(value)
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new(:GType, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
    def signal_flags
      _v1 = (@struct.to_ptr + 24)
      _v2 = GirFFI::InOutPointer.new(GObject::SignalFlags, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def signal_flags=(value)
      _v1 = (@struct.to_ptr + 24)
      _v2 = GirFFI::InOutPointer.new(GObject::SignalFlags, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
    def return_type
      _v1 = (@struct.to_ptr + 32)
      _v2 = GirFFI::InOutPointer.new(:GType, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def return_type=(value)
      _v1 = (@struct.to_ptr + 32)
      _v2 = GirFFI::InOutPointer.new(:GType, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
    def n_params
      _v1 = (@struct.to_ptr + 40)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def n_params=(value)
      _v1 = (@struct.to_ptr + 40)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
    def param_types
      _v1 = (@struct.to_ptr + 40)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v4 = (@struct.to_ptr + 48)
      _v5 = GirFFI::InOutPointer.new([:pointer, :c], _v4)
      _v6 = _v5.to_value
      _v7 = GirFFI::SizedArray.wrap(:GType, _v3, _v6)
      _v7
    end
    def param_types=(value)
      _v1 = (@struct.to_ptr + 48)
      _v2 = GirFFI::InOutPointer.new([:pointer, :c], _v1)
      _v3 = GirFFI::SizedArray.from(:GType, -1, value)
      _v2.set_value(_v3)
    end
  end
  TYPE_FLAG_RESERVED_ID_BIT = 1
  TYPE_FUNDAMENTAL_MAX = 255
  TYPE_FUNDAMENTAL_SHIFT = 2
  TYPE_RESERVED_BSE_FIRST = 32
  TYPE_RESERVED_BSE_LAST = 48
  TYPE_RESERVED_GLIB_FIRST = 22
  TYPE_RESERVED_GLIB_LAST = 31
  TYPE_RESERVED_USER_FIRST = 49
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print union
  class GObject::TypeClass < GirFFI::StructBase
    def self.add_private(g_class, private_size)
      _v1 = GirFFI::InPointer.from(:void, g_class)
      _v2 = private_size
      GObject::Lib.g_type_class_add_private(_v1, _v2)
    end
    def self.adjust_private_offset(g_class, private_size_or_offset)
      _v1 = GirFFI::InPointer.from(:void, g_class)
      _v2 = private_size_or_offset
      GObject::Lib.g_type_class_adjust_private_offset(_v1, _v2)
    end
    def self.peek(type)
      _v1 = type
      _v2 = GObject::Lib.g_type_class_peek(_v1)
      _v3 = GObject::TypeClass.wrap(_v2)
      return _v3
    end
    def self.peek_static(type)
      _v1 = type
      _v2 = GObject::Lib.g_type_class_peek_static(_v1)
      _v3 = GObject::TypeClass.wrap(_v2)
      return _v3
    end
    def self.ref(type)
      _v1 = type
      _v2 = GObject::Lib.g_type_class_ref(_v1)
      _v3 = GObject::TypeClass.wrap(_v2)
      return _v3
    end
    def peek_parent
      _v1 = GObject::Lib.g_type_class_peek_parent(self)
      _v2 = GObject::TypeClass.wrap(_v1)
      return _v2
    end
    def unref
      GObject::Lib.g_type_class_unref(self)
    end
    def g_type
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(:GType, _v1)
      _v3 = _v2.to_value
      _v3
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print flags
  # XXX: Don't know how to print flags
  # XXX: Don't know how to print flags
  class GObject::TypeFundamentalInfo < GirFFI::StructBase
  
    def type_flags
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::TypeFundamentalFlags, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def type_flags=(value)
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::TypeFundamentalFlags, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
  end
  class GObject::TypeInfo < GirFFI::StructBase
  
    def class_size
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(:guint16, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def class_size=(value)
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(:guint16, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
    def base_init
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(GObject::BaseInitFunc, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def base_init=(value)
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(GObject::BaseInitFunc, _v1)
      _v3 = GObject::BaseInitFunc.from(value)
      _v2.set_value(_v3)
    end
    def base_finalize
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new(GObject::BaseFinalizeFunc, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def base_finalize=(value)
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new(GObject::BaseFinalizeFunc, _v1)
      _v3 = GObject::BaseFinalizeFunc.from(value)
      _v2.set_value(_v3)
    end
    def class_init
      _v1 = (@struct.to_ptr + 24)
      _v2 = GirFFI::InOutPointer.new(GObject::ClassInitFunc, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def class_init=(value)
      _v1 = (@struct.to_ptr + 24)
      _v2 = GirFFI::InOutPointer.new(GObject::ClassInitFunc, _v1)
      _v3 = GObject::ClassInitFunc.from(value)
      _v2.set_value(_v3)
    end
    def class_finalize
      _v1 = (@struct.to_ptr + 32)
      _v2 = GirFFI::InOutPointer.new(GObject::ClassFinalizeFunc, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def class_finalize=(value)
      _v1 = (@struct.to_ptr + 32)
      _v2 = GirFFI::InOutPointer.new(GObject::ClassFinalizeFunc, _v1)
      _v3 = GObject::ClassFinalizeFunc.from(value)
      _v2.set_value(_v3)
    end
    def class_data
      _v1 = (@struct.to_ptr + 40)
      _v2 = GirFFI::InOutPointer.new([:pointer, :void], _v1)
      _v3 = _v2.to_value
      _v3
    end
    def class_data=(value)
      _v1 = (@struct.to_ptr + 40)
      _v2 = GirFFI::InOutPointer.new([:pointer, :void], _v1)
      _v3 = GirFFI::InPointer.from(:void, value)
      _v2.set_value(_v3)
    end
    def instance_size
      _v1 = (@struct.to_ptr + 48)
      _v2 = GirFFI::InOutPointer.new(:guint16, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def instance_size=(value)
      _v1 = (@struct.to_ptr + 48)
      _v2 = GirFFI::InOutPointer.new(:guint16, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
    def n_preallocs
      _v1 = (@struct.to_ptr + 50)
      _v2 = GirFFI::InOutPointer.new(:guint16, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def n_preallocs=(value)
      _v1 = (@struct.to_ptr + 50)
      _v2 = GirFFI::InOutPointer.new(:guint16, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
    def instance_init
      _v1 = (@struct.to_ptr + 56)
      _v2 = GirFFI::InOutPointer.new(GObject::InstanceInitFunc, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def instance_init=(value)
      _v1 = (@struct.to_ptr + 56)
      _v2 = GirFFI::InOutPointer.new(GObject::InstanceInitFunc, _v1)
      _v3 = GObject::InstanceInitFunc.from(value)
      _v2.set_value(_v3)
    end
    def value_table
      _v1 = (@struct.to_ptr + 64)
      _v2 = GirFFI::InOutPointer.new([:pointer, GObject::TypeValueTable], _v1)
      _v3 = _v2.to_value
      _v4 = GObject::TypeValueTable.wrap(_v3)
      _v4
    end
    def value_table=(value)
      _v1 = (@struct.to_ptr + 64)
      _v2 = GirFFI::InOutPointer.new([:pointer, GObject::TypeValueTable], _v1)
      _v3 = GObject::TypeValueTable.from(value)
      _v2.set_value(_v3)
    end
  end
  class GObject::TypeInstance < GirFFI::StructBase
  
    def g_class
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new([:pointer, GObject::TypeClass], _v1)
      _v3 = _v2.to_value
      _v4 = GObject::TypeClass.wrap(_v3)
      _v4
    end
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
    def self.peek(instance_class, iface_type)
      _v1 = GObject::TypeClass.from(instance_class)
      _v2 = iface_type
      _v3 = GObject::Lib.g_type_interface_peek(_v1, _v2)
      _v4 = GObject::TypeInterface.wrap(_v3)
      return _v4
    end
    def self.prerequisites(interface_type)
      _v1 = interface_type
      _v2 = GirFFI::InOutPointer.for(:guint32)
      _v3 = GObject::Lib.g_type_interface_prerequisites(_v1, _v2)
      _v4 = _v2.to_value
      _v5 = GirFFI::SizedArray.wrap(:GType, _v4, _v3)
      return _v5
    end
    def peek_parent
      _v1 = GObject::Lib.g_type_interface_peek_parent(self)
      _v2 = GObject::TypeInterface.wrap(_v1)
      return _v2
    end
    def g_type
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(:GType, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def g_instance_type
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(:GType, _v1)
      _v3 = _v2.to_value
      _v3
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
      _v1 = GirFFI::InPointer.from(:utf8, name)
      _v2 = GObject::EnumValue.from(const_static_values)
      _v3 = GObject::Lib.g_type_module_register_enum(self, _v1, _v2)
      return _v3
    end
    def register_flags(name, const_static_values)
      _v1 = GirFFI::InPointer.from(:utf8, name)
      _v2 = GObject::FlagsValue.from(const_static_values)
      _v3 = GObject::Lib.g_type_module_register_flags(self, _v1, _v2)
      return _v3
    end
    def register_type(parent_type, type_name, type_info, flags)
      _v1 = parent_type
      _v2 = GirFFI::InPointer.from(:utf8, type_name)
      _v3 = GObject::TypeInfo.from(type_info)
      _v4 = flags
      _v5 = GObject::Lib.g_type_module_register_type(self, _v1, _v2, _v3, _v4)
      return _v5
    end
    def set_name(name)
      _v1 = GirFFI::InPointer.from(:utf8, name)
      GObject::Lib.g_type_module_set_name(self, _v1)
    end
    def unuse
      GObject::Lib.g_type_module_unuse(self)
    end
    def use
      _v1 = GObject::Lib.g_type_module_use(self)
      return _v1
    end
  end
  class GObject::TypeModuleClass < GObject::ObjectClass
  
    def parent_class
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::ObjectClass, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::ObjectClass.wrap(_v3)
      _v4
    end
    def load
      _v1 = (@struct.to_ptr + 136)
      _v2 = GirFFI::InOutPointer.new(GObject::Load, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def unload
      _v1 = (@struct.to_ptr + 144)
      _v2 = GirFFI::InOutPointer.new(GObject::Unload, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def reserved1
      _v1 = (@struct.to_ptr + 152)
      _v2 = GirFFI::InOutPointer.new(GObject::Reserved1, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def reserved2
      _v1 = (@struct.to_ptr + 160)
      _v2 = GirFFI::InOutPointer.new(GObject::Reserved2, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def reserved3
      _v1 = (@struct.to_ptr + 168)
      _v2 = GirFFI::InOutPointer.new(GObject::Reserved3, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def reserved4
      _v1 = (@struct.to_ptr + 176)
      _v2 = GirFFI::InOutPointer.new(GObject::Reserved4, _v1)
      _v3 = _v2.to_value
      _v3
    end
  end
  # XXX: Don't know how to print interface
  class GObject::TypePluginClass < GirFFI::StructBase
  
    def base_iface
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::TypeInterface, _v1)
      _v3 = _v2.to_value
      _v4 = GObject::TypeInterface.wrap(_v3)
      _v4
    end
    def use_plugin
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new(GObject::TypePluginUse, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def use_plugin=(value)
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new(GObject::TypePluginUse, _v1)
      _v3 = GObject::TypePluginUse.from(value)
      _v2.set_value(_v3)
    end
    def unuse_plugin
      _v1 = (@struct.to_ptr + 24)
      _v2 = GirFFI::InOutPointer.new(GObject::TypePluginUnuse, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def unuse_plugin=(value)
      _v1 = (@struct.to_ptr + 24)
      _v2 = GirFFI::InOutPointer.new(GObject::TypePluginUnuse, _v1)
      _v3 = GObject::TypePluginUnuse.from(value)
      _v2.set_value(_v3)
    end
    def complete_type_info
      _v1 = (@struct.to_ptr + 32)
      _v2 = GirFFI::InOutPointer.new(GObject::TypePluginCompleteTypeInfo, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def complete_type_info=(value)
      _v1 = (@struct.to_ptr + 32)
      _v2 = GirFFI::InOutPointer.new(GObject::TypePluginCompleteTypeInfo, _v1)
      _v3 = GObject::TypePluginCompleteTypeInfo.from(value)
      _v2.set_value(_v3)
    end
    def complete_interface_info
      _v1 = (@struct.to_ptr + 40)
      _v2 = GirFFI::InOutPointer.new(GObject::TypePluginCompleteInterfaceInfo, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def complete_interface_info=(value)
      _v1 = (@struct.to_ptr + 40)
      _v2 = GirFFI::InOutPointer.new(GObject::TypePluginCompleteInterfaceInfo, _v1)
      _v3 = GObject::TypePluginCompleteInterfaceInfo.from(value)
      _v2.set_value(_v3)
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  class GObject::TypeQuery < GirFFI::StructBase
  
    def type
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(:GType, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def type=(value)
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(:GType, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
    def type_name
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(:utf8, _v1)
      _v3 = _v2.to_value
      _v4 = _v3.to_utf8
      _v4
    end
    def type_name=(value)
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(:utf8, _v1)
      _v3 = GirFFI::InPointer.from(:utf8, value)
      _v2.set_value(_v3)
    end
    def class_size
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def class_size=(value)
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
    def instance_size
      _v1 = (@struct.to_ptr + 20)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def instance_size=(value)
      _v1 = (@struct.to_ptr + 20)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
  end
  class GObject::TypeValueTable < GirFFI::StructBase
  
    def value_init
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(GObject::Value_init, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def value_free
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(GObject::Value_free, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def value_copy
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new(GObject::Value_copy, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def value_peek_pointer
      _v1 = (@struct.to_ptr + 24)
      _v2 = GirFFI::InOutPointer.new([:pointer, :void], _v1)
      _v3 = _v2.to_value
      _v3
    end
    def collect_format
      _v1 = (@struct.to_ptr + 32)
      _v2 = GirFFI::InOutPointer.new(:utf8, _v1)
      _v3 = _v2.to_value
      _v4 = _v3.to_utf8
      _v4
    end
    def collect_format=(value)
      _v1 = (@struct.to_ptr + 32)
      _v2 = GirFFI::InOutPointer.new(:utf8, _v1)
      _v3 = GirFFI::InPointer.from(:utf8, value)
      _v2.set_value(_v3)
    end
    def collect_value
      _v1 = (@struct.to_ptr + 40)
      _v2 = GirFFI::InOutPointer.new(GObject::Collect_value, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def lcopy_format
      _v1 = (@struct.to_ptr + 48)
      _v2 = GirFFI::InOutPointer.new(:utf8, _v1)
      _v3 = _v2.to_value
      _v4 = _v3.to_utf8
      _v4
    end
    def lcopy_format=(value)
      _v1 = (@struct.to_ptr + 48)
      _v2 = GirFFI::InOutPointer.new(:utf8, _v1)
      _v3 = GirFFI::InPointer.from(:utf8, value)
      _v2.set_value(_v3)
    end
    def lcopy_value
      _v1 = (@struct.to_ptr + 56)
      _v2 = GirFFI::InOutPointer.new(GObject::Lcopy_value, _v1)
      _v3 = _v2.to_value
      _v3
    end
  end
  VALUE_COLLECT_FORMAT_MAX_LENGTH = 8
  VALUE_NOCOPY_CONTENTS = 134217728
  class GObject::Value < GirFFI::StructBase
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
    def self.make_finalizer(ptr)
      proc { GObject::Lib.g_value_unset(ptr) }
    end
    # TODO: Give more generic name
    def self.wrap_ruby_value(val)
      new.tap { |gv| gv.__send__(:set_ruby_value, val) }
    end
    def self.from(val)
      case val
      when self then
        val
      else
        wrap_ruby_value(val)
      end
    end
    def self.for_gtype(gtype)
      new.tap { |it| it.init(gtype) }
    end
    # TODO: Combine with wrap_ruby_value
    def self.wrap_instance(instance)
      new.tap do |it|
        it.init(GObject.type_from_instance(instance))
        it.set_instance(instance)
      end
    end
    def copy(dest_value)
      _v1 = GObject::Value.from(dest_value)
      GObject::Lib.g_value_copy(self, _v1)
    end
    def dup_object
      _v1 = GObject::Lib.g_value_dup_object(self)
      _v2 = GObject::Object.wrap(_v1)
      return _v2
    end
    def dup_string
      _v1 = GObject::Lib.g_value_dup_string(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def dup_variant
      _v1 = GObject::Lib.g_value_dup_variant(self)
      _v2 = GLib::Variant.wrap(_v1)
      return _v2
    end
    def fits_pointer
      _v1 = GObject::Lib.g_value_fits_pointer(self)
      return _v1
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
      _v2 = GObject::Object.wrap(_v1)
      return _v2
    end
    def get_param
      _v1 = GObject::Lib.g_value_get_param(self)
      _v2 = GObject::ParamSpec.wrap(_v1)
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
      _v2 = GLib::Variant.wrap(_v1)
      return _v2
    end
    def init_from_instance(instance)
      _v1 = GirFFI::InPointer.from(:void, instance)
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
    def set_boxed(v_boxed)
      _v1 = GirFFI::InPointer.from(:void, v_boxed)
      GObject::Lib.g_value_set_boxed(self, _v1)
    end
    def set_boxed_take_ownership(v_boxed)
      _v1 = GirFFI::InPointer.from(:void, v_boxed)
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
    def set_instance(instance)
      _v1 = GirFFI::InPointer.from(:void, instance)
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
    def set_long(v_long)
      _v1 = v_long
      GObject::Lib.g_value_set_long(self, _v1)
    end
    def set_object(v_object)
      _v1 = GObject::Object.from(v_object)
      GObject::Lib.g_value_set_object(self, _v1)
    end
    def set_param(param)
      _v1 = GObject::ParamSpec.from(param)
      GObject::Lib.g_value_set_param(self, _v1)
    end
    def set_pointer(v_pointer)
      _v1 = GirFFI::InPointer.from(:void, v_pointer)
      GObject::Lib.g_value_set_pointer(self, _v1)
    end
    def set_schar(v_char)
      _v1 = v_char
      GObject::Lib.g_value_set_schar(self, _v1)
    end
    def set_static_boxed(v_boxed)
      _v1 = GirFFI::InPointer.from(:void, v_boxed)
      GObject::Lib.g_value_set_static_boxed(self, _v1)
    end
    def set_static_string(v_string)
      _v1 = GirFFI::InPointer.from(:utf8, v_string)
      GObject::Lib.g_value_set_static_string(self, _v1)
    end
    def set_string(v_string)
      _v1 = GirFFI::InPointer.from(:utf8, v_string)
      GObject::Lib.g_value_set_string(self, _v1)
    end
    def set_string_take_ownership(v_string)
      _v1 = GirFFI::InPointer.from(:utf8, v_string)
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
    def set_variant(variant)
      _v1 = GLib::Variant.from(variant)
      GObject::Lib.g_value_set_variant(self, _v1)
    end
    def take_boxed(v_boxed)
      _v1 = GirFFI::InPointer.from(:void, v_boxed)
      GObject::Lib.g_value_take_boxed(self, _v1)
    end
    def take_string(v_string)
      _v1 = GirFFI::InPointer.from(:utf8, v_string)
      GObject::Lib.g_value_take_string(self, _v1)
    end
    def take_variant(variant)
      _v1 = GLib::Variant.from(variant)
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
    def g_type
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(:GType, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def data
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(:c, _v1)
      _v3 = _v2.to_value
      _v4 = GirFFI::SizedArray.wrap(GObject::Private___Value__data__union, 2, _v3)
      _v4
    end
    def data=(value)
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new(:c, _v1)
      GirFFI::ArgHelper.check_fixed_array_size(2, value, "value")
      _v3 = GirFFI::SizedArray.from(GObject::Private___Value__data__union, 2, value)
      _v2.set_value(_v3)
    end
    def init_with_finalizer(type)
      return self if [TYPE_NONE, TYPE_INVALID].include?(type)
      init_without_finalizer(type)
      ObjectSpace.define_finalizer(self, self.class.make_finalizer(to_ptr))
      self
    end
    def init(g_type)
      _v1 = g_type
      _v2 = GObject::Lib.g_value_init(self, _v1)
      _v3 = GObject::Value.wrap(_v2).get_value
      return _v3
    end
    # TYPE_NONE is skipped
    def set_value(val)
      send(set_method, val)
    end
    def current_gtype
      @struct[:g_type]
    end
    def current_fundamental_type
      GObject.type_fundamental(current_gtype)
    end
    def current_gtype_name
      GObject.type_name(current_gtype)
    end
    def get_value
      value = get_value_plain
      (current_fundamental_type == TYPE_BOXED) ? (wrap_boxed(value)) : (value)
    end
    def get_value_plain
      send(get_method)
    end
    alias_method 'init', 'init_with_finalizer'
    alias_method 'init_without_finalizer', 'init'
    alias_method 'value=', 'set_value'
  end
  class GObject::ValueArray < GirFFI::StructBase
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def append(value)
      _v1 = GObject::Value.from(value)
      _v2 = GObject::Lib.g_value_array_append(self, _v1)
      _v3 = GObject::ValueArray.wrap(_v2)
      return _v3
    end
    def copy
      _v1 = GObject::Lib.g_value_array_copy(self)
      _v2 = GObject::ValueArray.wrap(_v1)
      return _v2
    end
    def free
      GObject::Lib.g_value_array_free(self)
    end
    def get_nth(index_)
      _v1 = index_
      _v2 = GObject::Lib.g_value_array_get_nth(self, _v1)
      _v3 = GObject::Value.wrap(_v2).get_value
      return _v3
    end
    def insert(index_, value)
      _v1 = index_
      _v2 = GObject::Value.from(value)
      _v3 = GObject::Lib.g_value_array_insert(self, _v1, _v2)
      _v4 = GObject::ValueArray.wrap(_v3)
      return _v4
    end
    def prepend(value)
      _v1 = GObject::Value.from(value)
      _v2 = GObject::Lib.g_value_array_prepend(self, _v1)
      _v3 = GObject::ValueArray.wrap(_v2)
      return _v3
    end
    def remove(index_)
      _v1 = index_
      _v2 = GObject::Lib.g_value_array_remove(self, _v1)
      _v3 = GObject::ValueArray.wrap(_v2)
      return _v3
    end
    def sort(&compare_func)
      _v1 = GLib::CompareDataFunc.from(compare_func)
      _v2 = GirFFI::InPointer.from_closure_data(_v1.object_id)
      _v3 = GObject::Lib.g_value_array_sort_with_data(self, _v1, _v2)
      _v4 = GObject::ValueArray.wrap(_v3)
      return _v4
    end
    def n_values
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
    def n_values=(value)
      _v1 = (@struct.to_ptr + 0)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = value
      _v2.set_value(_v3)
    end
    def values
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new([:pointer, GObject::Value], _v1)
      _v3 = _v2.to_value
      _v4 = GObject::Value.wrap(_v3)
      _v4
    end
    def values=(value)
      _v1 = (@struct.to_ptr + 8)
      _v2 = GirFFI::InOutPointer.new([:pointer, GObject::Value], _v1)
      _v3 = GObject::Value.from(value)
      _v2.set_value(_v3)
    end
    def n_prealloced
      _v1 = (@struct.to_ptr + 16)
      _v2 = GirFFI::InOutPointer.new(:guint32, _v1)
      _v3 = _v2.to_value
      _v3
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  class GObject::WeakRef < GirFFI::StructBase
  
  
  end
  # XXX: Don't know how to print union
  def self.boxed_copy(boxed_type, src_boxed)
    _v1 = boxed_type
    _v2 = GirFFI::InPointer.from(:void, src_boxed)
    _v3 = GObject::Lib.g_boxed_copy(_v1, _v2)
    return _v3
  end
  def self.boxed_free(boxed_type, boxed)
    _v1 = boxed_type
    _v2 = GirFFI::InPointer.from(:void, boxed)
    GObject::Lib.g_boxed_free(_v1, _v2)
  end
  def self.cclosure_marshal_BOOLEAN__BOXED_BOXED(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = GirFFI::InPointer.from(:void, invocation_hint)
    _v6 = GirFFI::InPointer.from(:void, marshal_data)
    GObject::Lib.g_cclosure_marshal_BOOLEAN__BOXED_BOXED(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_BOOLEAN__FLAGS(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = GirFFI::InPointer.from(:void, invocation_hint)
    _v6 = GirFFI::InPointer.from(:void, marshal_data)
    GObject::Lib.g_cclosure_marshal_BOOLEAN__FLAGS(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_STRING__OBJECT_POINTER(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = GirFFI::InPointer.from(:void, invocation_hint)
    _v6 = GirFFI::InPointer.from(:void, marshal_data)
    GObject::Lib.g_cclosure_marshal_STRING__OBJECT_POINTER(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__BOOLEAN(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = GirFFI::InPointer.from(:void, invocation_hint)
    _v6 = GirFFI::InPointer.from(:void, marshal_data)
    GObject::Lib.g_cclosure_marshal_VOID__BOOLEAN(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__BOXED(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = GirFFI::InPointer.from(:void, invocation_hint)
    _v6 = GirFFI::InPointer.from(:void, marshal_data)
    GObject::Lib.g_cclosure_marshal_VOID__BOXED(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__CHAR(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = GirFFI::InPointer.from(:void, invocation_hint)
    _v6 = GirFFI::InPointer.from(:void, marshal_data)
    GObject::Lib.g_cclosure_marshal_VOID__CHAR(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__DOUBLE(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = GirFFI::InPointer.from(:void, invocation_hint)
    _v6 = GirFFI::InPointer.from(:void, marshal_data)
    GObject::Lib.g_cclosure_marshal_VOID__DOUBLE(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__ENUM(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = GirFFI::InPointer.from(:void, invocation_hint)
    _v6 = GirFFI::InPointer.from(:void, marshal_data)
    GObject::Lib.g_cclosure_marshal_VOID__ENUM(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__FLAGS(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = GirFFI::InPointer.from(:void, invocation_hint)
    _v6 = GirFFI::InPointer.from(:void, marshal_data)
    GObject::Lib.g_cclosure_marshal_VOID__FLAGS(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__FLOAT(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = GirFFI::InPointer.from(:void, invocation_hint)
    _v6 = GirFFI::InPointer.from(:void, marshal_data)
    GObject::Lib.g_cclosure_marshal_VOID__FLOAT(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__INT(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = GirFFI::InPointer.from(:void, invocation_hint)
    _v6 = GirFFI::InPointer.from(:void, marshal_data)
    GObject::Lib.g_cclosure_marshal_VOID__INT(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__LONG(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = GirFFI::InPointer.from(:void, invocation_hint)
    _v6 = GirFFI::InPointer.from(:void, marshal_data)
    GObject::Lib.g_cclosure_marshal_VOID__LONG(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__OBJECT(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = GirFFI::InPointer.from(:void, invocation_hint)
    _v6 = GirFFI::InPointer.from(:void, marshal_data)
    GObject::Lib.g_cclosure_marshal_VOID__OBJECT(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__PARAM(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = GirFFI::InPointer.from(:void, invocation_hint)
    _v6 = GirFFI::InPointer.from(:void, marshal_data)
    GObject::Lib.g_cclosure_marshal_VOID__PARAM(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__POINTER(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = GirFFI::InPointer.from(:void, invocation_hint)
    _v6 = GirFFI::InPointer.from(:void, marshal_data)
    GObject::Lib.g_cclosure_marshal_VOID__POINTER(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__STRING(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = GirFFI::InPointer.from(:void, invocation_hint)
    _v6 = GirFFI::InPointer.from(:void, marshal_data)
    GObject::Lib.g_cclosure_marshal_VOID__STRING(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__UCHAR(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = GirFFI::InPointer.from(:void, invocation_hint)
    _v6 = GirFFI::InPointer.from(:void, marshal_data)
    GObject::Lib.g_cclosure_marshal_VOID__UCHAR(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__UINT(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = GirFFI::InPointer.from(:void, invocation_hint)
    _v6 = GirFFI::InPointer.from(:void, marshal_data)
    GObject::Lib.g_cclosure_marshal_VOID__UINT(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__UINT_POINTER(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = GirFFI::InPointer.from(:void, invocation_hint)
    _v6 = GirFFI::InPointer.from(:void, marshal_data)
    GObject::Lib.g_cclosure_marshal_VOID__UINT_POINTER(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__ULONG(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = GirFFI::InPointer.from(:void, invocation_hint)
    _v6 = GirFFI::InPointer.from(:void, marshal_data)
    GObject::Lib.g_cclosure_marshal_VOID__ULONG(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__VARIANT(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = GirFFI::InPointer.from(:void, invocation_hint)
    _v6 = GirFFI::InPointer.from(:void, marshal_data)
    GObject::Lib.g_cclosure_marshal_VOID__VARIANT(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_VOID__VOID(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_value)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = GirFFI::InPointer.from(:void, invocation_hint)
    _v6 = GirFFI::InPointer.from(:void, marshal_data)
    GObject::Lib.g_cclosure_marshal_VOID__VOID(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.cclosure_marshal_generic(closure, return_gvalue, n_param_values, param_values, invocation_hint, marshal_data)
    _v1 = GObject::Closure.from(closure)
    _v2 = GObject::Value.from(return_gvalue)
    _v3 = n_param_values
    _v4 = GObject::Value.from(param_values)
    _v5 = GirFFI::InPointer.from(:void, invocation_hint)
    _v6 = GirFFI::InPointer.from(:void, marshal_data)
    GObject::Lib.g_cclosure_marshal_generic(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.enum_complete_type_info(g_enum_type, const_values)
    _v1 = g_enum_type
    _v2 = GirFFI::InOutPointer.for(GObject::TypeInfo)
    _v3 = GObject::EnumValue.from(const_values)
    GObject::Lib.g_enum_complete_type_info(_v1, _v2, _v3)
    _v4 = GObject::TypeInfo.wrap(_v2.to_value)
    return _v4
  end
  def self.enum_get_value(enum_class, value)
    _v1 = GObject::EnumClass.from(enum_class)
    _v2 = value
    _v3 = GObject::Lib.g_enum_get_value(_v1, _v2)
    _v4 = GObject::EnumValue.wrap(_v3)
    return _v4
  end
  def self.enum_get_value_by_name(enum_class, name)
    _v1 = GObject::EnumClass.from(enum_class)
    _v2 = GirFFI::InPointer.from(:utf8, name)
    _v3 = GObject::Lib.g_enum_get_value_by_name(_v1, _v2)
    _v4 = GObject::EnumValue.wrap(_v3)
    return _v4
  end
  def self.enum_get_value_by_nick(enum_class, nick)
    _v1 = GObject::EnumClass.from(enum_class)
    _v2 = GirFFI::InPointer.from(:utf8, nick)
    _v3 = GObject::Lib.g_enum_get_value_by_nick(_v1, _v2)
    _v4 = GObject::EnumValue.wrap(_v3)
    return _v4
  end
  def self.enum_register_static(name, const_static_values)
    _v1 = GirFFI::InPointer.from(:utf8, name)
    _v2 = GObject::EnumValue.from(const_static_values)
    _v3 = GObject::Lib.g_enum_register_static(_v1, _v2)
    return _v3
  end
  def self.flags_complete_type_info(g_flags_type, const_values)
    _v1 = g_flags_type
    _v2 = GirFFI::InOutPointer.for(GObject::TypeInfo)
    _v3 = GObject::FlagsValue.from(const_values)
    GObject::Lib.g_flags_complete_type_info(_v1, _v2, _v3)
    _v4 = GObject::TypeInfo.wrap(_v2.to_value)
    return _v4
  end
  def self.flags_get_first_value(flags_class, value)
    _v1 = GObject::FlagsClass.from(flags_class)
    _v2 = value
    _v3 = GObject::Lib.g_flags_get_first_value(_v1, _v2)
    _v4 = GObject::FlagsValue.wrap(_v3)
    return _v4
  end
  def self.flags_get_value_by_name(flags_class, name)
    _v1 = GObject::FlagsClass.from(flags_class)
    _v2 = GirFFI::InPointer.from(:utf8, name)
    _v3 = GObject::Lib.g_flags_get_value_by_name(_v1, _v2)
    _v4 = GObject::FlagsValue.wrap(_v3)
    return _v4
  end
  def self.flags_get_value_by_nick(flags_class, nick)
    _v1 = GObject::FlagsClass.from(flags_class)
    _v2 = GirFFI::InPointer.from(:utf8, nick)
    _v3 = GObject::Lib.g_flags_get_value_by_nick(_v1, _v2)
    _v4 = GObject::FlagsValue.wrap(_v3)
    return _v4
  end
  def self.flags_register_static(name, const_static_values)
    _v1 = GirFFI::InPointer.from(:utf8, name)
    _v2 = GObject::FlagsValue.from(const_static_values)
    _v3 = GObject::Lib.g_flags_register_static(_v1, _v2)
    return _v3
  end
  def self.gtype_get_type
    _v1 = GObject::Lib.g_gtype_get_type
    return _v1
  end
  def self.param_spec_boolean(name, nick, blurb, default_value, flags)
    _v1 = GirFFI::InPointer.from(:utf8, name)
    _v2 = GirFFI::InPointer.from(:utf8, nick)
    _v3 = GirFFI::InPointer.from(:utf8, blurb)
    _v4 = default_value
    _v5 = flags
    _v6 = GObject::Lib.g_param_spec_boolean(_v1, _v2, _v3, _v4, _v5)
    _v7 = GObject::ParamSpec.wrap(_v6)
    return _v7
  end
  def self.param_spec_boxed(name, nick, blurb, boxed_type, flags)
    _v1 = GirFFI::InPointer.from(:utf8, name)
    _v2 = GirFFI::InPointer.from(:utf8, nick)
    _v3 = GirFFI::InPointer.from(:utf8, blurb)
    _v4 = boxed_type
    _v5 = flags
    _v6 = GObject::Lib.g_param_spec_boxed(_v1, _v2, _v3, _v4, _v5)
    _v7 = GObject::ParamSpec.wrap(_v6)
    return _v7
  end
  def self.param_spec_char(name, nick, blurb, minimum, maximum, default_value, flags)
    _v1 = GirFFI::InPointer.from(:utf8, name)
    _v2 = GirFFI::InPointer.from(:utf8, nick)
    _v3 = GirFFI::InPointer.from(:utf8, blurb)
    _v4 = minimum
    _v5 = maximum
    _v6 = default_value
    _v7 = flags
    _v8 = GObject::Lib.g_param_spec_char(_v1, _v2, _v3, _v4, _v5, _v6, _v7)
    _v9 = GObject::ParamSpec.wrap(_v8)
    return _v9
  end
  def self.param_spec_double(name, nick, blurb, minimum, maximum, default_value, flags)
    _v1 = GirFFI::InPointer.from(:utf8, name)
    _v2 = GirFFI::InPointer.from(:utf8, nick)
    _v3 = GirFFI::InPointer.from(:utf8, blurb)
    _v4 = minimum
    _v5 = maximum
    _v6 = default_value
    _v7 = flags
    _v8 = GObject::Lib.g_param_spec_double(_v1, _v2, _v3, _v4, _v5, _v6, _v7)
    _v9 = GObject::ParamSpec.wrap(_v8)
    return _v9
  end
  def self.param_spec_enum(name, nick, blurb, enum_type, default_value, flags)
    _v1 = GirFFI::InPointer.from(:utf8, name)
    _v2 = GirFFI::InPointer.from(:utf8, nick)
    _v3 = GirFFI::InPointer.from(:utf8, blurb)
    _v4 = enum_type
    _v5 = default_value
    _v6 = flags
    _v7 = GObject::Lib.g_param_spec_enum(_v1, _v2, _v3, _v4, _v5, _v6)
    _v8 = GObject::ParamSpec.wrap(_v7)
    return _v8
  end
  def self.param_spec_flags(name, nick, blurb, flags_type, default_value, flags)
    _v1 = GirFFI::InPointer.from(:utf8, name)
    _v2 = GirFFI::InPointer.from(:utf8, nick)
    _v3 = GirFFI::InPointer.from(:utf8, blurb)
    _v4 = flags_type
    _v5 = default_value
    _v6 = flags
    _v7 = GObject::Lib.g_param_spec_flags(_v1, _v2, _v3, _v4, _v5, _v6)
    _v8 = GObject::ParamSpec.wrap(_v7)
    return _v8
  end
  def self.param_spec_float(name, nick, blurb, minimum, maximum, default_value, flags)
    _v1 = GirFFI::InPointer.from(:utf8, name)
    _v2 = GirFFI::InPointer.from(:utf8, nick)
    _v3 = GirFFI::InPointer.from(:utf8, blurb)
    _v4 = minimum
    _v5 = maximum
    _v6 = default_value
    _v7 = flags
    _v8 = GObject::Lib.g_param_spec_float(_v1, _v2, _v3, _v4, _v5, _v6, _v7)
    _v9 = GObject::ParamSpec.wrap(_v8)
    return _v9
  end
  def self.param_spec_gtype(name, nick, blurb, is_a_type, flags)
    _v1 = GirFFI::InPointer.from(:utf8, name)
    _v2 = GirFFI::InPointer.from(:utf8, nick)
    _v3 = GirFFI::InPointer.from(:utf8, blurb)
    _v4 = is_a_type
    _v5 = flags
    _v6 = GObject::Lib.g_param_spec_gtype(_v1, _v2, _v3, _v4, _v5)
    _v7 = GObject::ParamSpec.wrap(_v6)
    return _v7
  end
  # Smells of :reek:LongParameterList: due to the C interface.
  # rubocop:disable Metrics/ParameterLists
  def self.param_spec_int(name, nick, blurb, minimum, maximum, default_value, flags)
    ptr = Lib.g_param_spec_int(name, nick, blurb, minimum, maximum, default_value, flags)
    ParamSpecInt.wrap(ptr)
  end
  def self.param_spec_int64(name, nick, blurb, minimum, maximum, default_value, flags)
    _v1 = GirFFI::InPointer.from(:utf8, name)
    _v2 = GirFFI::InPointer.from(:utf8, nick)
    _v3 = GirFFI::InPointer.from(:utf8, blurb)
    _v4 = minimum
    _v5 = maximum
    _v6 = default_value
    _v7 = flags
    _v8 = GObject::Lib.g_param_spec_int64(_v1, _v2, _v3, _v4, _v5, _v6, _v7)
    _v9 = GObject::ParamSpec.wrap(_v8)
    return _v9
  end
  def self.param_spec_long(name, nick, blurb, minimum, maximum, default_value, flags)
    _v1 = GirFFI::InPointer.from(:utf8, name)
    _v2 = GirFFI::InPointer.from(:utf8, nick)
    _v3 = GirFFI::InPointer.from(:utf8, blurb)
    _v4 = minimum
    _v5 = maximum
    _v6 = default_value
    _v7 = flags
    _v8 = GObject::Lib.g_param_spec_long(_v1, _v2, _v3, _v4, _v5, _v6, _v7)
    _v9 = GObject::ParamSpec.wrap(_v8)
    return _v9
  end
  def self.param_spec_object(name, nick, blurb, object_type, flags)
    _v1 = GirFFI::InPointer.from(:utf8, name)
    _v2 = GirFFI::InPointer.from(:utf8, nick)
    _v3 = GirFFI::InPointer.from(:utf8, blurb)
    _v4 = object_type
    _v5 = flags
    _v6 = GObject::Lib.g_param_spec_object(_v1, _v2, _v3, _v4, _v5)
    _v7 = GObject::ParamSpec.wrap(_v6)
    return _v7
  end
  def self.param_spec_param(name, nick, blurb, param_type, flags)
    _v1 = GirFFI::InPointer.from(:utf8, name)
    _v2 = GirFFI::InPointer.from(:utf8, nick)
    _v3 = GirFFI::InPointer.from(:utf8, blurb)
    _v4 = param_type
    _v5 = flags
    _v6 = GObject::Lib.g_param_spec_param(_v1, _v2, _v3, _v4, _v5)
    _v7 = GObject::ParamSpec.wrap(_v6)
    return _v7
  end
  def self.param_spec_pointer(name, nick, blurb, flags)
    _v1 = GirFFI::InPointer.from(:utf8, name)
    _v2 = GirFFI::InPointer.from(:utf8, nick)
    _v3 = GirFFI::InPointer.from(:utf8, blurb)
    _v4 = flags
    _v5 = GObject::Lib.g_param_spec_pointer(_v1, _v2, _v3, _v4)
    _v6 = GObject::ParamSpec.wrap(_v5)
    return _v6
  end
  def self.param_spec_pool_new(type_prefixing)
    _v1 = type_prefixing
    _v2 = GObject::Lib.g_param_spec_pool_new(_v1)
    _v3 = GObject::ParamSpecPool.wrap(_v2)
    return _v3
  end
  def self.param_spec_string(name, nick, blurb, default_value, flags)
    _v1 = GirFFI::InPointer.from(:utf8, name)
    _v2 = GirFFI::InPointer.from(:utf8, nick)
    _v3 = GirFFI::InPointer.from(:utf8, blurb)
    _v4 = GirFFI::InPointer.from(:utf8, default_value)
    _v5 = flags
    _v6 = GObject::Lib.g_param_spec_string(_v1, _v2, _v3, _v4, _v5)
    _v7 = GObject::ParamSpec.wrap(_v6)
    return _v7
  end
  def self.param_spec_uchar(name, nick, blurb, minimum, maximum, default_value, flags)
    _v1 = GirFFI::InPointer.from(:utf8, name)
    _v2 = GirFFI::InPointer.from(:utf8, nick)
    _v3 = GirFFI::InPointer.from(:utf8, blurb)
    _v4 = minimum
    _v5 = maximum
    _v6 = default_value
    _v7 = flags
    _v8 = GObject::Lib.g_param_spec_uchar(_v1, _v2, _v3, _v4, _v5, _v6, _v7)
    _v9 = GObject::ParamSpec.wrap(_v8)
    return _v9
  end
  def self.param_spec_uint(name, nick, blurb, minimum, maximum, default_value, flags)
    _v1 = GirFFI::InPointer.from(:utf8, name)
    _v2 = GirFFI::InPointer.from(:utf8, nick)
    _v3 = GirFFI::InPointer.from(:utf8, blurb)
    _v4 = minimum
    _v5 = maximum
    _v6 = default_value
    _v7 = flags
    _v8 = GObject::Lib.g_param_spec_uint(_v1, _v2, _v3, _v4, _v5, _v6, _v7)
    _v9 = GObject::ParamSpec.wrap(_v8)
    return _v9
  end
  def self.param_spec_uint64(name, nick, blurb, minimum, maximum, default_value, flags)
    _v1 = GirFFI::InPointer.from(:utf8, name)
    _v2 = GirFFI::InPointer.from(:utf8, nick)
    _v3 = GirFFI::InPointer.from(:utf8, blurb)
    _v4 = minimum
    _v5 = maximum
    _v6 = default_value
    _v7 = flags
    _v8 = GObject::Lib.g_param_spec_uint64(_v1, _v2, _v3, _v4, _v5, _v6, _v7)
    _v9 = GObject::ParamSpec.wrap(_v8)
    return _v9
  end
  def self.param_spec_ulong(name, nick, blurb, minimum, maximum, default_value, flags)
    _v1 = GirFFI::InPointer.from(:utf8, name)
    _v2 = GirFFI::InPointer.from(:utf8, nick)
    _v3 = GirFFI::InPointer.from(:utf8, blurb)
    _v4 = minimum
    _v5 = maximum
    _v6 = default_value
    _v7 = flags
    _v8 = GObject::Lib.g_param_spec_ulong(_v1, _v2, _v3, _v4, _v5, _v6, _v7)
    _v9 = GObject::ParamSpec.wrap(_v8)
    return _v9
  end
  def self.param_spec_unichar(name, nick, blurb, default_value, flags)
    _v1 = GirFFI::InPointer.from(:utf8, name)
    _v2 = GirFFI::InPointer.from(:utf8, nick)
    _v3 = GirFFI::InPointer.from(:utf8, blurb)
    _v4 = default_value
    _v5 = flags
    _v6 = GObject::Lib.g_param_spec_unichar(_v1, _v2, _v3, _v4, _v5)
    _v7 = GObject::ParamSpec.wrap(_v6)
    return _v7
  end
  def self.param_spec_variant(name, nick, blurb, type, default_value, flags)
    _v1 = GirFFI::InPointer.from(:utf8, name)
    _v2 = GirFFI::InPointer.from(:utf8, nick)
    _v3 = GirFFI::InPointer.from(:utf8, blurb)
    _v4 = GLib::VariantType.from(type)
    _v5 = GLib::Variant.from(default_value)
    _v6 = flags
    _v7 = GObject::Lib.g_param_spec_variant(_v1, _v2, _v3, _v4, _v5, _v6)
    _v8 = GObject::ParamSpec.wrap(_v7)
    return _v8
  end
  def self.param_type_register_static(name, pspec_info)
    _v1 = GirFFI::InPointer.from(:utf8, name)
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
    _v1 = GirFFI::InPointer.from(:utf8, name)
    _v2 = GObject::Lib.g_pointer_type_register_static(_v1)
    return _v2
  end
  def self.signal_accumulator_first_wins(ihint, return_accu, handler_return, dummy)
    _v1 = GObject::SignalInvocationHint.from(ihint)
    _v2 = GObject::Value.from(return_accu)
    _v3 = GObject::Value.from(handler_return)
    _v4 = GirFFI::InPointer.from(:void, dummy)
    _v5 = GObject::Lib.g_signal_accumulator_first_wins(_v1, _v2, _v3, _v4)
    return _v5
  end
  def self.signal_accumulator_true_handled(ihint, return_accu, handler_return, dummy)
    _v1 = GObject::SignalInvocationHint.from(ihint)
    _v2 = GObject::Value.from(return_accu)
    _v3 = GObject::Value.from(handler_return)
    _v4 = GirFFI::InPointer.from(:void, dummy)
    _v5 = GObject::Lib.g_signal_accumulator_true_handled(_v1, _v2, _v3, _v4)
    return _v5
  end
  def self.signal_add_emission_hook(signal_id, detail, &hook_func)
    _v1 = signal_id
    _v2 = detail
    _v3 = GObject::SignalEmissionHook.from(hook_func)
    _v4 = GirFFI::InPointer.from_closure_data(_v3.object_id)
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
    _v2 = GirFFI::InPointer.from(:utf8, detailed_signal)
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
    _v4 = GirFFI::InOutPointer.for(GObject::Value)
    _v4.set_value(GObject::Value.from(return_value))
    GObject::Lib.g_signal_emitv(_v1, _v2, _v3, _v4)
    _v5 = GObject::Value.wrap(_v4.to_value).get_value
    return _v5
  end
  def self.signal_get_invocation_hint(instance)
    _v1 = GObject::Object.from(instance)
    _v2 = GObject::Lib.g_signal_get_invocation_hint(_v1)
    _v3 = GObject::SignalInvocationHint.wrap(_v2)
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
  def self.signal_handler_find(instance, mask, signal_id, detail, closure, func, data)
    _v1 = GObject::Object.from(instance)
    _v2 = mask
    _v3 = signal_id
    _v4 = detail
    _v5 = GObject::Closure.from(closure)
    _v6 = GirFFI::InPointer.from(:void, func)
    _v7 = GirFFI::InPointer.from(:void, data)
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
  def self.signal_handlers_block_matched(instance, mask, signal_id, detail, closure, func, data)
    _v1 = GObject::Object.from(instance)
    _v2 = mask
    _v3 = signal_id
    _v4 = detail
    _v5 = GObject::Closure.from(closure)
    _v6 = GirFFI::InPointer.from(:void, func)
    _v7 = GirFFI::InPointer.from(:void, data)
    _v8 = GObject::Lib.g_signal_handlers_block_matched(_v1, _v2, _v3, _v4, _v5, _v6, _v7)
    return _v8
  end
  def self.signal_handlers_destroy(instance)
    _v1 = GObject::Object.from(instance)
    GObject::Lib.g_signal_handlers_destroy(_v1)
  end
  def self.signal_handlers_disconnect_matched(instance, mask, signal_id, detail, closure, func, data)
    _v1 = GObject::Object.from(instance)
    _v2 = mask
    _v3 = signal_id
    _v4 = detail
    _v5 = GObject::Closure.from(closure)
    _v6 = GirFFI::InPointer.from(:void, func)
    _v7 = GirFFI::InPointer.from(:void, data)
    _v8 = GObject::Lib.g_signal_handlers_disconnect_matched(_v1, _v2, _v3, _v4, _v5, _v6, _v7)
    return _v8
  end
  def self.signal_handlers_unblock_matched(instance, mask, signal_id, detail, closure, func, data)
    _v1 = GObject::Object.from(instance)
    _v2 = mask
    _v3 = signal_id
    _v4 = detail
    _v5 = GObject::Closure.from(closure)
    _v6 = GirFFI::InPointer.from(:void, func)
    _v7 = GirFFI::InPointer.from(:void, data)
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
  def self.signal_list_ids(itype)
    _v1 = itype
    _v2 = GirFFI::InOutPointer.for(:guint32)
    _v3 = GObject::Lib.g_signal_list_ids(_v1, _v2)
    _v4 = _v2.to_value
    _v5 = GirFFI::SizedArray.wrap(:guint32, _v4, _v3)
    return _v5
  end
  def self.signal_lookup(name, itype)
    _v1 = GirFFI::InPointer.from(:utf8, name)
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
  def self.signal_parse_name(detailed_signal, itype, force_detail_quark)
    _v1 = GirFFI::InPointer.from(:utf8, detailed_signal)
    _v2 = itype
    _v3 = GirFFI::InOutPointer.for(:guint32)
    _v4 = GirFFI::InOutPointer.for(:guint32)
    _v5 = force_detail_quark
    _v6 = GObject::Lib.g_signal_parse_name(_v1, _v2, _v3, _v4, _v5)
    _v7 = _v3.to_value
    _v8 = _v4.to_value
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
  def self.signal_set_va_marshaller(signal_id, instance_type, va_marshaller)
    _v1 = signal_id
    _v2 = instance_type
    _v3 = va_marshaller
    GObject::Lib.g_signal_set_va_marshaller(_v1, _v2, _v3)
  end
  def self.signal_stop_emission(instance, signal_id, detail)
    _v1 = GObject::Object.from(instance)
    _v2 = signal_id
    _v3 = detail
    GObject::Lib.g_signal_stop_emission(_v1, _v2, _v3)
  end
  def self.signal_stop_emission_by_name(instance, detailed_signal)
    _v1 = GObject::Object.from(instance)
    _v2 = GirFFI::InPointer.from(:utf8, detailed_signal)
    GObject::Lib.g_signal_stop_emission_by_name(_v1, _v2)
  end
  def self.signal_type_cclosure_new(itype, struct_offset)
    _v1 = itype
    _v2 = struct_offset
    _v3 = GObject::Lib.g_signal_type_cclosure_new(_v1, _v2)
    _v4 = GObject::Closure.wrap(_v3)
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
    _v3 = _v2.to_utf8
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
    _v2 = GirFFI::InOutPointer.for(:guint32)
    _v3 = GObject::Lib.g_type_children(_v1, _v2)
    _v4 = _v2.to_value
    _v5 = GirFFI::SizedArray.wrap(:GType, _v4, _v3)
    return _v5
  end
  def self.type_class_add_private(g_class, private_size)
    _v1 = GirFFI::InPointer.from(:void, g_class)
    _v2 = private_size
    GObject::Lib.g_type_class_add_private(_v1, _v2)
  end
  def self.type_class_adjust_private_offset(g_class, private_size_or_offset)
    _v1 = GirFFI::InPointer.from(:void, g_class)
    _v2 = private_size_or_offset
    GObject::Lib.g_type_class_adjust_private_offset(_v1, _v2)
  end
  def self.type_class_peek(type)
    _v1 = type
    _v2 = GObject::Lib.g_type_class_peek(_v1)
    _v3 = GObject::TypeClass.wrap(_v2)
    return _v3
  end
  def self.type_class_peek_static(type)
    _v1 = type
    _v2 = GObject::Lib.g_type_class_peek_static(_v1)
    _v3 = GObject::TypeClass.wrap(_v2)
    return _v3
  end
  def self.type_class_ref(type)
    _v1 = type
    _v2 = GObject::Lib.g_type_class_ref(_v1)
    _v3 = GObject::TypeClass.wrap(_v2)
    return _v3
  end
  def self.type_default_interface_peek(g_type)
    _v1 = g_type
    _v2 = GObject::Lib.g_type_default_interface_peek(_v1)
    _v3 = GObject::TypeInterface.wrap(_v2)
    return _v3
  end
  def self.type_default_interface_ref(g_type)
    _v1 = g_type
    _v2 = GObject::Lib.g_type_default_interface_ref(_v1)
    _v3 = GObject::TypeInterface.wrap(_v2)
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
    _v1 = GirFFI::InPointer.from(:utf8, name)
    _v2 = GObject::Lib.g_type_from_name(_v1)
    return _v2
  end
  def self.type_fundamental(type_id)
    _v1 = type_id
    _v2 = GObject::Lib.g_type_fundamental(_v1)
    return _v2
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
    Lib.g_type_init
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
  def self.type_interface_peek(instance_class, iface_type)
    _v1 = GObject::TypeClass.from(instance_class)
    _v2 = iface_type
    _v3 = GObject::Lib.g_type_interface_peek(_v1, _v2)
    _v4 = GObject::TypeInterface.wrap(_v3)
    return _v4
  end
  def self.type_interface_prerequisites(interface_type)
    _v1 = interface_type
    _v2 = GirFFI::InOutPointer.for(:guint32)
    _v3 = GObject::Lib.g_type_interface_prerequisites(_v1, _v2)
    _v4 = _v2.to_value
    _v5 = GirFFI::SizedArray.wrap(:GType, _v4, _v3)
    return _v5
  end
  def self.type_interfaces(type)
    _v1 = type
    _v2 = GirFFI::InOutPointer.for(:guint32)
    _v3 = GObject::Lib.g_type_interfaces(_v1, _v2)
    _v4 = _v2.to_value
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
    _v1 = GObject::TypeInstance.from(instance)
    _v2 = GObject::Lib.g_type_name_from_instance(_v1)
    _v3 = _v2.to_utf8
    return _v3
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
    _v2 = GirFFI::InPointer.from(:utf8, type_name)
    _v3 = plugin
    _v4 = flags
    _v5 = GObject::Lib.g_type_register_dynamic(_v1, _v2, _v3, _v4)
    return _v5
  end
  def self.type_register_fundamental(type_id, type_name, info, finfo, flags)
    _v1 = type_id
    _v2 = GirFFI::InPointer.from(:utf8, type_name)
    _v3 = GObject::TypeInfo.from(info)
    _v4 = GObject::TypeFundamentalInfo.from(finfo)
    _v5 = flags
    _v6 = GObject::Lib.g_type_register_fundamental(_v1, _v2, _v3, _v4, _v5)
    return _v6
  end
  def self.type_register_static(parent_type, type_name, info, flags)
    _v1 = parent_type
    _v2 = GirFFI::InPointer.from(:utf8, type_name)
    _v3 = GObject::TypeInfo.from(info)
    _v4 = flags
    _v5 = GObject::Lib.g_type_register_static(_v1, _v2, _v3, _v4)
    return _v5
  end
  def self.type_set_qdata(type, quark, data)
    _v1 = type
    _v2 = quark
    _v3 = GirFFI::InPointer.from(:void, data)
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
end
