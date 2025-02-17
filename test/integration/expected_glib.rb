module GLib
  ALLOCATOR_LIST = 1
  ALLOCATOR_NODE = 3
  ALLOCATOR_SLIST = 2
  ALLOC_AND_FREE = 2
  ALLOC_ONLY = 1
  ANALYZER_ANALYZING = 1
  ASCII_DTOSTR_BUF_SIZE = 39
  ATOMIC_REF_COUNT_INIT = 1
  class GLib::Allocator < GirFFI::StructBase
  
    def free
      GLib::Lib.g_allocator_free(self)
    end
  end
  class GLib::Array < GirFFI::BoxedBase
    def self.calculated_element_size(type)
      ffi_type = GirFFI::TypeMap.type_specification_to_ffi_type(type)
      FFI.type_size(ffi_type)
    end
    def self.from_enumerable(elmtype, arr)
      new(elmtype).tap { |it| it.append_vals(arr) }
    end
    def ==(other)
      (to_a == other.to_a)
    end
    # @override
    def append_vals(ary)
      bytes = GirFFI::InPointer.from_array(element_type, ary)
      Lib.g_array_append_vals(self, bytes, ary.length)
      self
    end
    def data
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(0)
      _v3 = _v2.to_utf8
      _v3
    end
    def data=(value)
      _v1 = @struct.to_ptr
      _v2 = GirFFI::InPointer.from_utf8(value)
      _v1.put_pointer(0, _v2)
    end
    def each
      length.times { |idx| yield(index(idx)) }
    end
    def get_element_size
      Lib.g_array_get_element_size(self)
    end
    # Re-implementation of the g_array_index macro
    def index(idx)
      unless (0...length).cover?(idx) then
        raise(IndexError, "Index #{idx} outside of bounds 0..#{(length - 1)}")
      end
      item_ptr = (data_ptr + (idx * element_size))
      convertor = GirFFI::ArrayElementConvertor.new(element_type, item_ptr)
      convertor.to_ruby_value
    end
    def len
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(8)
      _v2
    end
    def len=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(8, _v2)
    end
    def length
      struct[:len]
    end
    # @api private
    def reset_typespec(typespec = nil)
      if typespec then
        @element_type = typespec
        check_element_size_match
      else
        @element_type = guess_element_type
      end
      self
    end
    alias_method 'element_size', 'get_element_size'
  end
  # XXX: Don't know how to print flags
  class GLib::AsyncQueue < GirFFI::StructBase
    def self.new
      _v1 = GLib::Lib.g_async_queue_new
      _v2 = GLib::AsyncQueue.wrap_own(_v1)
      return _v2
    end
    def self.new_full(&item_free_func)
      _v1 = GLib::DestroyNotify.from(item_free_func)
      _v2 = GLib::Lib.g_async_queue_new_full(_v1)
      _v3 = GLib::AsyncQueue.wrap_own(_v2)
      return _v3
    end
    def length
      _v1 = GLib::Lib.g_async_queue_length(self)
      return _v1
    end
    def length_unlocked
      _v1 = GLib::Lib.g_async_queue_length_unlocked(self)
      return _v1
    end
    def lock
      GLib::Lib.g_async_queue_lock(self)
    end
    def pop
      _v1 = GLib::Lib.g_async_queue_pop(self)
      return _v1
    end
    def pop_unlocked
      _v1 = GLib::Lib.g_async_queue_pop_unlocked(self)
      return _v1
    end
    def push(data)
      _v1 = data
      GLib::Lib.g_async_queue_push(self, _v1)
    end
    def push_front(item)
      _v1 = item
      GLib::Lib.g_async_queue_push_front(self, _v1)
    end
    def push_front_unlocked(item)
      _v1 = item
      GLib::Lib.g_async_queue_push_front_unlocked(self, _v1)
    end
    def push_sorted(data, &func)
      _v1 = data
      _v2 = GLib::CompareDataFunc.from(func)
      _v3 = GirFFI::ArgHelper.store(_v2)
      GLib::Lib.g_async_queue_push_sorted(self, _v1, _v2, _v3)
    end
    def push_sorted_unlocked(data = nil, &func)
      _v1 = data
      _v2 = GLib::CompareDataFunc.from(func)
      _v3 = GirFFI::ArgHelper.store(_v2)
      GLib::Lib.g_async_queue_push_sorted_unlocked(self, _v1, _v2, _v3)
    end
    def push_unlocked(data)
      _v1 = data
      GLib::Lib.g_async_queue_push_unlocked(self, _v1)
    end
    def ref
      _v1 = GLib::Lib.g_async_queue_ref(self)
      _v2 = GLib::AsyncQueue.wrap_own(_v1)
      return _v2
    end
    def ref_unlocked
      GLib::Lib.g_async_queue_ref_unlocked(self)
    end
    def remove(item)
      _v1 = item
      _v2 = GLib::Lib.g_async_queue_remove(self, _v1)
      return _v2
    end
    def remove_unlocked(item = nil)
      _v1 = item
      _v2 = GLib::Lib.g_async_queue_remove_unlocked(self, _v1)
      return _v2
    end
    def sort(&func)
      _v1 = GLib::CompareDataFunc.from(func)
      _v2 = GirFFI::ArgHelper.store(_v1)
      GLib::Lib.g_async_queue_sort(self, _v1, _v2)
    end
    def sort_unlocked(&func)
      _v1 = GLib::CompareDataFunc.from(func)
      _v2 = GirFFI::ArgHelper.store(_v1)
      GLib::Lib.g_async_queue_sort_unlocked(self, _v1, _v2)
    end
    def timed_pop(end_time)
      _v1 = GLib::TimeVal.from(end_time)
      _v2 = GLib::Lib.g_async_queue_timed_pop(self, _v1)
      return _v2
    end
    def timed_pop_unlocked(end_time)
      _v1 = GLib::TimeVal.from(end_time)
      _v2 = GLib::Lib.g_async_queue_timed_pop_unlocked(self, _v1)
      return _v2
    end
    def timeout_pop(timeout)
      _v1 = timeout
      _v2 = GLib::Lib.g_async_queue_timeout_pop(self, _v1)
      return _v2
    end
    def timeout_pop_unlocked(timeout)
      _v1 = timeout
      _v2 = GLib::Lib.g_async_queue_timeout_pop_unlocked(self, _v1)
      return _v2
    end
    def try_pop
      _v1 = GLib::Lib.g_async_queue_try_pop(self)
      return _v1
    end
    def try_pop_unlocked
      _v1 = GLib::Lib.g_async_queue_try_pop_unlocked(self)
      return _v1
    end
    def unlock
      GLib::Lib.g_async_queue_unlock(self)
    end
    def unref
      GLib::Lib.g_async_queue_unref(self)
    end
    def unref_and_unlock
      GLib::Lib.g_async_queue_unref_and_unlock(self)
    end
  end
  BIG_ENDIAN = 4321
  class GLib::BookmarkFile < GirFFI::BoxedBase
    def self.error_quark
      _v1 = GLib::Lib.g_bookmark_file_error_quark
      return _v1
    end
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def add_application(uri, name = nil, exec = nil)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = GirFFI::InPointer.from_utf8(name)
      _v3 = GirFFI::InPointer.from_utf8(exec)
      GLib::Lib.g_bookmark_file_add_application(self, _v1, _v2, _v3)
    end
    def add_group(uri, group)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = GirFFI::InPointer.from_utf8(group)
      GLib::Lib.g_bookmark_file_add_group(self, _v1, _v2)
    end
    def copy
      _v1 = GLib::Lib.g_bookmark_file_copy(self)
      _v2 = GLib::BookmarkFile.wrap_own(_v1)
      return _v2
    end
    def free
      GLib::Lib.g_bookmark_file_free(self)
    end
    def get_added(uri)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_bookmark_file_get_added(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      return _v3
    end
    def get_added_date_time(uri)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_bookmark_file_get_added_date_time(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      _v4 = GLib::DateTime.wrap_copy(_v3)
      return _v4
    end
    def get_app_info(uri, name)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = GirFFI::InPointer.from_utf8(name)
      _v3 = FFI::MemoryPointer.new(:pointer)
      _v4 = FFI::MemoryPointer.new(:uint32)
      _v5 = FFI::MemoryPointer.new(:int64)
      _v6 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v7 = GLib::Lib.g_bookmark_file_get_app_info(self, _v1, _v2, _v3, _v4, _v5, _v6)
      GirFFI::ArgHelper.check_error(_v6)
      _v8 = GirFFI::AllocationHelper.free_after(_v3.get_pointer(0), &:to_utf8)
      _v9 = _v4.get_uint32(0)
      _v10 = _v5.get_int64(0)
      return [_v7, _v8, _v9, _v10]
    end
    def get_application_info(uri, name)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = GirFFI::InPointer.from_utf8(name)
      _v3 = FFI::MemoryPointer.new(:pointer)
      _v4 = FFI::MemoryPointer.new(:uint32)
      _v5 = FFI::MemoryPointer.new(:pointer)
      _v6 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v7 = GLib::Lib.g_bookmark_file_get_application_info(self, _v1, _v2, _v3, _v4, _v5, _v6)
      GirFFI::ArgHelper.check_error(_v6)
      _v8 = GirFFI::AllocationHelper.free_after(_v3.get_pointer(0), &:to_utf8)
      _v9 = _v4.get_uint32(0)
      _v10 = GLib::DateTime.wrap_copy(_v5.get_pointer(0))
      return [_v7, _v8, _v9, _v10]
    end
    def get_applications(uri)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = FFI::MemoryPointer.new(:uint64)
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_bookmark_file_get_applications(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      _v5 = _v2.get_uint64(0)
      _v6 = GirFFI::SizedArray.wrap(:utf8, _v5, _v4)
      return _v6
    end
    def get_description(uri)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_bookmark_file_get_description(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
      return _v4
    end
    def get_groups(uri)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = FFI::MemoryPointer.new(:uint64)
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_bookmark_file_get_groups(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      _v5 = _v2.get_uint64(0)
      _v6 = GirFFI::SizedArray.wrap(:utf8, _v5, _v4)
      return _v6
    end
    def get_icon(uri)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = FFI::MemoryPointer.new(:pointer)
      _v3 = FFI::MemoryPointer.new(:pointer)
      _v4 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v5 = GLib::Lib.g_bookmark_file_get_icon(self, _v1, _v2, _v3, _v4)
      GirFFI::ArgHelper.check_error(_v4)
      _v6 = GirFFI::AllocationHelper.free_after(_v2.get_pointer(0), &:to_utf8)
      _v7 = GirFFI::AllocationHelper.free_after(_v3.get_pointer(0), &:to_utf8)
      return [_v5, _v6, _v7]
    end
    def get_is_private(uri)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_bookmark_file_get_is_private(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      return _v3
    end
    def get_mime_type(uri)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_bookmark_file_get_mime_type(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
      return _v4
    end
    def get_modified(uri)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_bookmark_file_get_modified(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      return _v3
    end
    def get_modified_date_time(uri)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_bookmark_file_get_modified_date_time(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      _v4 = GLib::DateTime.wrap_copy(_v3)
      return _v4
    end
    def get_size
      _v1 = GLib::Lib.g_bookmark_file_get_size(self)
      return _v1
    end
    def get_title(uri = nil)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_bookmark_file_get_title(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
      return _v4
    end
    def get_uris
      _v1 = FFI::MemoryPointer.new(:uint64)
      _v2 = GLib::Lib.g_bookmark_file_get_uris(self, _v1)
      _v3 = _v1.get_uint64(0)
      _v4 = GirFFI::SizedArray.wrap(:utf8, _v3, _v2)
      return _v4
    end
    def get_visited(uri)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_bookmark_file_get_visited(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      return _v3
    end
    def get_visited_date_time(uri)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_bookmark_file_get_visited_date_time(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      _v4 = GLib::DateTime.wrap_copy(_v3)
      return _v4
    end
    def has_application(uri, name)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = GirFFI::InPointer.from_utf8(name)
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_bookmark_file_has_application(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      return _v4
    end
    def has_group(uri, group)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = GirFFI::InPointer.from_utf8(group)
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_bookmark_file_has_group(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      return _v4
    end
    def has_item(uri)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = GLib::Lib.g_bookmark_file_has_item(self, _v1)
      return _v2
    end
    def load_from_data(data)
      length = data.nil? ? (0) : (data.length)
      _v1 = length
      _v2 = GirFFI::SizedArray.from(:guint8, -1, data)
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_bookmark_file_load_from_data(self, _v2, _v1, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      return _v4
    end
    def load_from_data_dirs(file)
      _v1 = file
      _v2 = FFI::MemoryPointer.new(:pointer)
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_bookmark_file_load_from_data_dirs(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      _v5 = GirFFI::AllocationHelper.free_after(_v2.get_pointer(0), &:to_utf8)
      return [_v4, _v5]
    end
    def load_from_file(filename)
      _v1 = filename
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_bookmark_file_load_from_file(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      return _v3
    end
    def move_item(old_uri, new_uri = nil)
      _v1 = GirFFI::InPointer.from_utf8(old_uri)
      _v2 = GirFFI::InPointer.from_utf8(new_uri)
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_bookmark_file_move_item(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      return _v4
    end
    def remove_application(uri, name)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = GirFFI::InPointer.from_utf8(name)
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_bookmark_file_remove_application(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      return _v4
    end
    def remove_group(uri, group)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = GirFFI::InPointer.from_utf8(group)
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_bookmark_file_remove_group(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      return _v4
    end
    def remove_item(uri)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_bookmark_file_remove_item(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      return _v3
    end
    def set_added(uri, added)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = added
      GLib::Lib.g_bookmark_file_set_added(self, _v1, _v2)
    end
    def set_added_date_time(uri, added)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = GLib::DateTime.from(added)
      GLib::Lib.g_bookmark_file_set_added_date_time(self, _v1, _v2)
    end
    def set_app_info(uri, name, exec, count, stamp)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = GirFFI::InPointer.from_utf8(name)
      _v3 = GirFFI::InPointer.from_utf8(exec)
      _v4 = count
      _v5 = stamp
      _v6 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v7 = GLib::Lib.g_bookmark_file_set_app_info(self, _v1, _v2, _v3, _v4, _v5, _v6)
      GirFFI::ArgHelper.check_error(_v6)
      return _v7
    end
    def set_application_info(uri, name, exec, count, stamp = nil)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = GirFFI::InPointer.from_utf8(name)
      _v3 = GirFFI::InPointer.from_utf8(exec)
      _v4 = count
      _v5 = GLib::DateTime.from(stamp)
      _v6 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v7 = GLib::Lib.g_bookmark_file_set_application_info(self, _v1, _v2, _v3, _v4, _v5, _v6)
      GirFFI::ArgHelper.check_error(_v6)
      return _v7
    end
    def set_description(uri, description)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = GirFFI::InPointer.from_utf8(description)
      GLib::Lib.g_bookmark_file_set_description(self, _v1, _v2)
    end
    def set_groups(uri, groups = nil)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      length = groups.nil? ? (0) : (groups.length)
      _v2 = length
      _v3 = GirFFI::SizedArray.from(:utf8, -1, groups)
      GLib::Lib.g_bookmark_file_set_groups(self, _v1, _v3, _v2)
    end
    def set_icon(uri, href, mime_type)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = GirFFI::InPointer.from_utf8(href)
      _v3 = GirFFI::InPointer.from_utf8(mime_type)
      GLib::Lib.g_bookmark_file_set_icon(self, _v1, _v2, _v3)
    end
    def set_is_private(uri, is_private)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = is_private
      GLib::Lib.g_bookmark_file_set_is_private(self, _v1, _v2)
    end
    def set_mime_type(uri, mime_type)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = GirFFI::InPointer.from_utf8(mime_type)
      GLib::Lib.g_bookmark_file_set_mime_type(self, _v1, _v2)
    end
    def set_modified(uri, modified)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = modified
      GLib::Lib.g_bookmark_file_set_modified(self, _v1, _v2)
    end
    def set_modified_date_time(uri, modified)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = GLib::DateTime.from(modified)
      GLib::Lib.g_bookmark_file_set_modified_date_time(self, _v1, _v2)
    end
    def set_title(uri, title)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = GirFFI::InPointer.from_utf8(title)
      GLib::Lib.g_bookmark_file_set_title(self, _v1, _v2)
    end
    def set_visited(uri, visited)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = visited
      GLib::Lib.g_bookmark_file_set_visited(self, _v1, _v2)
    end
    def set_visited_date_time(uri, visited)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = GLib::DateTime.from(visited)
      GLib::Lib.g_bookmark_file_set_visited_date_time(self, _v1, _v2)
    end
    def to_data
      _v1 = FFI::MemoryPointer.new(:uint64)
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_bookmark_file_to_data(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      _v4 = _v1.get_uint64(0)
      _v5 = GirFFI::SizedArray.wrap(:guint8, _v4, _v3)
      return _v5
    end
    def to_file(filename)
      _v1 = filename
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_bookmark_file_to_file(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      return _v3
    end
    alias_method 'added', 'get_added'
    alias_method 'added_date_time', 'get_added_date_time'
    alias_method 'app_info', 'get_app_info'
    alias_method 'application_info', 'get_application_info'
    alias_method 'applications', 'get_applications'
    alias_method 'description', 'get_description'
    alias_method 'groups', 'get_groups'
    alias_method 'icon', 'get_icon'
    alias_method 'is_private', 'get_is_private'
    alias_method 'mime_type', 'get_mime_type'
    alias_method 'modified', 'get_modified'
    alias_method 'modified_date_time', 'get_modified_date_time'
    alias_method 'size', 'get_size'
    alias_method 'title', 'get_title'
    alias_method 'uris', 'get_uris'
    alias_method 'visited', 'get_visited'
    alias_method 'visited_date_time', 'get_visited_date_time'
  end
  # XXX: Don't know how to print enum
  class GLib::ByteArray < GirFFI::BoxedBase
    def self.append(array, data, len)
      _v1 = array
      _v2 = data
      _v3 = len
      _v4 = GLib::Lib.g_byte_array_append(_v1, _v2, _v3)
      _v5 = GLib::ByteArray.wrap(_v4)
      return _v5
    end
    def self.free(array, free_segment)
      _v1 = array
      _v2 = free_segment
      _v3 = GLib::Lib.g_byte_array_free(_v1, _v2)
      return _v3
    end
    def self.free_to_bytes(array)
      _v1 = array
      _v2 = GLib::Lib.g_byte_array_free_to_bytes(_v1)
      _v3 = GLib::Bytes.wrap_own(_v2)
      return _v3
    end
    def self.from(data)
      case data
      when self then
        data
      else
        new.append(data)
      end
    end
    def self.new
      _v1 = GLib::Lib.g_byte_array_new
      _v2 = GLib::ByteArray.wrap(_v1)
      return _v2
    end
    def self.new_take(data)
      len = data.nil? ? (0) : (data.length)
      _v1 = len
      _v2 = GirFFI::SizedArray.copy_from(:guint8, -1, data)
      _v3 = GLib::Lib.g_byte_array_new_take(_v2, _v1)
      _v4 = GLib::ByteArray.wrap(_v3)
      return _v4
    end
    def self.prepend(array, data, len)
      _v1 = array
      _v2 = data
      _v3 = len
      _v4 = GLib::Lib.g_byte_array_prepend(_v1, _v2, _v3)
      _v5 = GLib::ByteArray.wrap(_v4)
      return _v5
    end
    def self.ref(array)
      _v1 = array
      _v2 = GLib::Lib.g_byte_array_ref(_v1)
      _v3 = GLib::ByteArray.wrap(_v2)
      return _v3
    end
    def self.remove_index(array, index_)
      _v1 = array
      _v2 = index_
      _v3 = GLib::Lib.g_byte_array_remove_index(_v1, _v2)
      _v4 = GLib::ByteArray.wrap(_v3)
      return _v4
    end
    def self.remove_index_fast(array, index_)
      _v1 = array
      _v2 = index_
      _v3 = GLib::Lib.g_byte_array_remove_index_fast(_v1, _v2)
      _v4 = GLib::ByteArray.wrap(_v3)
      return _v4
    end
    def self.remove_range(array, index_, length)
      _v1 = array
      _v2 = index_
      _v3 = length
      _v4 = GLib::Lib.g_byte_array_remove_range(_v1, _v2, _v3)
      _v5 = GLib::ByteArray.wrap(_v4)
      return _v5
    end
    def self.set_size(array, length)
      _v1 = array
      _v2 = length
      _v3 = GLib::Lib.g_byte_array_set_size(_v1, _v2)
      _v4 = GLib::ByteArray.wrap(_v3)
      return _v4
    end
    def self.sized_new(reserved_size)
      _v1 = reserved_size
      _v2 = GLib::Lib.g_byte_array_sized_new(_v1)
      _v3 = GLib::ByteArray.wrap(_v2)
      return _v3
    end
    def self.sort(array, &compare_func)
      _v1 = array
      _v2 = GLib::CompareFunc.from(compare_func)
      GLib::Lib.g_byte_array_sort(_v1, _v2)
    end
    def self.sort_with_data(array, &compare_func)
      _v1 = array
      _v2 = GLib::CompareDataFunc.from(compare_func)
      _v3 = GirFFI::ArgHelper.store(_v2)
      GLib::Lib.g_byte_array_sort_with_data(_v1, _v2, _v3)
    end
    def self.steal(array)
      _v1 = array
      _v2 = FFI::MemoryPointer.new(:uint64)
      _v3 = GLib::Lib.g_byte_array_steal(_v1, _v2)
      _v4 = _v2.get_uint64(0)
      return [_v3, _v4]
    end
    def self.unref(array)
      _v1 = array
      GLib::Lib.g_byte_array_unref(_v1)
    end
    def append(data)
      bytes = GirFFI::InPointer.from_utf8(data)
      len = data.bytesize
      Lib.g_byte_array_append(to_ptr, bytes, len)
      self
    end
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
    def len
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(8)
      _v2
    end
    def len=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(8, _v2)
    end
    def to_string
      data.read_string(len)
    end
  end
  class GLib::Bytes < GirFFI::BoxedBase
    def self.from(obj)
      case obj
      when self then
        obj
      when FFI::Pointer then
        wrap(obj)
      else
        new(obj)
      end
    end
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def self.new_take(*args, &block)
      raise(NoMethodError) unless (self == GLib::Bytes)
      obj = allocate
      obj.__send__(:initialize_take, *args, &block)
      obj
    end
    def compare(bytes2)
      _v1 = GLib::Bytes.from(bytes2)
      _v2 = GLib::Lib.g_bytes_compare(self, _v1)
      return _v2
    end
    def each(&)
      data.each(&)
    end
    def equal(bytes2)
      _v1 = GLib::Bytes.from(bytes2)
      _v2 = GLib::Lib.g_bytes_equal(self, _v1)
      return _v2
    end
    def get_data
      _v1 = FFI::MemoryPointer.new(:uint64)
      _v2 = GLib::Lib.g_bytes_get_data(self, _v1)
      _v3 = _v1.get_uint64(0)
      _v4 = GirFFI::SizedArray.wrap(:guint8, _v3, _v2)
      return _v4
    end
    def get_region(element_size, offset, n_elements)
      _v1 = element_size
      _v2 = offset
      _v3 = n_elements
      _v4 = GLib::Lib.g_bytes_get_region(self, _v1, _v2, _v3)
      return _v4
    end
    def get_size
      _v1 = GLib::Lib.g_bytes_get_size(self)
      return _v1
    end
    def hash
      _v1 = GLib::Lib.g_bytes_hash(self)
      return _v1
    end
    def initialize_take(data = nil)
      size = data.nil? ? (0) : (data.length)
      _v1 = size
      _v2 = GirFFI::SizedArray.copy_from(:guint8, -1, data)
      _v3 = GLib::Lib.g_bytes_new_take(_v2, _v1)
      store_pointer(_v3)
      @struct.owned = true
    end
    def new_from_bytes(offset, length)
      _v1 = offset
      _v2 = length
      _v3 = GLib::Lib.g_bytes_new_from_bytes(self, _v1, _v2)
      _v4 = GLib::Bytes.wrap_own(_v3)
      return _v4
    end
    def ref
      _v1 = GLib::Lib.g_bytes_ref(self)
      _v2 = GLib::Bytes.wrap_own(_v1)
      return _v2
    end
    def unref
      GLib::Lib.g_bytes_unref(self)
    end
    def unref_to_array
      _v1 = GLib::Lib.g_bytes_unref_to_array(self)
      _v2 = GLib::ByteArray.wrap(_v1)
      return _v2
    end
    def unref_to_data
      _v1 = FFI::MemoryPointer.new(:uint64)
      _v2 = GLib::Lib.g_bytes_unref_to_data(self, _v1)
      _v3 = _v1.get_uint64(0)
      _v4 = GirFFI::SizedArray.wrap(:guint8, _v3, _v2)
      return _v4
    end
    alias_method 'region', 'get_region'
    alias_method 'size', 'get_size'
  end
  CSET_A_2_Z = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  CSET_DIGITS = "0123456789"
  CSET_a_2_z = "abcdefghijklmnopqrstuvwxyz"
  C_STD_VERSION = 199000
  class GLib::Cache < GirFFI::StructBase
  
    def destroy
      GLib::Lib.g_cache_destroy(self)
    end
    def insert(key = nil)
      _v1 = key
      _v2 = GLib::Lib.g_cache_insert(self, _v1)
      return _v2
    end
    def key_foreach(&func)
      _v1 = GLib::HFunc.from(func)
      _v2 = GirFFI::ArgHelper.store(_v1)
      GLib::Lib.g_cache_key_foreach(self, _v1, _v2)
    end
    def remove(value = nil)
      _v1 = value
      GLib::Lib.g_cache_remove(self, _v1)
    end
    def value_foreach(&func)
      _v1 = GLib::HFunc.from(func)
      _v2 = GirFFI::ArgHelper.store(_v1)
      GLib::Lib.g_cache_value_foreach(self, _v1, _v2)
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  class GLib::Checksum < GirFFI::BoxedBase
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def self.type_get_length(checksum_type)
      _v1 = checksum_type
      _v2 = GLib::Lib.g_checksum_type_get_length(_v1)
      return _v2
    end
    def copy
      _v1 = GLib::Lib.g_checksum_copy(self)
      _v2 = GLib::Checksum.wrap_own(_v1)
      return _v2
    end
    def free
      GLib::Lib.g_checksum_free(self)
    end
    def get_string
      _v1 = GLib::Lib.g_checksum_get_string(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def reset
      GLib::Lib.g_checksum_reset(self)
    end
    def update(data)
      length = data.nil? ? (0) : (data.length)
      _v1 = length
      _v2 = GirFFI::SizedArray.from(:guint8, -1, data)
      GLib::Lib.g_checksum_update(self, _v2, _v1)
    end
    alias_method 'string', 'get_string'
  end
  # XXX: Don't know how to print enum
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  class GLib::Completion < GirFFI::StructBase
  
    def cache
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(24)
      _v3 = GLib::List.wrap([:pointer, :void], _v2)
      _v3
    end
    def cache=(value)
      _v1 = @struct.to_ptr
      _v2 = GLib::List.from([:pointer, :void], value)
      _v1.put_pointer(24, _v2)
    end
    def clear_items
      GLib::Lib.g_completion_clear_items(self)
    end
    def complete_utf8(prefix, new_prefix)
      _v1 = GirFFI::InPointer.from_utf8(prefix)
      _v2 = GirFFI::InPointer.from_utf8(new_prefix)
      _v3 = GLib::Lib.g_completion_complete_utf8(self, _v1, _v2)
      _v4 = GLib::List.wrap(:utf8, _v3)
      return _v4
    end
    def free
      GLib::Lib.g_completion_free(self)
    end
    def func
      _v1 = @struct.to_ptr
      _v2 = GLib::CompletionFunc.get_value_from_pointer(_v1, 8)
      _v2
    end
    def func=(value)
      _v1 = @struct.to_ptr
      _v2 = GLib::CompletionFunc.from(value)
      GLib::CompletionFunc.copy_value_to_pointer(_v2, _v1, 8)
    end
    def items
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(0)
      _v3 = GLib::List.wrap([:pointer, :void], _v2)
      _v3
    end
    def items=(value)
      _v1 = @struct.to_ptr
      _v2 = GLib::List.from([:pointer, :void], value)
      _v1.put_pointer(0, _v2)
    end
    def prefix
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(16)
      _v3 = _v2.to_utf8
      _v3
    end
    def prefix=(value)
      _v1 = @struct.to_ptr
      _v2 = GirFFI::InPointer.from_utf8(value)
      _v1.put_pointer(16, _v2)
    end
    def strncmp_func
      _v1 = @struct.to_ptr
      _v2 = GLib::CompletionStrncmpFunc.get_value_from_pointer(_v1, 32)
      _v2
    end
    def strncmp_func=(value)
      _v1 = @struct.to_ptr
      _v2 = GLib::CompletionStrncmpFunc.from(value)
      GLib::CompletionStrncmpFunc.copy_value_to_pointer(_v2, _v1, 32)
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  class GLib::Cond < GirFFI::StructBase
  
    def broadcast
      GLib::Lib.g_cond_broadcast(self)
    end
    def clear
      GLib::Lib.g_cond_clear(self)
    end
    def i
      _v1 = @struct.to_ptr
      _v2 = GirFFI::SizedArray.get_value_from_pointer(_v1, 8)
      _v3 = GirFFI::SizedArray.wrap(:guint32, 2, _v2)
      _v3
    end
    def init
      GLib::Lib.g_cond_init(self)
    end
    def p
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(0)
      _v2
    end
    def signal
      GLib::Lib.g_cond_signal(self)
    end
    def wait(mutex)
      _v1 = mutex
      GLib::Lib.g_cond_wait(self, _v1)
    end
    def wait_until(mutex, end_time)
      _v1 = mutex
      _v2 = end_time
      _v3 = GLib::Lib.g_cond_wait_until(self, _v1, _v2)
      return _v3
    end
  end
  # XXX: Don't know how to print enum
  # XXX: Don't know how to print callback
  DATALIST_FLAGS_MASK = 3
  DATE_BAD_DAY = 0
  DATE_BAD_JULIAN = 0
  DATE_BAD_YEAR = 0
  DIR_SEPARATOR = 47
  DIR_SEPARATOR_S = "/"
  class GLib::Data < GirFFI::StructBase
  
  
  end
  # XXX: Don't know how to print callback
  class GLib::Date < GirFFI::BoxedBase
    def self.get_days_in_month(month, year)
      _v1 = month
      _v2 = year
      _v3 = GLib::Lib.g_date_get_days_in_month(_v1, _v2)
      return _v3
    end
    def self.get_monday_weeks_in_year(year)
      _v1 = year
      _v2 = GLib::Lib.g_date_get_monday_weeks_in_year(_v1)
      return _v2
    end
    def self.get_sunday_weeks_in_year(year)
      _v1 = year
      _v2 = GLib::Lib.g_date_get_sunday_weeks_in_year(_v1)
      return _v2
    end
    def self.is_leap_year(year)
      _v1 = year
      _v2 = GLib::Lib.g_date_is_leap_year(_v1)
      return _v2
    end
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def self.new_dmy(*args, &block)
      raise(NoMethodError) unless (self == GLib::Date)
      obj = allocate
      obj.__send__(:initialize_dmy, *args, &block)
      obj
    end
    def self.new_julian(*args, &block)
      raise(NoMethodError) unless (self == GLib::Date)
      obj = allocate
      obj.__send__(:initialize_julian, *args, &block)
      obj
    end
    def self.strftime(s, slen, format, date)
      _v1 = GirFFI::InPointer.from_utf8(s)
      _v2 = slen
      _v3 = GirFFI::InPointer.from_utf8(format)
      _v4 = GLib::Date.from(date)
      _v5 = GLib::Lib.g_date_strftime(_v1, _v2, _v3, _v4)
      return _v5
    end
    def self.valid_day(day)
      _v1 = day
      _v2 = GLib::Lib.g_date_valid_day(_v1)
      return _v2
    end
    def self.valid_dmy(day, month, year)
      _v1 = day
      _v2 = month
      _v3 = year
      _v4 = GLib::Lib.g_date_valid_dmy(_v1, _v2, _v3)
      return _v4
    end
    def self.valid_julian(julian_date)
      _v1 = julian_date
      _v2 = GLib::Lib.g_date_valid_julian(_v1)
      return _v2
    end
    def self.valid_month(month)
      _v1 = month
      _v2 = GLib::Lib.g_date_valid_month(_v1)
      return _v2
    end
    def self.valid_weekday(weekday)
      _v1 = weekday
      _v2 = GLib::Lib.g_date_valid_weekday(_v1)
      return _v2
    end
    def self.valid_year(year)
      _v1 = year
      _v2 = GLib::Lib.g_date_valid_year(_v1)
      return _v2
    end
    def add_days(n_days)
      _v1 = n_days
      GLib::Lib.g_date_add_days(self, _v1)
    end
    def add_months(n_months)
      _v1 = n_months
      GLib::Lib.g_date_add_months(self, _v1)
    end
    def add_years(n_years)
      _v1 = n_years
      GLib::Lib.g_date_add_years(self, _v1)
    end
    def clamp(min_date, max_date)
      _v1 = GLib::Date.from(min_date)
      _v2 = GLib::Date.from(max_date)
      GLib::Lib.g_date_clamp(self, _v1, _v2)
    end
    def clear(n_dates)
      _v1 = n_dates
      GLib::Lib.g_date_clear(self, _v1)
    end
    def compare(rhs)
      _v1 = GLib::Date.from(rhs)
      _v2 = GLib::Lib.g_date_compare(self, _v1)
      return _v2
    end
    def copy
      _v1 = GLib::Lib.g_date_copy(self)
      _v2 = GLib::Date.wrap_own(_v1)
      return _v2
    end
    def day
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(12)
      _v2
    end
    def day=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(12, _v2)
    end
    def days_between(date2)
      _v1 = GLib::Date.from(date2)
      _v2 = GLib::Lib.g_date_days_between(self, _v1)
      return _v2
    end
    def dmy
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(8)
      _v2
    end
    def dmy=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(8, _v2)
    end
    def free
      GLib::Lib.g_date_free(self)
    end
    def get_day
      _v1 = GLib::Lib.g_date_get_day(self)
      return _v1
    end
    def get_day_of_year
      _v1 = GLib::Lib.g_date_get_day_of_year(self)
      return _v1
    end
    def get_iso8601_week_of_year
      _v1 = GLib::Lib.g_date_get_iso8601_week_of_year(self)
      return _v1
    end
    def get_julian
      _v1 = GLib::Lib.g_date_get_julian(self)
      return _v1
    end
    def get_monday_week_of_year
      _v1 = GLib::Lib.g_date_get_monday_week_of_year(self)
      return _v1
    end
    def get_month
      _v1 = GLib::Lib.g_date_get_month(self)
      return _v1
    end
    def get_sunday_week_of_year
      _v1 = GLib::Lib.g_date_get_sunday_week_of_year(self)
      return _v1
    end
    def get_weekday
      _v1 = GLib::Lib.g_date_get_weekday(self)
      return _v1
    end
    def get_year
      _v1 = GLib::Lib.g_date_get_year(self)
      return _v1
    end
    def initialize_dmy(day, month, year)
      _v1 = day
      _v2 = month
      _v3 = year
      _v4 = GLib::Lib.g_date_new_dmy(_v1, _v2, _v3)
      store_pointer(_v4)
      @struct.owned = true
    end
    def initialize_julian(julian_day)
      _v1 = julian_day
      _v2 = GLib::Lib.g_date_new_julian(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def is_first_of_month
      _v1 = GLib::Lib.g_date_is_first_of_month(self)
      return _v1
    end
    def is_last_of_month
      _v1 = GLib::Lib.g_date_is_last_of_month(self)
      return _v1
    end
    def julian
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(4)
      _v2
    end
    def julian=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(4, _v2)
    end
    def julian_days
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(0)
      _v2
    end
    def julian_days=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(0, _v2)
    end
    def month
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(16)
      _v2
    end
    def month=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(16, _v2)
    end
    def order(date2)
      _v1 = GLib::Date.from(date2)
      GLib::Lib.g_date_order(self, _v1)
    end
    def set_day(day)
      _v1 = day
      GLib::Lib.g_date_set_day(self, _v1)
    end
    def set_dmy(day, month, y)
      _v1 = day
      _v2 = month
      _v3 = y
      GLib::Lib.g_date_set_dmy(self, _v1, _v2, _v3)
    end
    def set_julian(julian_date)
      _v1 = julian_date
      GLib::Lib.g_date_set_julian(self, _v1)
    end
    def set_month(month)
      _v1 = month
      GLib::Lib.g_date_set_month(self, _v1)
    end
    def set_parse(str)
      _v1 = GirFFI::InPointer.from_utf8(str)
      GLib::Lib.g_date_set_parse(self, _v1)
    end
    def set_time(time_)
      _v1 = time_
      GLib::Lib.g_date_set_time(self, _v1)
    end
    def set_time_t(timet)
      _v1 = timet
      GLib::Lib.g_date_set_time_t(self, _v1)
    end
    def set_time_val(timeval)
      _v1 = GLib::TimeVal.from(timeval)
      GLib::Lib.g_date_set_time_val(self, _v1)
    end
    def set_year(year)
      _v1 = year
      GLib::Lib.g_date_set_year(self, _v1)
    end
    def subtract_days(n_days)
      _v1 = n_days
      GLib::Lib.g_date_subtract_days(self, _v1)
    end
    def subtract_months(n_months)
      _v1 = n_months
      GLib::Lib.g_date_subtract_months(self, _v1)
    end
    def subtract_years(n_years)
      _v1 = n_years
      GLib::Lib.g_date_subtract_years(self, _v1)
    end
    def to_struct_tm(tm)
      _v1 = tm
      GLib::Lib.g_date_to_struct_tm(self, _v1)
    end
    def valid
      _v1 = GLib::Lib.g_date_valid(self)
      return _v1
    end
    def year
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(20)
      _v2
    end
    def year=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(20, _v2)
    end
    alias_method 'day_of_year', 'get_day_of_year'
    alias_method 'iso8601_week_of_year', 'get_iso8601_week_of_year'
    alias_method 'monday_week_of_year', 'get_monday_week_of_year'
    alias_method 'parse=', 'set_parse'
    alias_method 'sunday_week_of_year', 'get_sunday_week_of_year'
    alias_method 'time=', 'set_time'
    alias_method 'time_t=', 'set_time_t'
    alias_method 'time_val=', 'set_time_val'
    alias_method 'weekday', 'get_weekday'
  end
  # XXX: Don't know how to print enum
  # XXX: Don't know how to print enum
  class GLib::DateTime < GirFFI::BoxedBase
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def self.new_from_iso8601(*args, &block)
      raise(NoMethodError) unless (self == GLib::DateTime)
      obj = allocate
      obj.__send__(:initialize_from_iso8601, *args, &block)
      obj
    end
    def self.new_from_timeval_local(*args, &block)
      raise(NoMethodError) unless (self == GLib::DateTime)
      obj = allocate
      obj.__send__(:initialize_from_timeval_local, *args, &block)
      obj
    end
    def self.new_from_timeval_utc(*args, &block)
      raise(NoMethodError) unless (self == GLib::DateTime)
      obj = allocate
      obj.__send__(:initialize_from_timeval_utc, *args, &block)
      obj
    end
    def self.new_from_unix_local(*args, &block)
      raise(NoMethodError) unless (self == GLib::DateTime)
      obj = allocate
      obj.__send__(:initialize_from_unix_local, *args, &block)
      obj
    end
    def self.new_from_unix_local_usec(*args, &block)
      raise(NoMethodError) unless (self == GLib::DateTime)
      obj = allocate
      obj.__send__(:initialize_from_unix_local_usec, *args, &block)
      obj
    end
    def self.new_from_unix_utc(*args, &block)
      raise(NoMethodError) unless (self == GLib::DateTime)
      obj = allocate
      obj.__send__(:initialize_from_unix_utc, *args, &block)
      obj
    end
    def self.new_from_unix_utc_usec(*args, &block)
      raise(NoMethodError) unless (self == GLib::DateTime)
      obj = allocate
      obj.__send__(:initialize_from_unix_utc_usec, *args, &block)
      obj
    end
    def self.new_local(*args, &block)
      raise(NoMethodError) unless (self == GLib::DateTime)
      obj = allocate
      obj.__send__(:initialize_local, *args, &block)
      obj
    end
    def self.new_now(*args, &block)
      raise(NoMethodError) unless (self == GLib::DateTime)
      obj = allocate
      obj.__send__(:initialize_now, *args, &block)
      obj
    end
    def self.new_now_local(*args, &block)
      raise(NoMethodError) unless (self == GLib::DateTime)
      obj = allocate
      obj.__send__(:initialize_now_local, *args, &block)
      obj
    end
    def self.new_now_utc(*args, &block)
      raise(NoMethodError) unless (self == GLib::DateTime)
      obj = allocate
      obj.__send__(:initialize_now_utc, *args, &block)
      obj
    end
    def self.new_utc(*args, &block)
      raise(NoMethodError) unless (self == GLib::DateTime)
      obj = allocate
      obj.__send__(:initialize_utc, *args, &block)
      obj
    end
    def add(timespan)
      _v1 = timespan
      _v2 = GLib::Lib.g_date_time_add(self, _v1)
      _v3 = GLib::DateTime.wrap_own(_v2)
      return _v3
    end
    def add_days(days)
      _v1 = days
      _v2 = GLib::Lib.g_date_time_add_days(self, _v1)
      _v3 = GLib::DateTime.wrap_own(_v2)
      return _v3
    end
    def add_full(years, months, days, hours, minutes, seconds)
      _v1 = years
      _v2 = months
      _v3 = days
      _v4 = hours
      _v5 = minutes
      _v6 = seconds
      _v7 = GLib::Lib.g_date_time_add_full(self, _v1, _v2, _v3, _v4, _v5, _v6)
      _v8 = GLib::DateTime.wrap_own(_v7)
      return _v8
    end
    def add_hours(hours)
      _v1 = hours
      _v2 = GLib::Lib.g_date_time_add_hours(self, _v1)
      _v3 = GLib::DateTime.wrap_own(_v2)
      return _v3
    end
    def add_minutes(minutes)
      _v1 = minutes
      _v2 = GLib::Lib.g_date_time_add_minutes(self, _v1)
      _v3 = GLib::DateTime.wrap_own(_v2)
      return _v3
    end
    def add_months(months)
      _v1 = months
      _v2 = GLib::Lib.g_date_time_add_months(self, _v1)
      _v3 = GLib::DateTime.wrap_own(_v2)
      return _v3
    end
    def add_seconds(seconds)
      _v1 = seconds
      _v2 = GLib::Lib.g_date_time_add_seconds(self, _v1)
      _v3 = GLib::DateTime.wrap_own(_v2)
      return _v3
    end
    def add_weeks(weeks)
      _v1 = weeks
      _v2 = GLib::Lib.g_date_time_add_weeks(self, _v1)
      _v3 = GLib::DateTime.wrap_own(_v2)
      return _v3
    end
    def add_years(years)
      _v1 = years
      _v2 = GLib::Lib.g_date_time_add_years(self, _v1)
      _v3 = GLib::DateTime.wrap_own(_v2)
      return _v3
    end
    def compare(dt2)
      _v1 = GLib::DateTime.from(dt2)
      _v2 = GLib::Lib.g_date_time_compare(self, _v1)
      return _v2
    end
    def difference(begin_)
      _v1 = GLib::DateTime.from(begin_)
      _v2 = GLib::Lib.g_date_time_difference(self, _v1)
      return _v2
    end
    def equal(dt2)
      _v1 = GLib::DateTime.from(dt2)
      _v2 = GLib::Lib.g_date_time_equal(self, _v1)
      return _v2
    end
    def format(format)
      _v1 = GirFFI::InPointer.from_utf8(format)
      _v2 = GLib::Lib.g_date_time_format(self, _v1)
      _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
      return _v3
    end
    def format_iso8601
      _v1 = GLib::Lib.g_date_time_format_iso8601(self)
      _v2 = GirFFI::AllocationHelper.free_after(_v1, &:to_utf8)
      return _v2
    end
    def get_day_of_month
      _v1 = GLib::Lib.g_date_time_get_day_of_month(self)
      return _v1
    end
    def get_day_of_week
      _v1 = GLib::Lib.g_date_time_get_day_of_week(self)
      return _v1
    end
    def get_day_of_year
      _v1 = GLib::Lib.g_date_time_get_day_of_year(self)
      return _v1
    end
    def get_hour
      _v1 = GLib::Lib.g_date_time_get_hour(self)
      return _v1
    end
    def get_microsecond
      _v1 = GLib::Lib.g_date_time_get_microsecond(self)
      return _v1
    end
    def get_minute
      _v1 = GLib::Lib.g_date_time_get_minute(self)
      return _v1
    end
    def get_month
      _v1 = GLib::Lib.g_date_time_get_month(self)
      return _v1
    end
    def get_second
      _v1 = GLib::Lib.g_date_time_get_second(self)
      return _v1
    end
    def get_seconds
      _v1 = GLib::Lib.g_date_time_get_seconds(self)
      return _v1
    end
    def get_timezone
      _v1 = GLib::Lib.g_date_time_get_timezone(self)
      _v2 = GLib::TimeZone.wrap_copy(_v1)
      return _v2
    end
    def get_timezone_abbreviation
      _v1 = GLib::Lib.g_date_time_get_timezone_abbreviation(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def get_utc_offset
      _v1 = GLib::Lib.g_date_time_get_utc_offset(self)
      return _v1
    end
    def get_week_numbering_year
      _v1 = GLib::Lib.g_date_time_get_week_numbering_year(self)
      return _v1
    end
    def get_week_of_year
      _v1 = GLib::Lib.g_date_time_get_week_of_year(self)
      return _v1
    end
    def get_year
      _v1 = GLib::Lib.g_date_time_get_year(self)
      return _v1
    end
    def get_ymd
      _v1 = FFI::MemoryPointer.new(:int32)
      _v2 = FFI::MemoryPointer.new(:int32)
      _v3 = FFI::MemoryPointer.new(:int32)
      GLib::Lib.g_date_time_get_ymd(self, _v1, _v2, _v3)
      _v4 = _v1.get_int32(0)
      _v5 = _v2.get_int32(0)
      _v6 = _v3.get_int32(0)
      return [_v4, _v5, _v6]
    end
    def hash
      _v1 = GLib::Lib.g_date_time_hash(self)
      return _v1
    end
    def initialize_from_iso8601(text, default_tz = nil)
      _v1 = GirFFI::InPointer.from_utf8(text)
      _v2 = GLib::TimeZone.from(default_tz)
      _v3 = GLib::Lib.g_date_time_new_from_iso8601(_v1, _v2)
      store_pointer(_v3)
      @struct.owned = true
    end
    def initialize_from_timeval_local(tv)
      _v1 = GLib::TimeVal.from(tv)
      _v2 = GLib::Lib.g_date_time_new_from_timeval_local(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_from_timeval_utc(tv)
      _v1 = GLib::TimeVal.from(tv)
      _v2 = GLib::Lib.g_date_time_new_from_timeval_utc(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_from_unix_local(t)
      _v1 = t
      _v2 = GLib::Lib.g_date_time_new_from_unix_local(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_from_unix_local_usec(usecs)
      _v1 = usecs
      _v2 = GLib::Lib.g_date_time_new_from_unix_local_usec(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_from_unix_utc(t)
      _v1 = t
      _v2 = GLib::Lib.g_date_time_new_from_unix_utc(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_from_unix_utc_usec(usecs)
      _v1 = usecs
      _v2 = GLib::Lib.g_date_time_new_from_unix_utc_usec(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_local(year, month, day, hour, minute, seconds)
      _v1 = year
      _v2 = month
      _v3 = day
      _v4 = hour
      _v5 = minute
      _v6 = seconds
      _v7 = GLib::Lib.g_date_time_new_local(_v1, _v2, _v3, _v4, _v5, _v6)
      store_pointer(_v7)
      @struct.owned = true
    end
    def initialize_now(tz)
      _v1 = GLib::TimeZone.from(tz)
      _v2 = GLib::Lib.g_date_time_new_now(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_now_local
      _v1 = GLib::Lib.g_date_time_new_now_local
      store_pointer(_v1)
      @struct.owned = true
    end
    def initialize_now_utc
      _v1 = GLib::Lib.g_date_time_new_now_utc
      store_pointer(_v1)
      @struct.owned = true
    end
    def initialize_utc(year, month, day, hour, minute, seconds)
      _v1 = year
      _v2 = month
      _v3 = day
      _v4 = hour
      _v5 = minute
      _v6 = seconds
      _v7 = GLib::Lib.g_date_time_new_utc(_v1, _v2, _v3, _v4, _v5, _v6)
      store_pointer(_v7)
      @struct.owned = true
    end
    def is_daylight_savings
      _v1 = GLib::Lib.g_date_time_is_daylight_savings(self)
      return _v1
    end
    def ref
      _v1 = GLib::Lib.g_date_time_ref(self)
      _v2 = GLib::DateTime.wrap_own(_v1)
      return _v2
    end
    def to_local
      _v1 = GLib::Lib.g_date_time_to_local(self)
      _v2 = GLib::DateTime.wrap_own(_v1)
      return _v2
    end
    def to_timeval(tv)
      _v1 = GLib::TimeVal.from(tv)
      _v2 = GLib::Lib.g_date_time_to_timeval(self, _v1)
      return _v2
    end
    def to_timezone(tz)
      _v1 = GLib::TimeZone.from(tz)
      _v2 = GLib::Lib.g_date_time_to_timezone(self, _v1)
      _v3 = GLib::DateTime.wrap_own(_v2)
      return _v3
    end
    def to_unix
      _v1 = GLib::Lib.g_date_time_to_unix(self)
      return _v1
    end
    def to_unix_usec
      _v1 = GLib::Lib.g_date_time_to_unix_usec(self)
      return _v1
    end
    def to_utc
      _v1 = GLib::Lib.g_date_time_to_utc(self)
      _v2 = GLib::DateTime.wrap_own(_v1)
      return _v2
    end
    def unref
      GLib::Lib.g_date_time_unref(self)
    end
    alias_method 'day_of_month', 'get_day_of_month'
    alias_method 'day_of_week', 'get_day_of_week'
    alias_method 'day_of_year', 'get_day_of_year'
    alias_method 'hour', 'get_hour'
    alias_method 'microsecond', 'get_microsecond'
    alias_method 'minute', 'get_minute'
    alias_method 'month', 'get_month'
    alias_method 'second', 'get_second'
    alias_method 'seconds', 'get_seconds'
    alias_method 'timezone', 'get_timezone'
    alias_method 'timezone_abbreviation', 'get_timezone_abbreviation'
    alias_method 'utc_offset', 'get_utc_offset'
    alias_method 'week_numbering_year', 'get_week_numbering_year'
    alias_method 'week_of_year', 'get_week_of_year'
    alias_method 'year', 'get_year'
    alias_method 'ymd', 'get_ymd'
  end
  # XXX: Don't know how to print enum
  class GLib::DebugKey < GirFFI::StructBase
  
    def key
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(0)
      _v3 = _v2.to_utf8
      _v3
    end
    def key=(value)
      _v1 = @struct.to_ptr
      _v2 = GirFFI::InPointer.from_utf8(value)
      _v1.put_pointer(0, _v2)
    end
    def value
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(8)
      _v2
    end
    def value=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(8, _v2)
    end
  end
  # XXX: Don't know how to print callback
  class GLib::Dir < GirFFI::BoxedBase
    def self.make_tmp(tmpl = nil)
      _v1 = tmpl
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_dir_make_tmp(_v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
      return _v4
    end
    def self.open(*args, &block)
      raise(NoMethodError) unless (self == GLib::Dir)
      obj = allocate
      obj.__send__(:open, *args, &block)
      obj
    end
    def close
      GLib::Lib.g_dir_close(self)
    end
    def open(path, flags)
      _v1 = GirFFI::InPointer.from_utf8(path)
      _v2 = flags
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_dir_open(_v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      store_pointer(_v4)
      @struct.owned = true
    end
    def read_name
      _v1 = GLib::Lib.g_dir_read_name(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def ref
      _v1 = GLib::Lib.g_dir_ref(self)
      _v2 = GLib::Dir.wrap_own(_v1)
      return _v2
    end
    def rewind
      GLib::Lib.g_dir_rewind(self)
    end
    def unref
      GLib::Lib.g_dir_unref(self)
    end
  end
  # XXX: Don't know how to print union
  # XXX: Don't know how to print callback
  E = 2.718282
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  class GLib::Error < GirFFI::BoxedBase
    def self.domain_register(error_type_name, error_type_private_size, error_type_init, error_type_copy, error_type_clear)
      _v1 = GirFFI::InPointer.from_utf8(error_type_name)
      _v2 = error_type_private_size
      _v3 = GLib::ErrorInitFunc.from(error_type_init)
      _v4 = GLib::ErrorCopyFunc.from(error_type_copy)
      _v5 = GLib::ErrorClearFunc.from(error_type_clear)
      _v6 = GLib::Lib.g_error_domain_register(_v1, _v2, _v3, _v4, _v5)
      return _v6
    end
    def self.domain_register_static(error_type_name, error_type_private_size, error_type_init, error_type_copy, error_type_clear)
      _v1 = GirFFI::InPointer.from_utf8(error_type_name)
      _v2 = error_type_private_size
      _v3 = GLib::ErrorInitFunc.from(error_type_init)
      _v4 = GLib::ErrorCopyFunc.from(error_type_copy)
      _v5 = GLib::ErrorClearFunc.from(error_type_clear)
      _v6 = GLib::Lib.g_error_domain_register_static(_v1, _v2, _v3, _v4, _v5)
      return _v6
    end
    def self.from(obj)
      from_exception(obj)
    end
    def self.from_exception(exception)
      new_literal(GIR_FFI_DOMAIN, 0, exception.message)
    end
    def self.new_literal(*args, &block)
      raise(NoMethodError) unless (self == GLib::Error)
      obj = allocate
      obj.__send__(:initialize_literal, *args, &block)
      obj
    end
    def code
      _v1 = @struct.to_ptr
      _v2 = _v1.get_int32(4)
      _v2
    end
    def code=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_int32(4, _v2)
    end
    def copy
      _v1 = GLib::Lib.g_error_copy(self)
      _v2 = GLib::Error.wrap(_v1)
      return _v2
    end
    def domain
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(0)
      _v2
    end
    def domain=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(0, _v2)
    end
    def free
      GLib::Lib.g_error_free(self)
    end
    def initialize_literal(domain, code, message)
      _v1 = domain
      _v2 = code
      _v3 = GirFFI::InPointer.from_utf8(message)
      _v4 = GLib::Lib.g_error_new_literal(_v1, _v2, _v3)
      store_pointer(_v4)
    end
    def matches(domain, code)
      _v1 = domain
      _v2 = code
      _v3 = GLib::Lib.g_error_matches(self, _v1, _v2)
      return _v3
    end
    def message
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(8)
      _v3 = _v2.to_utf8
      _v3
    end
    def message=(value)
      _v1 = @struct.to_ptr
      _v2 = GirFFI::InPointer.from_utf8(value)
      _v1.put_pointer(8, _v2)
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print enum
  # XXX: Don't know how to print enum
  # XXX: Don't know how to print flags
  # XXX: Don't know how to print flags
  # XXX: Don't know how to print union
  # XXX: Don't know how to print flags
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  GINT16_FORMAT = "hi"
  GINT16_MODIFIER = "h"
  GINT32_FORMAT = "i"
  GINT32_MODIFIER = ""
  GINT64_FORMAT = "li"
  GINT64_MODIFIER = "l"
  GINTPTR_FORMAT = "li"
  GINTPTR_MODIFIER = "l"
  GNUC_FUNCTION = ""
  GNUC_PRETTY_FUNCTION = ""
  GSIZE_FORMAT = "lu"
  GSIZE_MODIFIER = "l"
  GSSIZE_FORMAT = "li"
  GSSIZE_MODIFIER = "l"
  GUINT16_FORMAT = "hu"
  GUINT32_FORMAT = "u"
  GUINT64_FORMAT = "lu"
  GUINTPTR_FORMAT = "lu"
  HAVE_GINT64 = 1
  HAVE_GNUC_VARARGS = 1
  HAVE_GNUC_VISIBILITY = 1
  HAVE_GROWING_STACK = 0
  HAVE_ISO_VARARGS = 1
  # XXX: Don't know how to print callback
  HOOK_FLAG_USER_SHIFT = 4
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  class GLib::HashTable < GirFFI::BoxedBase
    def self.add(hash_table, key = nil)
      _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
      _v2 = key
      _v3 = GLib::Lib.g_hash_table_add(_v1, _v2)
      return _v3
    end
    def self.contains(hash_table, key = nil)
      _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
      _v2 = key
      _v3 = GLib::Lib.g_hash_table_contains(_v1, _v2)
      return _v3
    end
    def self.destroy(hash_table)
      _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
      GLib::Lib.g_hash_table_destroy(_v1)
    end
    def self.find(hash_table, &predicate)
      _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
      _v2 = GLib::HRFunc.from(predicate)
      _v3 = GirFFI::ArgHelper.store(_v2)
      _v4 = GLib::Lib.g_hash_table_find(_v1, _v2, _v3)
      return _v4
    end
    def self.foreach(hash_table, &func)
      _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
      _v2 = GLib::HFunc.from(func)
      _v3 = GirFFI::ArgHelper.store(_v2)
      GLib::Lib.g_hash_table_foreach(_v1, _v2, _v3)
    end
    def self.foreach_remove(hash_table, &func)
      _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
      _v2 = GLib::HRFunc.from(func)
      _v3 = GirFFI::ArgHelper.store(_v2)
      _v4 = GLib::Lib.g_hash_table_foreach_remove(_v1, _v2, _v3)
      return _v4
    end
    def self.foreach_steal(hash_table, &func)
      _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
      _v2 = GLib::HRFunc.from(func)
      _v3 = GirFFI::ArgHelper.store(_v2)
      _v4 = GLib::Lib.g_hash_table_foreach_steal(_v1, _v2, _v3)
      return _v4
    end
    def self.from_enumerable(typespec, hash)
      ghash = new(*typespec)
      hash.each { |key, val| ghash.insert(key, val) }
      ghash
    end
    def self.insert(hash_table, key = nil, value = nil)
      _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
      _v2 = key
      _v3 = value
      _v4 = GLib::Lib.g_hash_table_insert(_v1, _v2, _v3)
      return _v4
    end
    def self.lookup(hash_table, key = nil)
      _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
      _v2 = key
      _v3 = GLib::Lib.g_hash_table_lookup(_v1, _v2)
      return _v3
    end
    def self.lookup_extended(hash_table, lookup_key = nil)
      _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
      _v2 = lookup_key
      _v3 = FFI::MemoryPointer.new(:pointer)
      _v4 = FFI::MemoryPointer.new(:pointer)
      _v5 = GLib::Lib.g_hash_table_lookup_extended(_v1, _v2, _v3, _v4)
      _v6 = _v3.get_pointer(0)
      _v7 = _v4.get_pointer(0)
      return [_v5, _v6, _v7]
    end
    def self.new_similar(other_hash_table)
      _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], other_hash_table)
      _v2 = GLib::Lib.g_hash_table_new_similar(_v1)
      _v3 = GLib::HashTable.wrap([[:pointer, :void], [:pointer, :void]], _v2)
      return _v3
    end
    def self.ref(hash_table)
      _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
      _v2 = GLib::Lib.g_hash_table_ref(_v1)
      _v3 = GLib::HashTable.wrap([[:pointer, :void], [:pointer, :void]], _v2)
      return _v3
    end
    def self.remove(hash_table, key = nil)
      _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
      _v2 = key
      _v3 = GLib::Lib.g_hash_table_remove(_v1, _v2)
      return _v3
    end
    def self.remove_all(hash_table)
      _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
      GLib::Lib.g_hash_table_remove_all(_v1)
    end
    def self.replace(hash_table, key = nil, value = nil)
      _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
      _v2 = key
      _v3 = value
      _v4 = GLib::Lib.g_hash_table_replace(_v1, _v2, _v3)
      return _v4
    end
    def self.size(hash_table)
      _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
      _v2 = GLib::Lib.g_hash_table_size(_v1)
      return _v2
    end
    def self.steal(hash_table, key = nil)
      _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
      _v2 = key
      _v3 = GLib::Lib.g_hash_table_steal(_v1, _v2)
      return _v3
    end
    def self.steal_all(hash_table)
      _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
      GLib::Lib.g_hash_table_steal_all(_v1)
    end
    def self.steal_extended(hash_table, lookup_key = nil)
      _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
      _v2 = lookup_key
      _v3 = FFI::MemoryPointer.new(:pointer)
      _v4 = FFI::MemoryPointer.new(:pointer)
      _v5 = GLib::Lib.g_hash_table_steal_extended(_v1, _v2, _v3, _v4)
      _v6 = _v3.get_pointer(0)
      _v7 = _v4.get_pointer(0)
      return [_v5, _v6, _v7]
    end
    def self.unref(hash_table)
      _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
      GLib::Lib.g_hash_table_unref(_v1)
    end
    def each
      prc = proc do |keyptr, valptr, _userdata|
        key = GirFFI::ArgHelper.cast_from_pointer(key_type, keyptr)
        val = GirFFI::ArgHelper.cast_from_pointer(value_type, valptr)
        yield(key, val)
      end
      callback = GLib::HFunc.from(prc)
      ::GLib::Lib.g_hash_table_foreach(to_ptr, callback, nil)
    end
    # @override
    def insert(key, value)
      keyptr = GirFFI::InPointer.from(key_type, key)
      valptr = GirFFI::InPointer.from(value_type, value)
      ::GLib::Lib.g_hash_table_insert(to_ptr, keyptr, valptr)
    end
    # @api private
    def reset_typespec(typespec)
      @key_type, @value_type = *typespec
      self
    end
    def to_hash
      to_a.to_h
    end
  end
  class GLib::HashTableIter < GirFFI::StructBase
  
    def dummy1
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(0)
      _v2
    end
    def dummy2
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(8)
      _v2
    end
    def dummy3
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(16)
      _v2
    end
    def dummy4
      _v1 = @struct.to_ptr
      _v2 = _v1.get_int32(24)
      _v2
    end
    def dummy5
      _v1 = @struct.to_ptr
      _v2 = GirFFI::Boolean.get_value_from_pointer(_v1, 28)
      _v2
    end
    def dummy6
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(32)
      _v2
    end
    def get_hash_table
      _v1 = GLib::Lib.g_hash_table_iter_get_hash_table(self)
      _v2 = GLib::HashTable.wrap([[:pointer, :void], [:pointer, :void]], _v1)
      return _v2
    end
    def init(hash_table)
      _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
      GLib::Lib.g_hash_table_iter_init(self, _v1)
    end
    def next
      _v1 = FFI::MemoryPointer.new(:pointer)
      _v2 = FFI::MemoryPointer.new(:pointer)
      _v3 = GLib::Lib.g_hash_table_iter_next(self, _v1, _v2)
      _v4 = _v1.get_pointer(0)
      _v5 = _v2.get_pointer(0)
      return [_v3, _v4, _v5]
    end
    def remove
      GLib::Lib.g_hash_table_iter_remove(self)
    end
    def replace(value = nil)
      _v1 = value
      GLib::Lib.g_hash_table_iter_replace(self, _v1)
    end
    def steal
      GLib::Lib.g_hash_table_iter_steal(self)
    end
    alias_method 'hash_table', 'get_hash_table'
  end
  class GLib::Hmac < GirFFI::BoxedBase
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def copy
      _v1 = GLib::Lib.g_hmac_copy(self)
      _v2 = GLib::Hmac.wrap_own(_v1)
      return _v2
    end
    def get_digest(buffer)
      digest_len = buffer.nil? ? (0) : (buffer.length)
      _v1 = FFI::MemoryPointer.new(:uint64)
      _v1.put_uint64(0, digest_len)
      _v2 = GirFFI::SizedArray.from(:guint8, -1, buffer)
      GLib::Lib.g_hmac_get_digest(self, _v2, _v1)
      _v3 = _v1.get_uint64(0)
    end
    def get_string
      _v1 = GLib::Lib.g_hmac_get_string(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def ref
      _v1 = GLib::Lib.g_hmac_ref(self)
      _v2 = GLib::Hmac.wrap_own(_v1)
      return _v2
    end
    def unref
      GLib::Lib.g_hmac_unref(self)
    end
    def update(data)
      length = data.nil? ? (0) : (data.length)
      _v1 = length
      _v2 = GirFFI::SizedArray.from(:guint8, -1, data)
      GLib::Lib.g_hmac_update(self, _v2, _v1)
    end
    alias_method 'digest', 'get_digest'
    alias_method 'string', 'get_string'
  end
  class GLib::Hook < GirFFI::StructBase
    def self.destroy(hook_list, hook_id)
      _v1 = GLib::HookList.from(hook_list)
      _v2 = hook_id
      _v3 = GLib::Lib.g_hook_destroy(_v1, _v2)
      return _v3
    end
    def self.destroy_link(hook_list, hook)
      _v1 = GLib::HookList.from(hook_list)
      _v2 = GLib::Hook.from(hook)
      GLib::Lib.g_hook_destroy_link(_v1, _v2)
    end
    def self.free(hook_list, hook)
      _v1 = GLib::HookList.from(hook_list)
      _v2 = GLib::Hook.from(hook)
      GLib::Lib.g_hook_free(_v1, _v2)
    end
    def self.insert_before(hook_list, sibling, hook)
      _v1 = GLib::HookList.from(hook_list)
      _v2 = GLib::Hook.from(sibling)
      _v3 = GLib::Hook.from(hook)
      GLib::Lib.g_hook_insert_before(_v1, _v2, _v3)
    end
    def self.insert_sorted(hook_list, hook, &func)
      _v1 = GLib::HookList.from(hook_list)
      _v2 = GLib::Hook.from(hook)
      _v3 = GLib::HookCompareFunc.from(func)
      GLib::Lib.g_hook_insert_sorted(_v1, _v2, _v3)
    end
    def self.prepend(hook_list, hook)
      _v1 = GLib::HookList.from(hook_list)
      _v2 = GLib::Hook.from(hook)
      GLib::Lib.g_hook_prepend(_v1, _v2)
    end
    def self.unref(hook_list, hook)
      _v1 = GLib::HookList.from(hook_list)
      _v2 = GLib::Hook.from(hook)
      GLib::Lib.g_hook_unref(_v1, _v2)
    end
    def compare_ids(sibling)
      _v1 = GLib::Hook.from(sibling)
      _v2 = GLib::Lib.g_hook_compare_ids(self, _v1)
      return _v2
    end
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
    def destroy
      _v1 = @struct.to_ptr
      _v2 = GLib::DestroyNotify.get_value_from_pointer(_v1, 56)
      _v2
    end
    def destroy=(value)
      _v1 = @struct.to_ptr
      _v2 = GLib::DestroyNotify.from(value)
      GLib::DestroyNotify.copy_value_to_pointer(_v2, _v1, 56)
    end
    def flags
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(40)
      _v2
    end
    def flags=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(40, _v2)
    end
    def func
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(48)
      _v2
    end
    def func=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_pointer(48, _v2)
    end
    def hook_id
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint64(32)
      _v2
    end
    def hook_id=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint64(32, _v2)
    end
    def next
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(8)
      _v3 = GLib::Hook.wrap(_v2)
      _v3
    end
    def next=(value)
      _v1 = @struct.to_ptr
      _v2 = GLib::Hook.copy_from(value)
      _v1.put_pointer(8, _v2)
    end
    def prev
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(16)
      _v3 = GLib::Hook.wrap(_v2)
      _v3
    end
    def prev=(value)
      _v1 = @struct.to_ptr
      _v2 = GLib::Hook.copy_from(value)
      _v1.put_pointer(16, _v2)
    end
    def ref_count
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(24)
      _v2
    end
    def ref_count=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(24, _v2)
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print flags
  # XXX: Don't know how to print callback
  class GLib::HookList < GirFFI::StructBase
  
    def clear
      GLib::Lib.g_hook_list_clear(self)
    end
    def dummy
      _v1 = @struct.to_ptr
      _v2 = GirFFI::SizedArray.get_value_from_pointer(_v1, 40)
      _v3 = GirFFI::SizedArray.wrap([:pointer, :void], 2, _v2)
      _v3
    end
    def dummy3
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(24)
      _v2
    end
    def dummy3=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_pointer(24, _v2)
    end
    def dummy=(value)
      _v1 = @struct.to_ptr
      GirFFI::ArgHelper.check_fixed_array_size(2, value, "value")
      _v2 = GirFFI::SizedArray.copy_from([:pointer, :void], 2, value)
      GirFFI::SizedArray.copy_value_to_pointer(_v2, _v1, 40)
    end
    def finalize_hook
      _v1 = @struct.to_ptr
      _v2 = GLib::HookFinalizeFunc.get_value_from_pointer(_v1, 32)
      _v2
    end
    def finalize_hook=(value)
      _v1 = @struct.to_ptr
      _v2 = GLib::HookFinalizeFunc.from(value)
      GLib::HookFinalizeFunc.copy_value_to_pointer(_v2, _v1, 32)
    end
    def hook_size
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(8)
      _v2
    end
    def hook_size=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(8, _v2)
    end
    def hooks
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(16)
      _v3 = GLib::Hook.wrap(_v2)
      _v3
    end
    def hooks=(value)
      _v1 = @struct.to_ptr
      _v2 = GLib::Hook.copy_from(value)
      _v1.put_pointer(16, _v2)
    end
    def init(hook_size)
      _v1 = hook_size
      GLib::Lib.g_hook_list_init(self, _v1)
    end
    def invoke(may_recurse)
      _v1 = may_recurse
      GLib::Lib.g_hook_list_invoke(self, _v1)
    end
    def invoke_check(may_recurse)
      _v1 = may_recurse
      GLib::Lib.g_hook_list_invoke_check(self, _v1)
    end
    def is_setup
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(12)
      _v2
    end
    def is_setup=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(12, _v2)
    end
    def marshal(may_recurse, &marshaller)
      _v1 = may_recurse
      _v2 = GLib::HookMarshaller.from(marshaller)
      _v3 = GirFFI::ArgHelper.store(_v2)
      GLib::Lib.g_hook_list_marshal(self, _v1, _v2, _v3)
    end
    def marshal_check(may_recurse, &marshaller)
      _v1 = may_recurse
      _v2 = GLib::HookCheckMarshaller.from(marshaller)
      _v3 = GirFFI::ArgHelper.store(_v2)
      GLib::Lib.g_hook_list_marshal_check(self, _v1, _v2, _v3)
    end
    def seq_id
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint64(0)
      _v2
    end
    def seq_id=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint64(0, _v2)
    end
  end
  # XXX: Don't know how to print callback
  IEEE754_DOUBLE_BIAS = 1023
  IEEE754_FLOAT_BIAS = 127
  class GLib::IOChannel < GirFFI::BoxedBase
    def self.error_from_errno(en)
      _v1 = en
      _v2 = GLib::Lib.g_io_channel_error_from_errno(_v1)
      return _v2
    end
    def self.error_quark
      _v1 = GLib::Lib.g_io_channel_error_quark
      return _v1
    end
    def self.new_file(*args, &block)
      raise(NoMethodError) unless (self == GLib::IOChannel)
      obj = allocate
      obj.__send__(:initialize_file, *args, &block)
      obj
    end
    def self.unix_new(*args, &block)
      raise(NoMethodError) unless (self == GLib::IOChannel)
      obj = allocate
      obj.__send__(:unix_new, *args, &block)
      obj
    end
    def buf_size
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint64(56)
      _v2
    end
    def close
      GLib::Lib.g_io_channel_close(self)
    end
    def close_on_unref
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(104)
      _v2
    end
    def do_encode
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(100)
      _v2
    end
    def encoded_read_buf
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(72)
      _v3 = GLib::String.wrap(_v2)
      _v3
    end
    def encoding
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(16)
      _v3 = _v2.to_utf8
      _v3
    end
    def flush
      _v1 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v2 = GLib::Lib.g_io_channel_flush(self, _v1)
      GirFFI::ArgHelper.check_error(_v1)
      return _v2
    end
    def funcs
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(8)
      _v3 = GLib::IOFuncs.wrap(_v2)
      _v3
    end
    def get_buffer_condition
      _v1 = GLib::Lib.g_io_channel_get_buffer_condition(self)
      return _v1
    end
    def get_buffer_size
      _v1 = GLib::Lib.g_io_channel_get_buffer_size(self)
      return _v1
    end
    def get_buffered
      _v1 = GLib::Lib.g_io_channel_get_buffered(self)
      return _v1
    end
    def get_close_on_unref
      _v1 = GLib::Lib.g_io_channel_get_close_on_unref(self)
      return _v1
    end
    def get_encoding
      _v1 = GLib::Lib.g_io_channel_get_encoding(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def get_flags
      _v1 = GLib::Lib.g_io_channel_get_flags(self)
      return _v1
    end
    def get_line_term
      _v1 = FFI::MemoryPointer.new(:int32)
      _v2 = GLib::Lib.g_io_channel_get_line_term(self, _v1)
      _v3 = _v1.get_int32(0)
      _v4 = _v2.to_utf8
      return [_v4, _v3]
    end
    def init
      GLib::Lib.g_io_channel_init(self)
    end
    def initialize_file(filename, mode)
      _v1 = filename
      _v2 = GirFFI::InPointer.from_utf8(mode)
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_io_channel_new_file(_v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      store_pointer(_v4)
      @struct.owned = true
    end
    def is_readable
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(108)
      _v2
    end
    def is_seekable
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(116)
      _v2
    end
    def is_writeable
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(112)
      _v2
    end
    def line_term
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(40)
      _v3 = _v2.to_utf8
      _v3
    end
    def line_term_len
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(48)
      _v2
    end
    def partial_write_buf
      _v1 = @struct.to_ptr
      _v2 = GirFFI::SizedArray.get_value_from_pointer(_v1, 88)
      _v3 = GirFFI::SizedArray.wrap(:gint8, 6, _v2)
      _v3
    end
    def read(buf, count, bytes_read)
      _v1 = GirFFI::InPointer.from_utf8(buf)
      _v2 = count
      _v3 = bytes_read
      _v4 = GLib::Lib.g_io_channel_read(self, _v1, _v2, _v3)
      return _v4
    end
    def read_buf
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(64)
      _v3 = GLib::String.wrap(_v2)
      _v3
    end
    def read_cd
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(24)
      _v2
    end
    def read_chars
      count = buf.nil? ? (0) : (buf.length)
      _v1 = count
      _v2 = FFI::MemoryPointer.new(:uint64)
      _v3 = FFI::MemoryPointer.new(:pointer)
      _v4 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v5 = GLib::Lib.g_io_channel_read_chars(self, _v3, _v1, _v2, _v4)
      GirFFI::ArgHelper.check_error(_v4)
      _v6 = _v2.get_uint64(0)
      _v7 = GirFFI::SizedArray.wrap(:guint8, _v1, _v3.get_pointer(0))
      return [_v5, _v7, _v6]
    end
    def read_line
      _v1 = FFI::MemoryPointer.new(:pointer)
      _v2 = FFI::MemoryPointer.new(:uint64)
      _v3 = FFI::MemoryPointer.new(:uint64)
      _v4 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v5 = GLib::Lib.g_io_channel_read_line(self, _v1, _v2, _v3, _v4)
      GirFFI::ArgHelper.check_error(_v4)
      _v6 = GirFFI::AllocationHelper.free_after(_v1.get_pointer(0), &:to_utf8)
      _v7 = _v2.get_uint64(0)
      _v8 = _v3.get_uint64(0)
      return [_v5, _v6, _v7, _v8]
    end
    def read_line_string(buffer, terminator_pos = nil)
      _v1 = GLib::String.from(buffer)
      _v2 = terminator_pos
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_io_channel_read_line_string(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      return _v4
    end
    def read_to_end
      _v1 = FFI::MemoryPointer.new(:uint64)
      _v2 = FFI::MemoryPointer.new(:pointer)
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_io_channel_read_to_end(self, _v2, _v1, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      _v5 = _v1.get_uint64(0)
      _v6 = GirFFI::SizedArray.wrap(:guint8, _v5, _v2.get_pointer(0))
      return [_v4, _v6]
    end
    def read_unichar
      _v1 = FFI::MemoryPointer.new(:uint32)
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_io_channel_read_unichar(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      _v4 = _v1.get_uint32(0)
      return [_v3, _v4]
    end
    def ref
      _v1 = GLib::Lib.g_io_channel_ref(self)
      _v2 = GLib::IOChannel.wrap_own(_v1)
      return _v2
    end
    def ref_count
      _v1 = @struct.to_ptr
      _v2 = _v1.get_int32(0)
      _v2
    end
    def reserved1
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(120)
      _v2
    end
    def reserved2
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(128)
      _v2
    end
    def seek(offset, type)
      _v1 = offset
      _v2 = type
      _v3 = GLib::Lib.g_io_channel_seek(self, _v1, _v2)
      return _v3
    end
    def seek_position(offset, type)
      _v1 = offset
      _v2 = type
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_io_channel_seek_position(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      return _v4
    end
    def set_buffer_size(size)
      _v1 = size
      GLib::Lib.g_io_channel_set_buffer_size(self, _v1)
    end
    def set_buffered(buffered)
      _v1 = buffered
      GLib::Lib.g_io_channel_set_buffered(self, _v1)
    end
    def set_close_on_unref(do_close)
      _v1 = do_close
      GLib::Lib.g_io_channel_set_close_on_unref(self, _v1)
    end
    def set_encoding(encoding = nil)
      _v1 = GirFFI::InPointer.from_utf8(encoding)
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_io_channel_set_encoding(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      return _v3
    end
    def set_flags(flags)
      _v1 = flags
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_io_channel_set_flags(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      return _v3
    end
    def set_line_term(line_term, length)
      _v1 = GirFFI::InPointer.from_utf8(line_term)
      _v2 = length
      GLib::Lib.g_io_channel_set_line_term(self, _v1, _v2)
    end
    def shutdown(flush)
      _v1 = flush
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_io_channel_shutdown(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      return _v3
    end
    def unix_get_fd
      _v1 = GLib::Lib.g_io_channel_unix_get_fd(self)
      return _v1
    end
    def unix_new(fd)
      _v1 = fd
      _v2 = GLib::Lib.g_io_channel_unix_new(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def unref
      GLib::Lib.g_io_channel_unref(self)
    end
    def use_buffer
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(96)
      _v2
    end
    def write(buf, count, bytes_written)
      _v1 = GirFFI::InPointer.from_utf8(buf)
      _v2 = count
      _v3 = bytes_written
      _v4 = GLib::Lib.g_io_channel_write(self, _v1, _v2, _v3)
      return _v4
    end
    def write_buf
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(80)
      _v3 = GLib::String.wrap(_v2)
      _v3
    end
    def write_cd
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(32)
      _v2
    end
    def write_chars(buf, count)
      _v1 = GirFFI::SizedArray.from(:guint8, -1, buf)
      _v2 = count
      _v3 = FFI::MemoryPointer.new(:uint64)
      _v4 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v5 = GLib::Lib.g_io_channel_write_chars(self, _v1, _v2, _v3, _v4)
      GirFFI::ArgHelper.check_error(_v4)
      _v6 = _v3.get_uint64(0)
      return [_v5, _v6]
    end
    def write_unichar(thechar)
      _v1 = thechar
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_io_channel_write_unichar(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      return _v3
    end
    alias_method 'buffer_condition', 'get_buffer_condition'
    alias_method 'buffer_size', 'get_buffer_size'
    alias_method 'buffer_size=', 'set_buffer_size'
    alias_method 'buffered', 'get_buffered'
    alias_method 'buffered=', 'set_buffered'
    alias_method 'close_on_unref=', 'set_close_on_unref'
    alias_method 'encoding=', 'set_encoding'
    alias_method 'flags', 'get_flags'
    alias_method 'flags=', 'set_flags'
  end
  # XXX: Don't know how to print enum
  # XXX: Don't know how to print flags
  # XXX: Don't know how to print enum
  # XXX: Don't know how to print flags
  # XXX: Don't know how to print callback
  class GLib::IOFuncs < GirFFI::StructBase
  
    def io_close
      _v1 = @struct.to_ptr
      _v2 = GLib::IOFuncs::Io_close.get_value_from_pointer(_v1, 24)
      _v2
    end
    def io_create_watch
      _v1 = @struct.to_ptr
      _v2 = GLib::IOFuncs::Io_create_watch.get_value_from_pointer(_v1, 32)
      _v2
    end
    def io_free
      _v1 = @struct.to_ptr
      _v2 = GLib::IOFuncs::Io_free.get_value_from_pointer(_v1, 40)
      _v2
    end
    def io_get_flags
      _v1 = @struct.to_ptr
      _v2 = GLib::IOFuncs::Io_get_flags.get_value_from_pointer(_v1, 56)
      _v2
    end
    def io_read
      _v1 = @struct.to_ptr
      _v2 = GLib::IOFuncs::Io_read.get_value_from_pointer(_v1, 0)
      _v2
    end
    def io_seek
      _v1 = @struct.to_ptr
      _v2 = GLib::IOFuncs::Io_seek.get_value_from_pointer(_v1, 16)
      _v2
    end
    def io_set_flags
      _v1 = @struct.to_ptr
      _v2 = GLib::IOFuncs::Io_set_flags.get_value_from_pointer(_v1, 48)
      _v2
    end
    def io_write
      _v1 = @struct.to_ptr
      _v2 = GLib::IOFuncs::Io_write.get_value_from_pointer(_v1, 8)
      _v2
    end
  end
  # XXX: Don't know how to print enum
  KEY_FILE_DESKTOP_GROUP = "Desktop Entry"
  KEY_FILE_DESKTOP_KEY_ACTIONS = "Actions"
  KEY_FILE_DESKTOP_KEY_CATEGORIES = "Categories"
  KEY_FILE_DESKTOP_KEY_COMMENT = "Comment"
  KEY_FILE_DESKTOP_KEY_DBUS_ACTIVATABLE = "DBusActivatable"
  KEY_FILE_DESKTOP_KEY_EXEC = "Exec"
  KEY_FILE_DESKTOP_KEY_GENERIC_NAME = "GenericName"
  KEY_FILE_DESKTOP_KEY_HIDDEN = "Hidden"
  KEY_FILE_DESKTOP_KEY_ICON = "Icon"
  KEY_FILE_DESKTOP_KEY_MIME_TYPE = "MimeType"
  KEY_FILE_DESKTOP_KEY_NAME = "Name"
  KEY_FILE_DESKTOP_KEY_NOT_SHOW_IN = "NotShowIn"
  KEY_FILE_DESKTOP_KEY_NO_DISPLAY = "NoDisplay"
  KEY_FILE_DESKTOP_KEY_ONLY_SHOW_IN = "OnlyShowIn"
  KEY_FILE_DESKTOP_KEY_PATH = "Path"
  KEY_FILE_DESKTOP_KEY_STARTUP_NOTIFY = "StartupNotify"
  KEY_FILE_DESKTOP_KEY_STARTUP_WM_CLASS = "StartupWMClass"
  KEY_FILE_DESKTOP_KEY_TERMINAL = "Terminal"
  KEY_FILE_DESKTOP_KEY_TRY_EXEC = "TryExec"
  KEY_FILE_DESKTOP_KEY_TYPE = "Type"
  KEY_FILE_DESKTOP_KEY_URL = "URL"
  KEY_FILE_DESKTOP_KEY_VERSION = "Version"
  KEY_FILE_DESKTOP_TYPE_APPLICATION = "Application"
  KEY_FILE_DESKTOP_TYPE_DIRECTORY = "Directory"
  KEY_FILE_DESKTOP_TYPE_LINK = "Link"
  class GLib::KeyFile < GirFFI::BoxedBase
    def self.error_quark
      _v1 = GLib::Lib.g_key_file_error_quark
      return _v1
    end
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def get_boolean(group_name, key)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_key_file_get_boolean(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      return _v4
    end
    def get_boolean_list(group_name, key)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = FFI::MemoryPointer.new(:uint64)
      _v4 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v5 = GLib::Lib.g_key_file_get_boolean_list(self, _v1, _v2, _v3, _v4)
      GirFFI::ArgHelper.check_error(_v4)
      _v6 = _v3.get_uint64(0)
      _v7 = GirFFI::SizedArray.wrap(:gboolean, _v6, _v5)
      return _v7
    end
    def get_comment(group_name = nil, key = nil)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_key_file_get_comment(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      _v5 = GirFFI::AllocationHelper.free_after(_v4, &:to_utf8)
      return _v5
    end
    def get_double(group_name, key)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_key_file_get_double(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      return _v4
    end
    def get_double_list(group_name, key)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = FFI::MemoryPointer.new(:uint64)
      _v4 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v5 = GLib::Lib.g_key_file_get_double_list(self, _v1, _v2, _v3, _v4)
      GirFFI::ArgHelper.check_error(_v4)
      _v6 = _v3.get_uint64(0)
      _v7 = GirFFI::SizedArray.wrap(:gdouble, _v6, _v5)
      return _v7
    end
    def get_groups
      _v1 = FFI::MemoryPointer.new(:uint64)
      _v2 = GLib::Lib.g_key_file_get_groups(self, _v1)
      _v3 = _v1.get_uint64(0)
      _v4 = GLib::Strv.wrap(_v2)
      return [_v4, _v3]
    end
    def get_int64(group_name, key)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_key_file_get_int64(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      return _v4
    end
    def get_integer(group_name, key)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_key_file_get_integer(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      return _v4
    end
    def get_integer_list(group_name, key)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = FFI::MemoryPointer.new(:uint64)
      _v4 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v5 = GLib::Lib.g_key_file_get_integer_list(self, _v1, _v2, _v3, _v4)
      GirFFI::ArgHelper.check_error(_v4)
      _v6 = _v3.get_uint64(0)
      _v7 = GirFFI::SizedArray.wrap(:gint32, _v6, _v5)
      return _v7
    end
    def get_keys(group_name)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = FFI::MemoryPointer.new(:uint64)
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_key_file_get_keys(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      _v5 = _v2.get_uint64(0)
      _v6 = GLib::Strv.wrap(_v4)
      return [_v6, _v5]
    end
    def get_locale_for_key(group_name, key, locale = nil)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = GirFFI::InPointer.from_utf8(locale)
      _v4 = GLib::Lib.g_key_file_get_locale_for_key(self, _v1, _v2, _v3)
      _v5 = GirFFI::AllocationHelper.free_after(_v4, &:to_utf8)
      return _v5
    end
    def get_locale_string(group_name, key, locale = nil)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = GirFFI::InPointer.from_utf8(locale)
      _v4 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v5 = GLib::Lib.g_key_file_get_locale_string(self, _v1, _v2, _v3, _v4)
      GirFFI::ArgHelper.check_error(_v4)
      _v6 = GirFFI::AllocationHelper.free_after(_v5, &:to_utf8)
      return _v6
    end
    def get_locale_string_list(group_name, key, locale = nil)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = GirFFI::InPointer.from_utf8(locale)
      _v4 = FFI::MemoryPointer.new(:uint64)
      _v5 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v6 = GLib::Lib.g_key_file_get_locale_string_list(self, _v1, _v2, _v3, _v4, _v5)
      GirFFI::ArgHelper.check_error(_v5)
      _v7 = GLib::Strv.wrap(_v6)
      return _v7
    end
    def get_start_group
      _v1 = GLib::Lib.g_key_file_get_start_group(self)
      _v2 = GirFFI::AllocationHelper.free_after(_v1, &:to_utf8)
      return _v2
    end
    def get_string(group_name, key)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_key_file_get_string(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      _v5 = GirFFI::AllocationHelper.free_after(_v4, &:to_utf8)
      return _v5
    end
    def get_string_list(group_name, key)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = FFI::MemoryPointer.new(:uint64)
      _v4 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v5 = GLib::Lib.g_key_file_get_string_list(self, _v1, _v2, _v3, _v4)
      GirFFI::ArgHelper.check_error(_v4)
      _v6 = GLib::Strv.wrap(_v5)
      return _v6
    end
    def get_uint64(group_name, key)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_key_file_get_uint64(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      return _v4
    end
    def get_value(group_name, key)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_key_file_get_value(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      _v5 = GirFFI::AllocationHelper.free_after(_v4, &:to_utf8)
      return _v5
    end
    def has_group(group_name)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GLib::Lib.g_key_file_has_group(self, _v1)
      return _v2
    end
    def load_from_bytes(bytes, flags)
      _v1 = GLib::Bytes.from(bytes)
      _v2 = flags
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_key_file_load_from_bytes(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      return _v4
    end
    def load_from_data(data, length, flags)
      _v1 = GirFFI::InPointer.from_utf8(data)
      _v2 = length
      _v3 = flags
      _v4 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v5 = GLib::Lib.g_key_file_load_from_data(self, _v1, _v2, _v3, _v4)
      GirFFI::ArgHelper.check_error(_v4)
      return _v5
    end
    def load_from_data_dirs(file, flags)
      _v1 = file
      _v2 = FFI::MemoryPointer.new(:pointer)
      _v3 = flags
      _v4 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v5 = GLib::Lib.g_key_file_load_from_data_dirs(self, _v1, _v2, _v3, _v4)
      GirFFI::ArgHelper.check_error(_v4)
      _v6 = GirFFI::AllocationHelper.free_after(_v2.get_pointer(0), &:to_utf8)
      return [_v5, _v6]
    end
    def load_from_dirs(file, search_dirs, flags)
      _v1 = file
      _v2 = GLib::Strv.from(search_dirs)
      _v3 = FFI::MemoryPointer.new(:pointer)
      _v4 = flags
      _v5 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v6 = GLib::Lib.g_key_file_load_from_dirs(self, _v1, _v2, _v3, _v4, _v5)
      GirFFI::ArgHelper.check_error(_v5)
      _v7 = GirFFI::AllocationHelper.free_after(_v3.get_pointer(0), &:to_utf8)
      return [_v6, _v7]
    end
    def load_from_file(file, flags)
      _v1 = file
      _v2 = flags
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_key_file_load_from_file(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      return _v4
    end
    def remove_comment(group_name = nil, key = nil)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_key_file_remove_comment(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      return _v4
    end
    def remove_group(group_name)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_key_file_remove_group(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      return _v3
    end
    def remove_key(group_name, key)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_key_file_remove_key(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      return _v4
    end
    def save_to_file(filename)
      _v1 = GirFFI::InPointer.from_utf8(filename)
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_key_file_save_to_file(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      return _v3
    end
    def set_boolean(group_name, key, value)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = value
      GLib::Lib.g_key_file_set_boolean(self, _v1, _v2, _v3)
    end
    def set_boolean_list(group_name, key, list)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      length = list.nil? ? (0) : (list.length)
      _v3 = length
      _v4 = GirFFI::SizedArray.from(:gboolean, -1, list)
      GLib::Lib.g_key_file_set_boolean_list(self, _v1, _v2, _v4, _v3)
    end
    def set_comment(group_name, key, comment)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = GirFFI::InPointer.from_utf8(comment)
      _v4 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v5 = GLib::Lib.g_key_file_set_comment(self, _v1, _v2, _v3, _v4)
      GirFFI::ArgHelper.check_error(_v4)
      return _v5
    end
    def set_double(group_name, key, value)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = value
      GLib::Lib.g_key_file_set_double(self, _v1, _v2, _v3)
    end
    def set_double_list(group_name, key, list)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      length = list.nil? ? (0) : (list.length)
      _v3 = length
      _v4 = GirFFI::SizedArray.from(:gdouble, -1, list)
      GLib::Lib.g_key_file_set_double_list(self, _v1, _v2, _v4, _v3)
    end
    def set_int64(group_name, key, value)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = value
      GLib::Lib.g_key_file_set_int64(self, _v1, _v2, _v3)
    end
    def set_integer(group_name, key, value)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = value
      GLib::Lib.g_key_file_set_integer(self, _v1, _v2, _v3)
    end
    def set_integer_list(group_name, key, list)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      length = list.nil? ? (0) : (list.length)
      _v3 = length
      _v4 = GirFFI::SizedArray.from(:gint32, -1, list)
      GLib::Lib.g_key_file_set_integer_list(self, _v1, _v2, _v4, _v3)
    end
    def set_list_separator(separator)
      _v1 = separator
      GLib::Lib.g_key_file_set_list_separator(self, _v1)
    end
    def set_locale_string(group_name, key, locale, string)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = GirFFI::InPointer.from_utf8(locale)
      _v4 = GirFFI::InPointer.from_utf8(string)
      GLib::Lib.g_key_file_set_locale_string(self, _v1, _v2, _v3, _v4)
    end
    def set_locale_string_list(group_name, key, locale, list)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = GirFFI::InPointer.from_utf8(locale)
      length = list.nil? ? (0) : (list.length)
      _v4 = length
      _v5 = GLib::Strv.from(list)
      GLib::Lib.g_key_file_set_locale_string_list(self, _v1, _v2, _v3, _v5, _v4)
    end
    def set_string(group_name, key, string)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = GirFFI::InPointer.from_utf8(string)
      GLib::Lib.g_key_file_set_string(self, _v1, _v2, _v3)
    end
    def set_string_list(group_name, key, list)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      length = list.nil? ? (0) : (list.length)
      _v3 = length
      _v4 = GLib::Strv.from(list)
      GLib::Lib.g_key_file_set_string_list(self, _v1, _v2, _v4, _v3)
    end
    def set_uint64(group_name, key, value)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = value
      GLib::Lib.g_key_file_set_uint64(self, _v1, _v2, _v3)
    end
    def set_value(group_name, key, value)
      _v1 = GirFFI::InPointer.from_utf8(group_name)
      _v2 = GirFFI::InPointer.from_utf8(key)
      _v3 = GirFFI::InPointer.from_utf8(value)
      GLib::Lib.g_key_file_set_value(self, _v1, _v2, _v3)
    end
    def to_data
      _v1 = FFI::MemoryPointer.new(:uint64)
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_key_file_to_data(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      _v4 = _v1.get_uint64(0)
      _v5 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
      return [_v5, _v4]
    end
    def unref
      GLib::Lib.g_key_file_unref(self)
    end
    alias_method 'boolean', 'get_boolean'
    alias_method 'boolean_list', 'get_boolean_list'
    alias_method 'comment', 'get_comment'
    alias_method 'double', 'get_double'
    alias_method 'double_list', 'get_double_list'
    alias_method 'groups', 'get_groups'
    alias_method 'int64', 'get_int64'
    alias_method 'integer', 'get_integer'
    alias_method 'integer_list', 'get_integer_list'
    alias_method 'keys', 'get_keys'
    alias_method 'list_separator=', 'set_list_separator'
    alias_method 'locale_for_key', 'get_locale_for_key'
    alias_method 'locale_string', 'get_locale_string'
    alias_method 'locale_string_list', 'get_locale_string_list'
    alias_method 'start_group', 'get_start_group'
    alias_method 'string', 'get_string'
    alias_method 'string_list', 'get_string_list'
    alias_method 'uint64', 'get_uint64'
    alias_method 'value', 'get_value'
  end
  # XXX: Don't know how to print enum
  # XXX: Don't know how to print flags
  LITTLE_ENDIAN = 1234
  LN10 = 2.302585
  LN2 = 0.693147
  LOG_2_BASE_10 = 0.30103
  LOG_DOMAIN = 0
  LOG_FATAL_MASK = 5
  LOG_LEVEL_USER_SHIFT = 8
  class GLib::List < GirFFI::StructBase
    def self.pop_allocator
      GLib::Lib.g_list_pop_allocator
    end
    def self.push_allocator(allocator)
      _v1 = GLib::Allocator.from(allocator)
      GLib::Lib.g_list_push_allocator(_v1)
    end
    def append(data)
      store_pointer(Lib.g_list_append(self, element_ptr_for(data)))
      self
    end
    def data=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_pointer(0, _v2)
    end
    def next=(value)
      _v1 = @struct.to_ptr
      _v2 = GLib::List.from([:pointer, :void], value)
      _v1.put_pointer(8, _v2)
    end
    def prepend(data)
      store_pointer(Lib.g_list_prepend(self, element_ptr_for(data)))
      self
    end
    def prev
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(16)
      _v3 = GLib::List.wrap([:pointer, :void], _v2)
      _v3
    end
    def prev=(value)
      _v1 = @struct.to_ptr
      _v2 = GLib::List.from([:pointer, :void], value)
      _v1.put_pointer(16, _v2)
    end
    def reverse
      store_pointer(Lib.g_list_reverse(self))
      self
    end
    alias_method 'data', 'head'
    alias_method 'next', 'tail'
  end
  class GLib::LogField < GirFFI::StructBase
  
    def key
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(0)
      _v3 = _v2.to_utf8
      _v3
    end
    def key=(value)
      _v1 = @struct.to_ptr
      _v2 = GirFFI::InPointer.from_utf8(value)
      _v1.put_pointer(0, _v2)
    end
    def length
      _v1 = @struct.to_ptr
      _v2 = _v1.get_int64(16)
      _v2
    end
    def length=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_int64(16, _v2)
    end
    def value
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(8)
      _v2
    end
    def value=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_pointer(8, _v2)
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print flags
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print enum
  MAJOR_VERSION = 2
  MAXINT16 = 32767
  MAXINT32 = 2147483647
  MAXINT64 = 9223372036854775807
  MAXINT8 = 127
  MAXUINT16 = 65535
  MAXUINT32 = 4294967295
  MAXUINT64 = 18446744073709551615
  MAXUINT8 = 255
  MICRO_VERSION = 3
  MININT16 = -32768
  MININT32 = -2147483648
  MININT64 = -9223372036854775808
  MININT8 = -128
  MINOR_VERSION = 83
  MODULE_SUFFIX = "so"
  class GLib::MainContext < GirFFI::BoxedBase
    def self.default
      _v1 = GLib::Lib.g_main_context_default
      _v2 = GLib::MainContext.wrap_copy(_v1)
      return _v2
    end
    def self.get_thread_default
      _v1 = GLib::Lib.g_main_context_get_thread_default
      _v2 = GLib::MainContext.wrap_copy(_v1)
      return _v2
    end
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def self.new_with_flags(*args, &block)
      raise(NoMethodError) unless (self == GLib::MainContext)
      obj = allocate
      obj.__send__(:initialize_with_flags, *args, &block)
      obj
    end
    def self.ref_thread_default
      _v1 = GLib::Lib.g_main_context_ref_thread_default
      _v2 = GLib::MainContext.wrap_own(_v1)
      return _v2
    end
    def acquire
      _v1 = GLib::Lib.g_main_context_acquire(self)
      return _v1
    end
    def add_poll(fd, priority)
      _v1 = GLib::PollFD.from(fd)
      _v2 = priority
      GLib::Lib.g_main_context_add_poll(self, _v1, _v2)
    end
    def check(max_priority, fds)
      _v1 = max_priority
      n_fds = fds.nil? ? (0) : (fds.length)
      _v2 = n_fds
      _v3 = GirFFI::SizedArray.from(GLib::PollFD, -1, fds)
      _v4 = GLib::Lib.g_main_context_check(self, _v1, _v3, _v2)
      return _v4
    end
    def dispatch
      GLib::Lib.g_main_context_dispatch(self)
    end
    def find_source_by_funcs_user_data(funcs, user_data = nil)
      _v1 = GLib::SourceFuncs.from(funcs)
      _v2 = user_data
      _v3 = GLib::Lib.g_main_context_find_source_by_funcs_user_data(self, _v1, _v2)
      _v4 = GLib::Source.wrap_copy(_v3)
      return _v4
    end
    def find_source_by_id(source_id)
      _v1 = source_id
      _v2 = GLib::Lib.g_main_context_find_source_by_id(self, _v1)
      _v3 = GLib::Source.wrap_copy(_v2)
      return _v3
    end
    def find_source_by_user_data(user_data = nil)
      _v1 = user_data
      _v2 = GLib::Lib.g_main_context_find_source_by_user_data(self, _v1)
      _v3 = GLib::Source.wrap_copy(_v2)
      return _v3
    end
    def initialize_with_flags(flags)
      _v1 = flags
      _v2 = GLib::Lib.g_main_context_new_with_flags(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def invoke_full(priority, &function)
      _v1 = priority
      _v2 = GLib::SourceFunc.from(function)
      _v3 = GirFFI::ArgHelper.store(_v2)
      _v4 = GLib::DestroyNotify.default
      GLib::Lib.g_main_context_invoke_full(self, _v1, _v2, _v3, _v4)
    end
    def is_owner
      _v1 = GLib::Lib.g_main_context_is_owner(self)
      return _v1
    end
    def iteration(may_block)
      _v1 = may_block
      _v2 = GLib::Lib.g_main_context_iteration(self, _v1)
      return _v2
    end
    def pending
      _v1 = GLib::Lib.g_main_context_pending(self)
      return _v1
    end
    def pop_thread_default
      GLib::Lib.g_main_context_pop_thread_default(self)
    end
    def prepare
      _v1 = FFI::MemoryPointer.new(:int32)
      _v2 = GLib::Lib.g_main_context_prepare(self, _v1)
      _v3 = _v1.get_int32(0)
      return [_v2, _v3]
    end
    def push_thread_default
      GLib::Lib.g_main_context_push_thread_default(self)
    end
    def query(max_priority)
      _v1 = max_priority
      _v2 = FFI::MemoryPointer.new(:int32)
      n_fds = fds.nil? ? (0) : (fds.length)
      _v3 = n_fds
      _v4 = FFI::MemoryPointer.new(:pointer)
      _v5 = GLib::Lib.g_main_context_query(self, _v1, _v2, _v4, _v3)
      _v6 = _v2.get_int32(0)
      _v7 = GirFFI::SizedArray.wrap(GLib::PollFD, _v3, _v4.get_pointer(0))
      return [_v5, _v6, _v7]
    end
    def ref
      _v1 = GLib::Lib.g_main_context_ref(self)
      _v2 = GLib::MainContext.wrap_own(_v1)
      return _v2
    end
    def release
      GLib::Lib.g_main_context_release(self)
    end
    def remove_poll(fd)
      _v1 = GLib::PollFD.from(fd)
      GLib::Lib.g_main_context_remove_poll(self, _v1)
    end
    def unref
      GLib::Lib.g_main_context_unref(self)
    end
    def wait(cond, mutex)
      _v1 = GLib::Cond.from(cond)
      _v2 = mutex
      _v3 = GLib::Lib.g_main_context_wait(self, _v1, _v2)
      return _v3
    end
    def wakeup
      GLib::Lib.g_main_context_wakeup(self)
    end
  end
  # XXX: Don't know how to print flags
  class GLib::MainLoop < GirFFI::BoxedBase
    def self.handle_exception(exception)
      current_loop = RUNNING_LOOPS.last
      raise(exception) unless current_loop
      (EXCEPTIONS << exception)
      current_loop.quit
    end
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def get_context
      _v1 = GLib::Lib.g_main_loop_get_context(self)
      _v2 = GLib::MainContext.wrap_copy(_v1)
      return _v2
    end
    def is_running
      _v1 = GLib::Lib.g_main_loop_is_running(self)
      return _v1
    end
    def quit
      GLib::Lib.g_main_loop_quit(self)
    end
    def ref
      _v1 = GLib::Lib.g_main_loop_ref(self)
      _v2 = GLib::MainLoop.wrap_own(_v1)
      return _v2
    end
    def run_with_thread_enabler
      ThreadEnabler.instance.setup_idle_handler
      (RUNNING_LOOPS << self)
      result = run_without_thread_enabler
      exception = EXCEPTIONS.shift
      RUNNING_LOOPS.pop
      raise(exception) if exception
      result
    end
    def unref
      GLib::Lib.g_main_loop_unref(self)
    end
    alias_method 'context', 'get_context'
    alias_method 'run', 'run_with_thread_enabler'
    alias_method 'run_without_thread_enabler', 'run'
  end
  class GLib::MappedFile < GirFFI::BoxedBase
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def self.new_from_fd(*args, &block)
      raise(NoMethodError) unless (self == GLib::MappedFile)
      obj = allocate
      obj.__send__(:initialize_from_fd, *args, &block)
      obj
    end
    def free
      GLib::Lib.g_mapped_file_free(self)
    end
    def get_bytes
      _v1 = GLib::Lib.g_mapped_file_get_bytes(self)
      _v2 = GLib::Bytes.wrap_own(_v1)
      return _v2
    end
    def get_contents
      _v1 = GLib::Lib.g_mapped_file_get_contents(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def get_length
      _v1 = GLib::Lib.g_mapped_file_get_length(self)
      return _v1
    end
    def initialize_from_fd(fd, writable)
      _v1 = fd
      _v2 = writable
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_mapped_file_new_from_fd(_v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      store_pointer(_v4)
      @struct.owned = true
    end
    def ref
      _v1 = GLib::Lib.g_mapped_file_ref(self)
      _v2 = GLib::MappedFile.wrap_own(_v1)
      return _v2
    end
    def unref
      GLib::Lib.g_mapped_file_unref(self)
    end
    alias_method 'bytes', 'get_bytes'
    alias_method 'contents', 'get_contents'
    alias_method 'length', 'get_length'
  end
  # XXX: Don't know how to print flags
  # XXX: Don't know how to print enum
  class GLib::MarkupParseContext < GirFFI::BoxedBase
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def end_parse
      _v1 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v2 = GLib::Lib.g_markup_parse_context_end_parse(self, _v1)
      GirFFI::ArgHelper.check_error(_v1)
      return _v2
    end
    def free
      GLib::Lib.g_markup_parse_context_free(self)
    end
    def get_element
      _v1 = GLib::Lib.g_markup_parse_context_get_element(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def get_element_stack
      _v1 = GLib::Lib.g_markup_parse_context_get_element_stack(self)
      _v2 = GLib::SList.wrap(:utf8, _v1)
      return _v2
    end
    def get_position
      _v1 = FFI::MemoryPointer.new(:int32)
      _v2 = FFI::MemoryPointer.new(:int32)
      GLib::Lib.g_markup_parse_context_get_position(self, _v1, _v2)
      _v3 = _v1.get_int32(0)
      _v4 = _v2.get_int32(0)
      return [_v3, _v4]
    end
    def get_user_data
      _v1 = GLib::Lib.g_markup_parse_context_get_user_data(self)
      return _v1
    end
    def parse(text, text_len)
      _v1 = GirFFI::InPointer.from_utf8(text)
      _v2 = text_len
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_markup_parse_context_parse(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      return _v4
    end
    def pop
      _v1 = GLib::Lib.g_markup_parse_context_pop(self)
      return _v1
    end
    def push(parser, user_data = nil)
      _v1 = GLib::MarkupParser.from(parser)
      _v2 = user_data
      GLib::Lib.g_markup_parse_context_push(self, _v1, _v2)
    end
    def ref
      _v1 = GLib::Lib.g_markup_parse_context_ref(self)
      _v2 = GLib::MarkupParseContext.wrap_own(_v1)
      return _v2
    end
    def unref
      GLib::Lib.g_markup_parse_context_unref(self)
    end
    alias_method 'element', 'get_element'
    alias_method 'element_stack', 'get_element_stack'
    alias_method 'position', 'get_position'
    alias_method 'user_data', 'get_user_data'
  end
  # XXX: Don't know how to print flags
  class GLib::MarkupParser < GirFFI::StructBase
  
    def end_element
      _v1 = @struct.to_ptr
      _v2 = GLib::MarkupParser::End_element.get_value_from_pointer(_v1, 8)
      _v2
    end
    def error
      _v1 = @struct.to_ptr
      _v2 = GLib::MarkupParser::Error.get_value_from_pointer(_v1, 32)
      _v2
    end
    def passthrough
      _v1 = @struct.to_ptr
      _v2 = GLib::MarkupParser::Passthrough.get_value_from_pointer(_v1, 24)
      _v2
    end
    def start_element
      _v1 = @struct.to_ptr
      _v2 = GLib::MarkupParser::Start_element.get_value_from_pointer(_v1, 0)
      _v2
    end
    def text
      _v1 = @struct.to_ptr
      _v2 = GLib::MarkupParser::Text.get_value_from_pointer(_v1, 16)
      _v2
    end
  end
  class GLib::MatchInfo < GirFFI::BoxedBase
  
    def expand_references(string_to_expand)
      _v1 = GirFFI::InPointer.from_utf8(string_to_expand)
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_match_info_expand_references(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
      return _v4
    end
    def fetch(match_num)
      _v1 = match_num
      _v2 = GLib::Lib.g_match_info_fetch(self, _v1)
      _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
      return _v3
    end
    def fetch_all
      _v1 = GLib::Lib.g_match_info_fetch_all(self)
      _v2 = GLib::Strv.wrap(_v1)
      return _v2
    end
    def fetch_named(name)
      _v1 = GirFFI::InPointer.from_utf8(name)
      _v2 = GLib::Lib.g_match_info_fetch_named(self, _v1)
      _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
      return _v3
    end
    def fetch_named_pos(name)
      _v1 = GirFFI::InPointer.from_utf8(name)
      _v2 = FFI::MemoryPointer.new(:int32)
      _v3 = FFI::MemoryPointer.new(:int32)
      _v4 = GLib::Lib.g_match_info_fetch_named_pos(self, _v1, _v2, _v3)
      _v5 = _v2.get_int32(0)
      _v6 = _v3.get_int32(0)
      return [_v4, _v5, _v6]
    end
    def fetch_pos(match_num)
      _v1 = match_num
      _v2 = FFI::MemoryPointer.new(:int32)
      _v3 = FFI::MemoryPointer.new(:int32)
      _v4 = GLib::Lib.g_match_info_fetch_pos(self, _v1, _v2, _v3)
      _v5 = _v2.get_int32(0)
      _v6 = _v3.get_int32(0)
      return [_v4, _v5, _v6]
    end
    def free
      GLib::Lib.g_match_info_free(self)
    end
    def get_match_count
      _v1 = GLib::Lib.g_match_info_get_match_count(self)
      return _v1
    end
    def get_regex
      _v1 = GLib::Lib.g_match_info_get_regex(self)
      _v2 = GLib::Regex.wrap_copy(_v1)
      return _v2
    end
    def get_string
      _v1 = GLib::Lib.g_match_info_get_string(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def is_partial_match
      _v1 = GLib::Lib.g_match_info_is_partial_match(self)
      return _v1
    end
    def matches
      _v1 = GLib::Lib.g_match_info_matches(self)
      return _v1
    end
    def next
      _v1 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v2 = GLib::Lib.g_match_info_next(self, _v1)
      GirFFI::ArgHelper.check_error(_v1)
      return _v2
    end
    def ref
      _v1 = GLib::Lib.g_match_info_ref(self)
      _v2 = GLib::MatchInfo.wrap_own(_v1)
      return _v2
    end
    def unref
      GLib::Lib.g_match_info_unref(self)
    end
    alias_method 'match_count', 'get_match_count'
    alias_method 'regex', 'get_regex'
    alias_method 'string', 'get_string'
  end
  class GLib::MemChunk < GirFFI::StructBase
    def self.info
      GLib::Lib.g_mem_chunk_info
    end
    def alloc
      _v1 = GLib::Lib.g_mem_chunk_alloc(self)
      return _v1
    end
    def alloc0
      _v1 = GLib::Lib.g_mem_chunk_alloc0(self)
      return _v1
    end
    def clean
      GLib::Lib.g_mem_chunk_clean(self)
    end
    def destroy
      GLib::Lib.g_mem_chunk_destroy(self)
    end
    def free(mem = nil)
      _v1 = mem
      GLib::Lib.g_mem_chunk_free(self, _v1)
    end
    def print
      GLib::Lib.g_mem_chunk_print(self)
    end
    def reset
      GLib::Lib.g_mem_chunk_reset(self)
    end
  end
  class GLib::MemVTable < GirFFI::StructBase
  
    def calloc
      _v1 = @struct.to_ptr
      _v2 = GLib::MemVTable::Calloc.get_value_from_pointer(_v1, 24)
      _v2
    end
    def free
      _v1 = @struct.to_ptr
      _v2 = GLib::MemVTable::Free.get_value_from_pointer(_v1, 16)
      _v2
    end
    def malloc
      _v1 = @struct.to_ptr
      _v2 = GLib::MemVTable::Malloc.get_value_from_pointer(_v1, 0)
      _v2
    end
    def realloc
      _v1 = @struct.to_ptr
      _v2 = GLib::MemVTable::Realloc.get_value_from_pointer(_v1, 8)
      _v2
    end
    def try_malloc
      _v1 = @struct.to_ptr
      _v2 = GLib::MemVTable::Try_malloc.get_value_from_pointer(_v1, 32)
      _v2
    end
    def try_realloc
      _v1 = @struct.to_ptr
      _v2 = GLib::MemVTable::Try_realloc.get_value_from_pointer(_v1, 40)
      _v2
    end
  end
  # XXX: Don't know how to print union
  class GLib::Node < GirFFI::StructBase
    def self.pop_allocator
      GLib::Lib.g_node_pop_allocator
    end
    def self.push_allocator(allocator)
      _v1 = GLib::Allocator.from(allocator)
      GLib::Lib.g_node_push_allocator(_v1)
    end
    def child_index(data = nil)
      _v1 = data
      _v2 = GLib::Lib.g_node_child_index(self, _v1)
      return _v2
    end
    def child_position(child)
      _v1 = GLib::Node.from(child)
      _v2 = GLib::Lib.g_node_child_position(self, _v1)
      return _v2
    end
    def children
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(32)
      _v3 = GLib::Node.wrap(_v2)
      _v3
    end
    def children=(value)
      _v1 = @struct.to_ptr
      _v2 = GLib::Node.copy_from(value)
      _v1.put_pointer(32, _v2)
    end
    def children_foreach(flags, &func)
      _v1 = flags
      _v2 = GLib::NodeForeachFunc.from(func)
      _v3 = GirFFI::ArgHelper.store(_v2)
      GLib::Lib.g_node_children_foreach(self, _v1, _v2, _v3)
    end
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
    def depth
      _v1 = GLib::Lib.g_node_depth(self)
      return _v1
    end
    def destroy
      GLib::Lib.g_node_destroy(self)
    end
    def is_ancestor(descendant)
      _v1 = GLib::Node.from(descendant)
      _v2 = GLib::Lib.g_node_is_ancestor(self, _v1)
      return _v2
    end
    def max_height
      _v1 = GLib::Lib.g_node_max_height(self)
      return _v1
    end
    def n_children
      _v1 = GLib::Lib.g_node_n_children(self)
      return _v1
    end
    def n_nodes(flags)
      _v1 = flags
      _v2 = GLib::Lib.g_node_n_nodes(self, _v1)
      return _v2
    end
    def next
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(8)
      _v3 = GLib::Node.wrap(_v2)
      _v3
    end
    def next=(value)
      _v1 = @struct.to_ptr
      _v2 = GLib::Node.copy_from(value)
      _v1.put_pointer(8, _v2)
    end
    def parent
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(24)
      _v3 = GLib::Node.wrap(_v2)
      _v3
    end
    def parent=(value)
      _v1 = @struct.to_ptr
      _v2 = GLib::Node.copy_from(value)
      _v1.put_pointer(24, _v2)
    end
    def prev
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(16)
      _v3 = GLib::Node.wrap(_v2)
      _v3
    end
    def prev=(value)
      _v1 = @struct.to_ptr
      _v2 = GLib::Node.copy_from(value)
      _v1.put_pointer(16, _v2)
    end
    def reverse_children
      GLib::Lib.g_node_reverse_children(self)
    end
    def traverse(order, flags, max_depth, &func)
      _v1 = order
      _v2 = flags
      _v3 = max_depth
      _v4 = GLib::NodeTraverseFunc.from(func)
      _v5 = GirFFI::ArgHelper.store(_v4)
      GLib::Lib.g_node_traverse(self, _v1, _v2, _v3, _v4, _v5)
    end
    def unlink
      GLib::Lib.g_node_unlink(self)
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print enum
  # XXX: Don't know how to print enum
  OPTION_REMAINING = ""
  class GLib::Once < GirFFI::StructBase
    def self.init_enter(location)
      _v1 = FFI::MemoryPointer.new(:pointer)
      _v1.put_pointer(0, location)
      _v2 = GLib::Lib.g_once_init_enter(_v1)
      _v3 = _v1.get_pointer(0)
      return [_v2, _v3]
    end
    def self.init_enter_impl(location)
      _v1 = location
      _v2 = GLib::Lib.g_once_init_enter_impl(_v1)
      return _v2
    end
    def self.init_enter_pointer(location)
      _v1 = location
      _v2 = GLib::Lib.g_once_init_enter_pointer(_v1)
      return _v2
    end
    def self.init_leave(location, result)
      _v1 = FFI::MemoryPointer.new(:pointer)
      _v1.put_pointer(0, location)
      _v2 = result
      GLib::Lib.g_once_init_leave(_v1, _v2)
      _v3 = _v1.get_pointer(0)
      return _v3
    end
    def self.init_leave_pointer(location, result = nil)
      _v1 = location
      _v2 = result
      GLib::Lib.g_once_init_leave_pointer(_v1, _v2)
    end
    def retval
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(8)
      _v2
    end
    def retval=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_pointer(8, _v2)
    end
    def status
      _v1 = @struct.to_ptr
      _v2 = GLib::OnceStatus.get_value_from_pointer(_v1, 0)
      _v2
    end
    def status=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      GLib::OnceStatus.copy_value_to_pointer(_v2, _v1)
    end
  end
  # XXX: Don't know how to print enum
  # XXX: Don't know how to print enum
  # XXX: Don't know how to print callback
  class GLib::OptionContext < GirFFI::StructBase
  
    def add_group(group)
      _v1 = GLib::OptionGroup.copy_from(group)
      GLib::Lib.g_option_context_add_group(self, _v1)
    end
    def add_main_entries(entries, translation_domain = nil)
      _v1 = GirFFI::ZeroTerminated.from(GLib::OptionEntry, entries)
      _v2 = GirFFI::InPointer.from_utf8(translation_domain)
      GLib::Lib.g_option_context_add_main_entries(self, _v1, _v2)
    end
    def free
      GLib::Lib.g_option_context_free(self)
    end
    def get_description
      _v1 = GLib::Lib.g_option_context_get_description(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def get_help(main_help, group = nil)
      _v1 = main_help
      _v2 = GLib::OptionGroup.from(group)
      _v3 = GLib::Lib.g_option_context_get_help(self, _v1, _v2)
      _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
      return _v4
    end
    def get_help_enabled
      _v1 = GLib::Lib.g_option_context_get_help_enabled(self)
      return _v1
    end
    def get_ignore_unknown_options
      _v1 = GLib::Lib.g_option_context_get_ignore_unknown_options(self)
      return _v1
    end
    def get_main_group
      _v1 = GLib::Lib.g_option_context_get_main_group(self)
      _v2 = GLib::OptionGroup.wrap_copy(_v1)
      return _v2
    end
    def get_strict_posix
      _v1 = GLib::Lib.g_option_context_get_strict_posix(self)
      return _v1
    end
    def get_summary
      _v1 = GLib::Lib.g_option_context_get_summary(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def parse(argv)
      argc = argv.nil? ? (0) : (argv.length)
      _v1 = FFI::MemoryPointer.new(:int32)
      _v1.put_int32(0, argc)
      _v2 = FFI::MemoryPointer.new(:pointer)
      _v2.put_pointer(0, GirFFI::SizedArray.copy_from(:utf8, -1, argv))
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_option_context_parse(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      _v5 = _v1.get_int32(0)
      _v6 = GirFFI::SizedArray.wrap(:utf8, _v5, _v2.get_pointer(0))
      return [_v4, _v6]
    end
    def parse_strv(arguments)
      _v1 = FFI::MemoryPointer.new(:pointer)
      _v1.put_pointer(0, GLib::Strv.from(arguments))
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_option_context_parse_strv(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      _v4 = GLib::Strv.wrap(_v1.get_pointer(0))
      return [_v3, _v4]
    end
    def set_description(description = nil)
      _v1 = GirFFI::InPointer.from_utf8(description)
      GLib::Lib.g_option_context_set_description(self, _v1)
    end
    def set_help_enabled(help_enabled)
      _v1 = help_enabled
      GLib::Lib.g_option_context_set_help_enabled(self, _v1)
    end
    def set_ignore_unknown_options(ignore_unknown)
      _v1 = ignore_unknown
      GLib::Lib.g_option_context_set_ignore_unknown_options(self, _v1)
    end
    def set_main_group(group)
      _v1 = GLib::OptionGroup.copy_from(group)
      GLib::Lib.g_option_context_set_main_group(self, _v1)
    end
    def set_strict_posix(strict_posix)
      _v1 = strict_posix
      GLib::Lib.g_option_context_set_strict_posix(self, _v1)
    end
    def set_summary(summary = nil)
      _v1 = GirFFI::InPointer.from_utf8(summary)
      GLib::Lib.g_option_context_set_summary(self, _v1)
    end
    def set_translate_func(&func)
      _v1 = GLib::TranslateFunc.from(func)
      _v2 = GirFFI::ArgHelper.store(_v1)
      _v3 = GLib::DestroyNotify.default
      GLib::Lib.g_option_context_set_translate_func(self, _v1, _v2, _v3)
    end
    def set_translation_domain(domain)
      _v1 = GirFFI::InPointer.from_utf8(domain)
      GLib::Lib.g_option_context_set_translation_domain(self, _v1)
    end
    alias_method 'description', 'get_description'
    alias_method 'description=', 'set_description'
    alias_method 'help', 'get_help'
    alias_method 'help_enabled', 'get_help_enabled'
    alias_method 'help_enabled=', 'set_help_enabled'
    alias_method 'ignore_unknown_options', 'get_ignore_unknown_options'
    alias_method 'ignore_unknown_options=', 'set_ignore_unknown_options'
    alias_method 'main_group', 'get_main_group'
    alias_method 'main_group=', 'set_main_group'
    alias_method 'strict_posix', 'get_strict_posix'
    alias_method 'strict_posix=', 'set_strict_posix'
    alias_method 'summary', 'get_summary'
    alias_method 'summary=', 'set_summary'
    alias_method 'translation_domain=', 'set_translation_domain'
  end
  class GLib::OptionEntry < GirFFI::StructBase
  
    def arg
      _v1 = @struct.to_ptr
      _v2 = GLib::OptionArg.get_value_from_pointer(_v1, 16)
      _v2
    end
    def arg=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      GLib::OptionArg.copy_value_to_pointer(_v2, _v1, 16)
    end
    def arg_data
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(24)
      _v2
    end
    def arg_data=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_pointer(24, _v2)
    end
    def arg_description
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(40)
      _v3 = _v2.to_utf8
      _v3
    end
    def arg_description=(value)
      _v1 = @struct.to_ptr
      _v2 = GirFFI::InPointer.from_utf8(value)
      _v1.put_pointer(40, _v2)
    end
    def description
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(32)
      _v3 = _v2.to_utf8
      _v3
    end
    def description=(value)
      _v1 = @struct.to_ptr
      _v2 = GirFFI::InPointer.from_utf8(value)
      _v1.put_pointer(32, _v2)
    end
    def flags
      _v1 = @struct.to_ptr
      _v2 = _v1.get_int32(12)
      _v2
    end
    def flags=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_int32(12, _v2)
    end
    def long_name
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(0)
      _v3 = _v2.to_utf8
      _v3
    end
    def long_name=(value)
      _v1 = @struct.to_ptr
      _v2 = GirFFI::InPointer.from_utf8(value)
      _v1.put_pointer(0, _v2)
    end
    def short_name
      _v1 = @struct.to_ptr
      _v2 = _v1.get_int8(8)
      _v2
    end
    def short_name=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_int8(8, _v2)
    end
  end
  # XXX: Don't know how to print enum
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print flags
  class GLib::OptionGroup < GirFFI::BoxedBase
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def add_entries(entries)
      _v1 = GirFFI::ZeroTerminated.from(GLib::OptionEntry, entries)
      GLib::Lib.g_option_group_add_entries(self, _v1)
    end
    def free
      GLib::Lib.g_option_group_free(self)
    end
    def ref
      _v1 = GLib::Lib.g_option_group_ref(self)
      _v2 = GLib::OptionGroup.wrap_own(_v1)
      return _v2
    end
    def set_translate_func(&func)
      _v1 = GLib::TranslateFunc.from(func)
      _v2 = GirFFI::ArgHelper.store(_v1)
      _v3 = GLib::DestroyNotify.default
      GLib::Lib.g_option_group_set_translate_func(self, _v1, _v2, _v3)
    end
    def set_translation_domain(domain)
      _v1 = GirFFI::InPointer.from_utf8(domain)
      GLib::Lib.g_option_group_set_translation_domain(self, _v1)
    end
    def unref
      GLib::Lib.g_option_group_unref(self)
    end
    alias_method 'translation_domain=', 'set_translation_domain'
  end
  # XXX: Don't know how to print callback
  PDP_ENDIAN = 3412
  PI = 3.141593
  PID_FORMAT = "i"
  PI_2 = 1.570796
  PI_4 = 0.785398
  POLLFD_FORMAT = "%d"
  PRIORITY_DEFAULT = 0
  PRIORITY_DEFAULT_IDLE = 200
  PRIORITY_HIGH = -100
  PRIORITY_HIGH_IDLE = 100
  PRIORITY_LOW = 300
  class GLib::PathBuf < GirFFI::StructBase
    def self.equal(v1, v2)
      _v1 = v1
      _v2 = v2
      _v3 = GLib::Lib.g_path_buf_equal(_v1, _v2)
      return _v3
    end
    def clear
      GLib::Lib.g_path_buf_clear(self)
    end
    def clear_to_path
      _v1 = GLib::Lib.g_path_buf_clear_to_path(self)
      _v2 = GirFFI::AllocationHelper.free_after(_v1, &:to_utf8)
      return _v2
    end
    def dummy
      _v1 = @struct.to_ptr
      _v2 = GirFFI::SizedArray.get_value_from_pointer(_v1, 0)
      _v3 = GirFFI::SizedArray.wrap([:pointer, :void], 8, _v2)
      _v3
    end
    def free
      GLib::Lib.g_path_buf_free(self)
    end
    def free_to_path
      _v1 = GLib::Lib.g_path_buf_free_to_path(self)
      _v2 = GirFFI::AllocationHelper.free_after(_v1, &:to_utf8)
      return _v2
    end
    def init
      _v1 = GLib::Lib.g_path_buf_init(self)
      _v2 = GLib::PathBuf.wrap_copy(_v1)
      return _v2
    end
    def init_from_path(path = nil)
      _v1 = path
      _v2 = GLib::Lib.g_path_buf_init_from_path(self, _v1)
      _v3 = GLib::PathBuf.wrap_copy(_v2)
      return _v3
    end
    def pop
      _v1 = GLib::Lib.g_path_buf_pop(self)
      return _v1
    end
    def push(path)
      _v1 = path
      _v2 = GLib::Lib.g_path_buf_push(self, _v1)
      _v3 = GLib::PathBuf.wrap_copy(_v2)
      return _v3
    end
    def set_extension(extension = nil)
      _v1 = extension
      _v2 = GLib::Lib.g_path_buf_set_extension(self, _v1)
      return _v2
    end
    def set_filename(file_name)
      _v1 = file_name
      _v2 = GLib::Lib.g_path_buf_set_filename(self, _v1)
      return _v2
    end
    def to_path
      _v1 = GLib::Lib.g_path_buf_to_path(self)
      _v2 = GirFFI::AllocationHelper.free_after(_v1, &:to_utf8)
      return _v2
    end
    alias_method 'extension=', 'set_extension'
    alias_method 'filename=', 'set_filename'
  end
  class GLib::PatternSpec < GirFFI::BoxedBase
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def copy
      _v1 = GLib::Lib.g_pattern_spec_copy(self)
      _v2 = GLib::PatternSpec.wrap_own(_v1)
      return _v2
    end
    def equal(pspec2)
      _v1 = GLib::PatternSpec.from(pspec2)
      _v2 = GLib::Lib.g_pattern_spec_equal(self, _v1)
      return _v2
    end
    def free
      GLib::Lib.g_pattern_spec_free(self)
    end
    def match(string_length, string, string_reversed = nil)
      _v1 = string_length
      _v2 = GirFFI::InPointer.from_utf8(string)
      _v3 = GirFFI::InPointer.from_utf8(string_reversed)
      _v4 = GLib::Lib.g_pattern_spec_match(self, _v1, _v2, _v3)
      return _v4
    end
    def match_string(string)
      _v1 = GirFFI::InPointer.from_utf8(string)
      _v2 = GLib::Lib.g_pattern_spec_match_string(self, _v1)
      return _v2
    end
  end
  class GLib::PollFD < GirFFI::BoxedBase
  
    def events
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint16(4)
      _v2
    end
    def events=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint16(4, _v2)
    end
    def fd
      _v1 = @struct.to_ptr
      _v2 = _v1.get_int32(0)
      _v2
    end
    def fd=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_int32(0, _v2)
    end
    def revents
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint16(6)
      _v2
    end
    def revents=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint16(6, _v2)
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  class GLib::Private < GirFFI::StructBase
  
    def future
      _v1 = @struct.to_ptr
      _v2 = GirFFI::SizedArray.get_value_from_pointer(_v1, 16)
      _v3 = GirFFI::SizedArray.wrap([:pointer, :void], 2, _v2)
      _v3
    end
    def get
      _v1 = GLib::Lib.g_private_get(self)
      return _v1
    end
    def notify
      _v1 = @struct.to_ptr
      _v2 = GLib::DestroyNotify.get_value_from_pointer(_v1, 8)
      _v2
    end
    def p
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(0)
      _v2
    end
    def replace(value = nil)
      _v1 = value
      GLib::Lib.g_private_replace(self, _v1)
    end
    def set(value = nil)
      _v1 = value
      GLib::Lib.g_private_set(self, _v1)
    end
  end
  class GLib::PtrArray < GirFFI::BoxedBase
    def self.add(array, data)
      array.add(data)
    end
    def self.from_enumerable(type, arr)
      new(type).tap { |it| it.add_array(arr) }
    end
    def ==(other)
      (to_a == other.to_a)
    end
    def add(data)
      ptr = GirFFI::InPointer.from(element_type, data)
      Lib.g_ptr_array_add(self, ptr)
    end
    def add_array(ary)
      ary.each { |item| add(item) }
    end
    def each
      length.times { |idx| yield(index(idx)) }
    end
    # Re-implementation of the g_ptrarray_index macro
    def index(idx)
      item_ptr = item_pointer(idx)
      convertor = GirFFI::ArrayElementConvertor.new(convert_element_type, item_ptr)
      convertor.to_ruby_value
    end
    def len
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(8)
      _v2
    end
    def len=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(8, _v2)
    end
    def length
      struct[:len]
    end
    def pdata
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(0)
      _v2
    end
    def pdata=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_pointer(0, _v2)
    end
    def reset_typespec(typespec)
      @element_type = typespec
      self
    end
  end
  class GLib::Queue < GirFFI::StructBase
  
    def clear
      GLib::Lib.g_queue_clear(self)
    end
    def clear_full(&free_func)
      _v1 = GLib::DestroyNotify.from(free_func)
      GLib::Lib.g_queue_clear_full(self, _v1)
    end
    def foreach(&func)
      _v1 = GLib::Func.from(func)
      _v2 = GirFFI::ArgHelper.store(_v1)
      GLib::Lib.g_queue_foreach(self, _v1, _v2)
    end
    def free
      GLib::Lib.g_queue_free(self)
    end
    def free_full(&free_func)
      _v1 = GLib::DestroyNotify.from(free_func)
      GLib::Lib.g_queue_free_full(self, _v1)
    end
    def get_length
      _v1 = GLib::Lib.g_queue_get_length(self)
      return _v1
    end
    def head
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(0)
      _v3 = GLib::List.wrap([:pointer, :void], _v2)
      _v3
    end
    def head=(value)
      _v1 = @struct.to_ptr
      _v2 = GLib::List.from([:pointer, :void], value)
      _v1.put_pointer(0, _v2)
    end
    def index(data = nil)
      _v1 = data
      _v2 = GLib::Lib.g_queue_index(self, _v1)
      return _v2
    end
    def init
      GLib::Lib.g_queue_init(self)
    end
    def insert_sorted(data = nil, &func)
      _v1 = data
      _v2 = GLib::CompareDataFunc.from(func)
      _v3 = GirFFI::ArgHelper.store(_v2)
      GLib::Lib.g_queue_insert_sorted(self, _v1, _v2, _v3)
    end
    def is_empty
      _v1 = GLib::Lib.g_queue_is_empty(self)
      return _v1
    end
    def length
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(16)
      _v2
    end
    def length=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(16, _v2)
    end
    def peek_head
      _v1 = GLib::Lib.g_queue_peek_head(self)
      return _v1
    end
    def peek_nth(n)
      _v1 = n
      _v2 = GLib::Lib.g_queue_peek_nth(self, _v1)
      return _v2
    end
    def peek_tail
      _v1 = GLib::Lib.g_queue_peek_tail(self)
      return _v1
    end
    def pop_head
      _v1 = GLib::Lib.g_queue_pop_head(self)
      return _v1
    end
    def pop_nth(n)
      _v1 = n
      _v2 = GLib::Lib.g_queue_pop_nth(self, _v1)
      return _v2
    end
    def pop_tail
      _v1 = GLib::Lib.g_queue_pop_tail(self)
      return _v1
    end
    def push_head(data = nil)
      _v1 = data
      GLib::Lib.g_queue_push_head(self, _v1)
    end
    def push_nth(data, n)
      _v1 = data
      _v2 = n
      GLib::Lib.g_queue_push_nth(self, _v1, _v2)
    end
    def push_tail(data = nil)
      _v1 = data
      GLib::Lib.g_queue_push_tail(self, _v1)
    end
    def remove(data = nil)
      _v1 = data
      _v2 = GLib::Lib.g_queue_remove(self, _v1)
      return _v2
    end
    def remove_all(data = nil)
      _v1 = data
      _v2 = GLib::Lib.g_queue_remove_all(self, _v1)
      return _v2
    end
    def reverse
      GLib::Lib.g_queue_reverse(self)
    end
    def sort(&compare_func)
      _v1 = GLib::CompareDataFunc.from(compare_func)
      _v2 = GirFFI::ArgHelper.store(_v1)
      GLib::Lib.g_queue_sort(self, _v1, _v2)
    end
    def tail
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(8)
      _v3 = GLib::List.wrap([:pointer, :void], _v2)
      _v3
    end
    def tail=(value)
      _v1 = @struct.to_ptr
      _v2 = GLib::List.from([:pointer, :void], value)
      _v1.put_pointer(8, _v2)
    end
  end
  REF_COUNT_INIT = -1
  class GLib::RWLock < GirFFI::StructBase
  
    def clear
      GLib::Lib.g_rw_lock_clear(self)
    end
    def i
      _v1 = @struct.to_ptr
      _v2 = GirFFI::SizedArray.get_value_from_pointer(_v1, 8)
      _v3 = GirFFI::SizedArray.wrap(:guint32, 2, _v2)
      _v3
    end
    def init
      GLib::Lib.g_rw_lock_init(self)
    end
    def p
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(0)
      _v2
    end
    def reader_lock
      GLib::Lib.g_rw_lock_reader_lock(self)
    end
    def reader_trylock
      _v1 = GLib::Lib.g_rw_lock_reader_trylock(self)
      return _v1
    end
    def reader_unlock
      GLib::Lib.g_rw_lock_reader_unlock(self)
    end
    def writer_lock
      GLib::Lib.g_rw_lock_writer_lock(self)
    end
    def writer_trylock
      _v1 = GLib::Lib.g_rw_lock_writer_trylock(self)
      return _v1
    end
    def writer_unlock
      GLib::Lib.g_rw_lock_writer_unlock(self)
    end
  end
  class GLib::Rand < GirFFI::BoxedBase
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def self.new_with_seed(*args, &block)
      raise(NoMethodError) unless (self == GLib::Rand)
      obj = allocate
      obj.__send__(:initialize_with_seed, *args, &block)
      obj
    end
    def self.new_with_seed_array(*args, &block)
      raise(NoMethodError) unless (self == GLib::Rand)
      obj = allocate
      obj.__send__(:initialize_with_seed_array, *args, &block)
      obj
    end
    def copy
      _v1 = GLib::Lib.g_rand_copy(self)
      _v2 = GLib::Rand.wrap_own(_v1)
      return _v2
    end
    def double
      _v1 = GLib::Lib.g_rand_double(self)
      return _v1
    end
    def double_range(begin_, end_)
      _v1 = begin_
      _v2 = end_
      _v3 = GLib::Lib.g_rand_double_range(self, _v1, _v2)
      return _v3
    end
    def free
      GLib::Lib.g_rand_free(self)
    end
    def initialize_with_seed(seed)
      _v1 = seed
      _v2 = GLib::Lib.g_rand_new_with_seed(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_with_seed_array(seed, seed_length)
      _v1 = seed
      _v2 = seed_length
      _v3 = GLib::Lib.g_rand_new_with_seed_array(_v1, _v2)
      store_pointer(_v3)
      @struct.owned = true
    end
    def int
      _v1 = GLib::Lib.g_rand_int(self)
      return _v1
    end
    def int_range(begin_, end_)
      _v1 = begin_
      _v2 = end_
      _v3 = GLib::Lib.g_rand_int_range(self, _v1, _v2)
      return _v3
    end
    def set_seed(seed)
      _v1 = seed
      GLib::Lib.g_rand_set_seed(self, _v1)
    end
    def set_seed_array(seed, seed_length)
      _v1 = seed
      _v2 = seed_length
      GLib::Lib.g_rand_set_seed_array(self, _v1, _v2)
    end
    alias_method 'seed=', 'set_seed'
  end
  class GLib::RecMutex < GirFFI::StructBase
  
    def clear
      GLib::Lib.g_rec_mutex_clear(self)
    end
    def i
      _v1 = @struct.to_ptr
      _v2 = GirFFI::SizedArray.get_value_from_pointer(_v1, 8)
      _v3 = GirFFI::SizedArray.wrap(:guint32, 2, _v2)
      _v3
    end
    def init
      GLib::Lib.g_rec_mutex_init(self)
    end
    def lock
      GLib::Lib.g_rec_mutex_lock(self)
    end
    def p
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(0)
      _v2
    end
    def trylock
      _v1 = GLib::Lib.g_rec_mutex_trylock(self)
      return _v1
    end
    def unlock
      GLib::Lib.g_rec_mutex_unlock(self)
    end
  end
  class GLib::Regex < GirFFI::BoxedBase
    def self.check_replacement(replacement)
      _v1 = GirFFI::InPointer.from_utf8(replacement)
      _v2 = FFI::MemoryPointer.new(GirFFI::Boolean)
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_regex_check_replacement(_v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      _v5 = GirFFI::Boolean.get_value_from_pointer(_v2, 0)
      return [_v4, _v5]
    end
    def self.error_quark
      _v1 = GLib::Lib.g_regex_error_quark
      return _v1
    end
    def self.escape_nul(string, length)
      _v1 = GirFFI::InPointer.from_utf8(string)
      _v2 = length
      _v3 = GLib::Lib.g_regex_escape_nul(_v1, _v2)
      _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
      return _v4
    end
    def self.escape_string(string, length)
      _v1 = GirFFI::InPointer.from_utf8(string)
      _v2 = length
      _v3 = GLib::Lib.g_regex_escape_string(_v1, _v2)
      _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
      return _v4
    end
    def self.match_simple(pattern, string, compile_options, match_options)
      _v1 = GirFFI::InPointer.from_utf8(pattern)
      _v2 = GirFFI::InPointer.from_utf8(string)
      _v3 = compile_options
      _v4 = match_options
      _v5 = GLib::Lib.g_regex_match_simple(_v1, _v2, _v3, _v4)
      return _v5
    end
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def self.split_simple(pattern, string, compile_options, match_options)
      _v1 = GirFFI::InPointer.from_utf8(pattern)
      _v2 = GirFFI::InPointer.from_utf8(string)
      _v3 = compile_options
      _v4 = match_options
      _v5 = GLib::Lib.g_regex_split_simple(_v1, _v2, _v3, _v4)
      _v6 = GLib::Strv.wrap(_v5)
      return _v6
    end
    def get_capture_count
      _v1 = GLib::Lib.g_regex_get_capture_count(self)
      return _v1
    end
    def get_compile_flags
      _v1 = GLib::Lib.g_regex_get_compile_flags(self)
      return _v1
    end
    def get_has_cr_or_lf
      _v1 = GLib::Lib.g_regex_get_has_cr_or_lf(self)
      return _v1
    end
    def get_match_flags
      _v1 = GLib::Lib.g_regex_get_match_flags(self)
      return _v1
    end
    def get_max_backref
      _v1 = GLib::Lib.g_regex_get_max_backref(self)
      return _v1
    end
    def get_max_lookbehind
      _v1 = GLib::Lib.g_regex_get_max_lookbehind(self)
      return _v1
    end
    def get_pattern
      _v1 = GLib::Lib.g_regex_get_pattern(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def get_string_number(name)
      _v1 = GirFFI::InPointer.from_utf8(name)
      _v2 = GLib::Lib.g_regex_get_string_number(self, _v1)
      return _v2
    end
    def match(string, match_options)
      _v1 = GirFFI::InPointer.from_utf8(string)
      _v2 = match_options
      _v3 = FFI::MemoryPointer.new(:pointer)
      _v4 = GLib::Lib.g_regex_match(self, _v1, _v2, _v3)
      _v5 = GLib::MatchInfo.wrap_own(_v3.get_pointer(0))
      return [_v4, _v5]
    end
    def match_all(string, match_options)
      _v1 = GirFFI::InPointer.from_utf8(string)
      _v2 = match_options
      _v3 = FFI::MemoryPointer.new(:pointer)
      _v4 = GLib::Lib.g_regex_match_all(self, _v1, _v2, _v3)
      _v5 = GLib::MatchInfo.wrap_own(_v3.get_pointer(0))
      return [_v4, _v5]
    end
    def match_all_full(string, start_position, match_options)
      string_len = string.nil? ? (0) : (string.length)
      _v1 = string_len
      _v2 = start_position
      _v3 = match_options
      _v4 = FFI::MemoryPointer.new(:pointer)
      _v5 = GirFFI::SizedArray.from(:utf8, -1, string)
      _v6 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v7 = GLib::Lib.g_regex_match_all_full(self, _v5, _v1, _v2, _v3, _v4, _v6)
      GirFFI::ArgHelper.check_error(_v6)
      _v8 = GLib::MatchInfo.wrap_own(_v4.get_pointer(0))
      return [_v7, _v8]
    end
    def match_full(string, start_position, match_options)
      string_len = string.nil? ? (0) : (string.length)
      _v1 = string_len
      _v2 = start_position
      _v3 = match_options
      _v4 = FFI::MemoryPointer.new(:pointer)
      _v5 = GirFFI::SizedArray.from(:utf8, -1, string)
      _v6 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v7 = GLib::Lib.g_regex_match_full(self, _v5, _v1, _v2, _v3, _v4, _v6)
      GirFFI::ArgHelper.check_error(_v6)
      _v8 = GLib::MatchInfo.wrap_own(_v4.get_pointer(0))
      return [_v7, _v8]
    end
    def ref
      _v1 = GLib::Lib.g_regex_ref(self)
      _v2 = GLib::Regex.wrap_own(_v1)
      return _v2
    end
    def replace(string, start_position, replacement, match_options)
      string_len = string.nil? ? (0) : (string.length)
      _v1 = string_len
      _v2 = start_position
      _v3 = GirFFI::InPointer.from_utf8(replacement)
      _v4 = match_options
      _v5 = GirFFI::SizedArray.from(:utf8, -1, string)
      _v6 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v7 = GLib::Lib.g_regex_replace(self, _v5, _v1, _v2, _v3, _v4, _v6)
      GirFFI::ArgHelper.check_error(_v6)
      _v8 = GirFFI::AllocationHelper.free_after(_v7, &:to_utf8)
      return _v8
    end
    def replace_eval(string, start_position, match_options, &eval)
      string_len = string.nil? ? (0) : (string.length)
      _v1 = string_len
      _v2 = start_position
      _v3 = match_options
      _v4 = GLib::RegexEvalCallback.from(eval)
      _v5 = GirFFI::ArgHelper.store(_v4)
      _v6 = GirFFI::SizedArray.from(:utf8, -1, string)
      _v7 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v8 = GLib::Lib.g_regex_replace_eval(self, _v6, _v1, _v2, _v3, _v4, _v5, _v7)
      GirFFI::ArgHelper.check_error(_v7)
      _v9 = GirFFI::AllocationHelper.free_after(_v8, &:to_utf8)
      return _v9
    end
    def replace_literal(string, start_position, replacement, match_options)
      string_len = string.nil? ? (0) : (string.length)
      _v1 = string_len
      _v2 = start_position
      _v3 = GirFFI::InPointer.from_utf8(replacement)
      _v4 = match_options
      _v5 = GirFFI::SizedArray.from(:utf8, -1, string)
      _v6 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v7 = GLib::Lib.g_regex_replace_literal(self, _v5, _v1, _v2, _v3, _v4, _v6)
      GirFFI::ArgHelper.check_error(_v6)
      _v8 = GirFFI::AllocationHelper.free_after(_v7, &:to_utf8)
      return _v8
    end
    def split(string, match_options)
      _v1 = GirFFI::InPointer.from_utf8(string)
      _v2 = match_options
      _v3 = GLib::Lib.g_regex_split(self, _v1, _v2)
      _v4 = GLib::Strv.wrap(_v3)
      return _v4
    end
    def split_full(string, start_position, match_options, max_tokens)
      string_len = string.nil? ? (0) : (string.length)
      _v1 = string_len
      _v2 = start_position
      _v3 = match_options
      _v4 = max_tokens
      _v5 = GirFFI::SizedArray.from(:utf8, -1, string)
      _v6 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v7 = GLib::Lib.g_regex_split_full(self, _v5, _v1, _v2, _v3, _v4, _v6)
      GirFFI::ArgHelper.check_error(_v6)
      _v8 = GLib::Strv.wrap(_v7)
      return _v8
    end
    def unref
      GLib::Lib.g_regex_unref(self)
    end
    alias_method 'capture_count', 'get_capture_count'
    alias_method 'compile_flags', 'get_compile_flags'
    alias_method 'has_cr_or_lf', 'get_has_cr_or_lf'
    alias_method 'match_flags', 'get_match_flags'
    alias_method 'max_backref', 'get_max_backref'
    alias_method 'max_lookbehind', 'get_max_lookbehind'
    alias_method 'pattern', 'get_pattern'
    alias_method 'string_number', 'get_string_number'
  end
  # XXX: Don't know how to print flags
  # XXX: Don't know how to print enum
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print flags
  class GLib::Relation < GirFFI::StructBase
  
    def count(key, field)
      _v1 = key
      _v2 = field
      _v3 = GLib::Lib.g_relation_count(self, _v1, _v2)
      return _v3
    end
    def delete(key, field)
      _v1 = key
      _v2 = field
      _v3 = GLib::Lib.g_relation_delete(self, _v1, _v2)
      return _v3
    end
    def destroy
      GLib::Lib.g_relation_destroy(self)
    end
    def print
      GLib::Lib.g_relation_print(self)
    end
  end
  SEARCHPATH_SEPARATOR = 58
  SEARCHPATH_SEPARATOR_S = ":"
  SIZEOF_LONG = 8
  SIZEOF_SIZE_T = 8
  SIZEOF_SSIZE_T = 8
  SIZEOF_VOID_P = 8
  class GLib::SList < GirFFI::StructBase
    def self.pop_allocator
      GLib::Lib.g_slist_pop_allocator
    end
    def self.push_allocator(allocator)
      _v1 = GLib::Allocator.from(allocator)
      GLib::Lib.g_slist_push_allocator(_v1)
    end
    def append(data)
      store_pointer(Lib.g_slist_append(self, element_ptr_for(data)))
      self
    end
    def data=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_pointer(0, _v2)
    end
    def next=(value)
      _v1 = @struct.to_ptr
      _v2 = GLib::SList.from([:pointer, :void], value)
      _v1.put_pointer(8, _v2)
    end
    def prepend(data)
      store_pointer(Lib.g_slist_prepend(self, element_ptr_for(data)))
      self
    end
    def reverse
      store_pointer(Lib.g_slist_reverse(self))
      self
    end
    alias_method 'data', 'head'
    alias_method 'next', 'tail'
  end
  SOURCE_CONTINUE = true
  SOURCE_REMOVE = false
  SQRT2 = 1.414214
  STR_DELIMITERS = "_-|> <."
  SYSDEF_AF_INET = 2
  SYSDEF_AF_INET6 = 10
  SYSDEF_AF_UNIX = 1
  SYSDEF_MSG_DONTROUTE = 4
  SYSDEF_MSG_OOB = 1
  SYSDEF_MSG_PEEK = 2
  class GLib::Scanner < GirFFI::StructBase
  
    def buffer
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(120)
      _v3 = _v2.to_utf8
      _v3
    end
    def config
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(32)
      _v3 = GLib::ScannerConfig.wrap(_v2)
      _v3
    end
    def config=(value)
      _v1 = @struct.to_ptr
      _v2 = GLib::ScannerConfig.copy_from(value)
      _v1.put_pointer(32, _v2)
    end
    def cur_line
      _v1 = GLib::Lib.g_scanner_cur_line(self)
      return _v1
    end
    def cur_position
      _v1 = GLib::Lib.g_scanner_cur_position(self)
      return _v1
    end
    def cur_token
      _v1 = GLib::Lib.g_scanner_cur_token(self)
      return _v1
    end
    def destroy
      GLib::Lib.g_scanner_destroy(self)
    end
    def eof
      _v1 = GLib::Lib.g_scanner_eof(self)
      return _v1
    end
    def get_next_token
      _v1 = GLib::Lib.g_scanner_get_next_token(self)
      return _v1
    end
    def input_fd
      _v1 = @struct.to_ptr
      _v2 = _v1.get_int32(96)
      _v2
    end
    def input_file(input_fd)
      _v1 = input_fd
      GLib::Lib.g_scanner_input_file(self, _v1)
    end
    def input_name
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(16)
      _v3 = _v2.to_utf8
      _v3
    end
    def input_name=(value)
      _v1 = @struct.to_ptr
      _v2 = GirFFI::InPointer.from_utf8(value)
      _v1.put_pointer(16, _v2)
    end
    def input_text(text, text_len)
      _v1 = GirFFI::InPointer.from_utf8(text)
      _v2 = text_len
      GLib::Lib.g_scanner_input_text(self, _v1, _v2)
    end
    def line
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(56)
      _v2
    end
    def line=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(56, _v2)
    end
    def lookup_symbol(symbol)
      _v1 = GirFFI::InPointer.from_utf8(symbol)
      _v2 = GLib::Lib.g_scanner_lookup_symbol(self, _v1)
      return _v2
    end
    def max_parse_errors
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(8)
      _v2
    end
    def max_parse_errors=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(8, _v2)
    end
    def msg_handler
      _v1 = @struct.to_ptr
      _v2 = GLib::ScannerMsgFunc.get_value_from_pointer(_v1, 136)
      _v2
    end
    def msg_handler=(value)
      _v1 = @struct.to_ptr
      _v2 = GLib::ScannerMsgFunc.from(value)
      GLib::ScannerMsgFunc.copy_value_to_pointer(_v2, _v1, 136)
    end
    def next_line
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(80)
      _v2
    end
    def next_line=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(80, _v2)
    end
    def next_position
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(84)
      _v2
    end
    def next_position=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(84, _v2)
    end
    def next_token
      _v1 = @struct.to_ptr
      _v2 = GLib::TokenType.get_value_from_pointer(_v1, 64)
      _v2
    end
    def next_token=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      GLib::TokenType.copy_value_to_pointer(_v2, _v1, 64)
    end
    def next_value
      _v1 = @struct.to_ptr
      _v2 = GLib::TokenValue.get_value_from_pointer(_v1, 72)
      _v3 = GLib::TokenValue.wrap(_v2)
      _v3
    end
    def next_value=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      GLib::TokenValue.copy_value_to_pointer(_v2, _v1, 72)
    end
    def parse_errors
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(12)
      _v2
    end
    def parse_errors=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(12, _v2)
    end
    def peek_next_token
      _v1 = GLib::Lib.g_scanner_peek_next_token(self)
      return _v1
    end
    def position
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(60)
      _v2
    end
    def position=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(60, _v2)
    end
    def scope_add_symbol(scope_id, symbol, value = nil)
      _v1 = scope_id
      _v2 = GirFFI::InPointer.from_utf8(symbol)
      _v3 = value
      GLib::Lib.g_scanner_scope_add_symbol(self, _v1, _v2, _v3)
    end
    def scope_foreach_symbol(scope_id, &func)
      _v1 = scope_id
      _v2 = GLib::HFunc.from(func)
      _v3 = GirFFI::ArgHelper.store(_v2)
      GLib::Lib.g_scanner_scope_foreach_symbol(self, _v1, _v2, _v3)
    end
    def scope_id
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(128)
      _v2
    end
    def scope_lookup_symbol(scope_id, symbol)
      _v1 = scope_id
      _v2 = GirFFI::InPointer.from_utf8(symbol)
      _v3 = GLib::Lib.g_scanner_scope_lookup_symbol(self, _v1, _v2)
      return _v3
    end
    def scope_remove_symbol(scope_id, symbol)
      _v1 = scope_id
      _v2 = GirFFI::InPointer.from_utf8(symbol)
      GLib::Lib.g_scanner_scope_remove_symbol(self, _v1, _v2)
    end
    def set_scope(scope_id)
      _v1 = scope_id
      _v2 = GLib::Lib.g_scanner_set_scope(self, _v1)
      return _v2
    end
    def symbol_table
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(88)
      _v3 = GLib::HashTable.wrap([[:pointer, :void], [:pointer, :void]], _v2)
      _v3
    end
    def sync_file_offset
      GLib::Lib.g_scanner_sync_file_offset(self)
    end
    def text
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(104)
      _v3 = _v2.to_utf8
      _v3
    end
    def text_end
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(112)
      _v3 = _v2.to_utf8
      _v3
    end
    def token
      _v1 = @struct.to_ptr
      _v2 = GLib::TokenType.get_value_from_pointer(_v1, 40)
      _v2
    end
    def token=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      GLib::TokenType.copy_value_to_pointer(_v2, _v1, 40)
    end
    def unexp_token(expected_token, identifier_spec, symbol_spec, symbol_name, message, is_error)
      _v1 = expected_token
      _v2 = GirFFI::InPointer.from_utf8(identifier_spec)
      _v3 = GirFFI::InPointer.from_utf8(symbol_spec)
      _v4 = GirFFI::InPointer.from_utf8(symbol_name)
      _v5 = GirFFI::InPointer.from_utf8(message)
      _v6 = is_error
      GLib::Lib.g_scanner_unexp_token(self, _v1, _v2, _v3, _v4, _v5, _v6)
    end
    def user_data
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(0)
      _v2
    end
    def user_data=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_pointer(0, _v2)
    end
    def value
      _v1 = @struct.to_ptr
      _v2 = GLib::TokenValue.get_value_from_pointer(_v1, 48)
      _v3 = GLib::TokenValue.wrap(_v2)
      _v3
    end
    def value=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      GLib::TokenValue.copy_value_to_pointer(_v2, _v1, 48)
    end
    alias_method 'scope=', 'set_scope'
  end
  class GLib::ScannerConfig < GirFFI::StructBase
  
    def case_sensitive
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(32)
      _v2
    end
    def case_sensitive=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(32, _v2)
    end
    def char_2_token
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(104)
      _v2
    end
    def char_2_token=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(104, _v2)
    end
    def cpair_comment_single
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(24)
      _v3 = _v2.to_utf8
      _v3
    end
    def cpair_comment_single=(value)
      _v1 = @struct.to_ptr
      _v2 = GirFFI::InPointer.from_utf8(value)
      _v1.put_pointer(24, _v2)
    end
    def cset_identifier_first
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(8)
      _v3 = _v2.to_utf8
      _v3
    end
    def cset_identifier_first=(value)
      _v1 = @struct.to_ptr
      _v2 = GirFFI::InPointer.from_utf8(value)
      _v1.put_pointer(8, _v2)
    end
    def cset_identifier_nth
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(16)
      _v3 = _v2.to_utf8
      _v3
    end
    def cset_identifier_nth=(value)
      _v1 = @struct.to_ptr
      _v2 = GirFFI::InPointer.from_utf8(value)
      _v1.put_pointer(16, _v2)
    end
    def cset_skip_characters
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(0)
      _v3 = _v2.to_utf8
      _v3
    end
    def cset_skip_characters=(value)
      _v1 = @struct.to_ptr
      _v2 = GirFFI::InPointer.from_utf8(value)
      _v1.put_pointer(0, _v2)
    end
    def identifier_2_string
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(100)
      _v2
    end
    def identifier_2_string=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(100, _v2)
    end
    def int_2_float
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(96)
      _v2
    end
    def int_2_float=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(96, _v2)
    end
    def numbers_2_int
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(92)
      _v2
    end
    def numbers_2_int=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(92, _v2)
    end
    def padding_dummy
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(120)
      _v2
    end
    def scan_binary
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(64)
      _v2
    end
    def scan_binary=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(64, _v2)
    end
    def scan_comment_multi
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(44)
      _v2
    end
    def scan_comment_multi=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(44, _v2)
    end
    def scan_float
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(72)
      _v2
    end
    def scan_float=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(72, _v2)
    end
    def scan_hex
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(76)
      _v2
    end
    def scan_hex=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(76, _v2)
    end
    def scan_hex_dollar
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(80)
      _v2
    end
    def scan_hex_dollar=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(80, _v2)
    end
    def scan_identifier
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(48)
      _v2
    end
    def scan_identifier=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(48, _v2)
    end
    def scan_identifier_1char
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(52)
      _v2
    end
    def scan_identifier_1char=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(52, _v2)
    end
    def scan_identifier_NULL
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(56)
      _v2
    end
    def scan_identifier_NULL=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(56, _v2)
    end
    def scan_octal
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(68)
      _v2
    end
    def scan_octal=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(68, _v2)
    end
    def scan_string_dq
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(88)
      _v2
    end
    def scan_string_dq=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(88, _v2)
    end
    def scan_string_sq
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(84)
      _v2
    end
    def scan_string_sq=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(84, _v2)
    end
    def scan_symbols
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(60)
      _v2
    end
    def scan_symbols=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(60, _v2)
    end
    def scope_0_fallback
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(112)
      _v2
    end
    def scope_0_fallback=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(112, _v2)
    end
    def skip_comment_multi
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(36)
      _v2
    end
    def skip_comment_multi=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(36, _v2)
    end
    def skip_comment_single
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(40)
      _v2
    end
    def skip_comment_single=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(40, _v2)
    end
    def store_int64
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(116)
      _v2
    end
    def store_int64=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(116, _v2)
    end
    def symbol_2_token
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(108)
      _v2
    end
    def symbol_2_token=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(108, _v2)
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print enum
  class GLib::Sequence < GirFFI::StructBase
    def self.foreach_range(begin_, end_, &func)
      _v1 = GLib::SequenceIter.from(begin_)
      _v2 = GLib::SequenceIter.from(end_)
      _v3 = GLib::Func.from(func)
      _v4 = GirFFI::ArgHelper.store(_v3)
      GLib::Lib.g_sequence_foreach_range(_v1, _v2, _v3, _v4)
    end
    def self.get(iter)
      _v1 = GLib::SequenceIter.from(iter)
      _v2 = GLib::Lib.g_sequence_get(_v1)
      return _v2
    end
    def self.insert_before(iter, data = nil)
      _v1 = GLib::SequenceIter.from(iter)
      _v2 = data
      _v3 = GLib::Lib.g_sequence_insert_before(_v1, _v2)
      _v4 = GLib::SequenceIter.wrap_copy(_v3)
      return _v4
    end
    def self.move(src, dest)
      _v1 = GLib::SequenceIter.from(src)
      _v2 = GLib::SequenceIter.from(dest)
      GLib::Lib.g_sequence_move(_v1, _v2)
    end
    def self.move_range(dest, begin_, end_)
      _v1 = GLib::SequenceIter.from(dest)
      _v2 = GLib::SequenceIter.from(begin_)
      _v3 = GLib::SequenceIter.from(end_)
      GLib::Lib.g_sequence_move_range(_v1, _v2, _v3)
    end
    def self.range_get_midpoint(begin_, end_)
      _v1 = GLib::SequenceIter.from(begin_)
      _v2 = GLib::SequenceIter.from(end_)
      _v3 = GLib::Lib.g_sequence_range_get_midpoint(_v1, _v2)
      _v4 = GLib::SequenceIter.wrap_copy(_v3)
      return _v4
    end
    def self.remove(iter)
      _v1 = GLib::SequenceIter.from(iter)
      GLib::Lib.g_sequence_remove(_v1)
    end
    def self.remove_range(begin_, end_)
      _v1 = GLib::SequenceIter.from(begin_)
      _v2 = GLib::SequenceIter.from(end_)
      GLib::Lib.g_sequence_remove_range(_v1, _v2)
    end
    def self.set(iter, data = nil)
      _v1 = GLib::SequenceIter.from(iter)
      _v2 = data
      GLib::Lib.g_sequence_set(_v1, _v2)
    end
    def self.sort_changed(iter, &cmp_func)
      _v1 = GLib::SequenceIter.from(iter)
      _v2 = GLib::CompareDataFunc.from(cmp_func)
      _v3 = GirFFI::ArgHelper.store(_v2)
      GLib::Lib.g_sequence_sort_changed(_v1, _v2, _v3)
    end
    def self.sort_changed_iter(iter, &iter_cmp)
      _v1 = GLib::SequenceIter.from(iter)
      _v2 = GLib::SequenceIterCompareFunc.from(iter_cmp)
      _v3 = GirFFI::ArgHelper.store(_v2)
      GLib::Lib.g_sequence_sort_changed_iter(_v1, _v2, _v3)
    end
    def self.swap(a, b)
      _v1 = GLib::SequenceIter.from(a)
      _v2 = GLib::SequenceIter.from(b)
      GLib::Lib.g_sequence_swap(_v1, _v2)
    end
    def append(data = nil)
      _v1 = data
      _v2 = GLib::Lib.g_sequence_append(self, _v1)
      _v3 = GLib::SequenceIter.wrap_copy(_v2)
      return _v3
    end
    def foreach(&func)
      _v1 = GLib::Func.from(func)
      _v2 = GirFFI::ArgHelper.store(_v1)
      GLib::Lib.g_sequence_foreach(self, _v1, _v2)
    end
    def free
      GLib::Lib.g_sequence_free(self)
    end
    def get_begin_iter
      _v1 = GLib::Lib.g_sequence_get_begin_iter(self)
      _v2 = GLib::SequenceIter.wrap_copy(_v1)
      return _v2
    end
    def get_end_iter
      _v1 = GLib::Lib.g_sequence_get_end_iter(self)
      _v2 = GLib::SequenceIter.wrap_copy(_v1)
      return _v2
    end
    def get_iter_at_pos(pos)
      _v1 = pos
      _v2 = GLib::Lib.g_sequence_get_iter_at_pos(self, _v1)
      _v3 = GLib::SequenceIter.wrap_copy(_v2)
      return _v3
    end
    def get_length
      _v1 = GLib::Lib.g_sequence_get_length(self)
      return _v1
    end
    def insert_sorted(data = nil, &cmp_func)
      _v1 = data
      _v2 = GLib::CompareDataFunc.from(cmp_func)
      _v3 = GirFFI::ArgHelper.store(_v2)
      _v4 = GLib::Lib.g_sequence_insert_sorted(self, _v1, _v2, _v3)
      _v5 = GLib::SequenceIter.wrap_copy(_v4)
      return _v5
    end
    def insert_sorted_iter(data = nil, &iter_cmp)
      _v1 = data
      _v2 = GLib::SequenceIterCompareFunc.from(iter_cmp)
      _v3 = GirFFI::ArgHelper.store(_v2)
      _v4 = GLib::Lib.g_sequence_insert_sorted_iter(self, _v1, _v2, _v3)
      _v5 = GLib::SequenceIter.wrap_copy(_v4)
      return _v5
    end
    def is_empty
      _v1 = GLib::Lib.g_sequence_is_empty(self)
      return _v1
    end
    def lookup(data = nil, &cmp_func)
      _v1 = data
      _v2 = GLib::CompareDataFunc.from(cmp_func)
      _v3 = GirFFI::ArgHelper.store(_v2)
      _v4 = GLib::Lib.g_sequence_lookup(self, _v1, _v2, _v3)
      _v5 = GLib::SequenceIter.wrap_copy(_v4)
      return _v5
    end
    def lookup_iter(data = nil, &iter_cmp)
      _v1 = data
      _v2 = GLib::SequenceIterCompareFunc.from(iter_cmp)
      _v3 = GirFFI::ArgHelper.store(_v2)
      _v4 = GLib::Lib.g_sequence_lookup_iter(self, _v1, _v2, _v3)
      _v5 = GLib::SequenceIter.wrap_copy(_v4)
      return _v5
    end
    def prepend(data = nil)
      _v1 = data
      _v2 = GLib::Lib.g_sequence_prepend(self, _v1)
      _v3 = GLib::SequenceIter.wrap_copy(_v2)
      return _v3
    end
    def search(data = nil, &cmp_func)
      _v1 = data
      _v2 = GLib::CompareDataFunc.from(cmp_func)
      _v3 = GirFFI::ArgHelper.store(_v2)
      _v4 = GLib::Lib.g_sequence_search(self, _v1, _v2, _v3)
      _v5 = GLib::SequenceIter.wrap_copy(_v4)
      return _v5
    end
    def search_iter(data = nil, &iter_cmp)
      _v1 = data
      _v2 = GLib::SequenceIterCompareFunc.from(iter_cmp)
      _v3 = GirFFI::ArgHelper.store(_v2)
      _v4 = GLib::Lib.g_sequence_search_iter(self, _v1, _v2, _v3)
      _v5 = GLib::SequenceIter.wrap_copy(_v4)
      return _v5
    end
    def sort(&cmp_func)
      _v1 = GLib::CompareDataFunc.from(cmp_func)
      _v2 = GirFFI::ArgHelper.store(_v1)
      GLib::Lib.g_sequence_sort(self, _v1, _v2)
    end
    def sort_iter(&cmp_func)
      _v1 = GLib::SequenceIterCompareFunc.from(cmp_func)
      _v2 = GirFFI::ArgHelper.store(_v1)
      GLib::Lib.g_sequence_sort_iter(self, _v1, _v2)
    end
    alias_method 'begin_iter', 'get_begin_iter'
    alias_method 'end_iter', 'get_end_iter'
    alias_method 'iter_at_pos', 'get_iter_at_pos'
    alias_method 'length', 'get_length'
  end
  class GLib::SequenceIter < GirFFI::StructBase
  
    def compare(b)
      _v1 = GLib::SequenceIter.from(b)
      _v2 = GLib::Lib.g_sequence_iter_compare(self, _v1)
      return _v2
    end
    def get_position
      _v1 = GLib::Lib.g_sequence_iter_get_position(self)
      return _v1
    end
    def get_sequence
      _v1 = GLib::Lib.g_sequence_iter_get_sequence(self)
      _v2 = GLib::Sequence.wrap_copy(_v1)
      return _v2
    end
    def is_begin
      _v1 = GLib::Lib.g_sequence_iter_is_begin(self)
      return _v1
    end
    def is_end
      _v1 = GLib::Lib.g_sequence_iter_is_end(self)
      return _v1
    end
    def move(delta)
      _v1 = delta
      _v2 = GLib::Lib.g_sequence_iter_move(self, _v1)
      _v3 = GLib::SequenceIter.wrap_copy(_v2)
      return _v3
    end
    def next
      _v1 = GLib::Lib.g_sequence_iter_next(self)
      _v2 = GLib::SequenceIter.wrap_copy(_v1)
      return _v2
    end
    def prev
      _v1 = GLib::Lib.g_sequence_iter_prev(self)
      _v2 = GLib::SequenceIter.wrap_copy(_v1)
      return _v2
    end
    alias_method 'position', 'get_position'
    alias_method 'sequence', 'get_sequence'
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print enum
  # XXX: Don't know how to print enum
  class GLib::Source < GirFFI::BoxedBase
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def self.remove(tag)
      _v1 = tag
      _v2 = GLib::Lib.g_source_remove(_v1)
      return _v2
    end
    def self.remove_by_funcs_user_data(funcs, user_data = nil)
      _v1 = GLib::SourceFuncs.from(funcs)
      _v2 = user_data
      _v3 = GLib::Lib.g_source_remove_by_funcs_user_data(_v1, _v2)
      return _v3
    end
    def self.remove_by_user_data(user_data = nil)
      _v1 = user_data
      _v2 = GLib::Lib.g_source_remove_by_user_data(_v1)
      return _v2
    end
    def self.set_name_by_id(tag, name)
      _v1 = tag
      _v2 = GirFFI::InPointer.from_utf8(name)
      GLib::Lib.g_source_set_name_by_id(_v1, _v2)
    end
    def add_child_source(child_source)
      _v1 = GLib::Source.from(child_source)
      GLib::Lib.g_source_add_child_source(self, _v1)
    end
    def add_poll(fd)
      _v1 = GLib::PollFD.from(fd)
      GLib::Lib.g_source_add_poll(self, _v1)
    end
    def add_unix_fd(fd, events)
      _v1 = fd
      _v2 = events
      _v3 = GLib::Lib.g_source_add_unix_fd(self, _v1, _v2)
      return _v3
    end
    def attach(context = nil)
      _v1 = GLib::MainContext.from(context)
      _v2 = GLib::Lib.g_source_attach(self, _v1)
      return _v2
    end
    def callback_data
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(0)
      _v2
    end
    def callback_funcs
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(8)
      _v3 = GLib::SourceCallbackFuncs.wrap(_v2)
      _v3
    end
    def destroy
      GLib::Lib.g_source_destroy(self)
    end
    def flags
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(44)
      _v2
    end
    def get_can_recurse
      _v1 = GLib::Lib.g_source_get_can_recurse(self)
      return _v1
    end
    def get_context
      _v1 = GLib::Lib.g_source_get_context(self)
      _v2 = GLib::MainContext.wrap_copy(_v1)
      return _v2
    end
    def get_current_time(timeval)
      _v1 = GLib::TimeVal.from(timeval)
      GLib::Lib.g_source_get_current_time(self, _v1)
    end
    def get_id
      _v1 = GLib::Lib.g_source_get_id(self)
      return _v1
    end
    def get_name
      _v1 = GLib::Lib.g_source_get_name(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def get_priority
      _v1 = GLib::Lib.g_source_get_priority(self)
      return _v1
    end
    def get_ready_time
      _v1 = GLib::Lib.g_source_get_ready_time(self)
      return _v1
    end
    def get_time
      _v1 = GLib::Lib.g_source_get_time(self)
      return _v1
    end
    def is_destroyed
      _v1 = GLib::Lib.g_source_is_destroyed(self)
      return _v1
    end
    def modify_unix_fd(tag, new_events)
      _v1 = tag
      _v2 = new_events
      GLib::Lib.g_source_modify_unix_fd(self, _v1, _v2)
    end
    def name
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(80)
      _v3 = _v2.to_utf8
      _v3
    end
    def next
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(72)
      _v3 = GLib::Source.wrap(_v2)
      _v3
    end
    def poll_fds
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(56)
      _v3 = GLib::SList.wrap([:pointer, :void], _v2)
      _v3
    end
    def prev
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(64)
      _v3 = GLib::Source.wrap(_v2)
      _v3
    end
    def priority
      _v1 = @struct.to_ptr
      _v2 = _v1.get_int32(40)
      _v2
    end
    def query_unix_fd(tag)
      _v1 = tag
      _v2 = GLib::Lib.g_source_query_unix_fd(self, _v1)
      return _v2
    end
    def ref
      _v1 = GLib::Lib.g_source_ref(self)
      _v2 = GLib::Source.wrap_own(_v1)
      return _v2
    end
    def ref_count
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(24)
      _v2
    end
    def remove_child_source(child_source)
      _v1 = GLib::Source.from(child_source)
      GLib::Lib.g_source_remove_child_source(self, _v1)
    end
    def remove_poll(fd)
      _v1 = GLib::PollFD.from(fd)
      GLib::Lib.g_source_remove_poll(self, _v1)
    end
    def remove_unix_fd(tag)
      _v1 = tag
      GLib::Lib.g_source_remove_unix_fd(self, _v1)
    end
    def set_callback(&func)
      _v1 = GLib::SourceFunc.from(func)
      _v2 = GirFFI::ArgHelper.store(_v1)
      _v3 = GLib::DestroyNotify.default
      GLib::Lib.g_source_set_callback(self, _v1, _v2, _v3)
    end
    def set_callback_indirect(callback_data, callback_funcs)
      _v1 = callback_data
      _v2 = GLib::SourceCallbackFuncs.from(callback_funcs)
      GLib::Lib.g_source_set_callback_indirect(self, _v1, _v2)
    end
    def set_can_recurse(can_recurse)
      _v1 = can_recurse
      GLib::Lib.g_source_set_can_recurse(self, _v1)
    end
    def set_funcs(funcs)
      _v1 = GLib::SourceFuncs.from(funcs)
      GLib::Lib.g_source_set_funcs(self, _v1)
    end
    def set_name(name)
      _v1 = GirFFI::InPointer.from_utf8(name)
      GLib::Lib.g_source_set_name(self, _v1)
    end
    def set_priority(priority)
      _v1 = priority
      GLib::Lib.g_source_set_priority(self, _v1)
    end
    def set_ready_time(ready_time)
      _v1 = ready_time
      GLib::Lib.g_source_set_ready_time(self, _v1)
    end
    def set_static_name(name)
      _v1 = GirFFI::InPointer.from_utf8(name)
      GLib::Lib.g_source_set_static_name(self, _v1)
    end
    def source_funcs
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(16)
      _v3 = GLib::SourceFuncs.wrap(_v2)
      _v3
    end
    def source_id
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(48)
      _v2
    end
    def unref
      GLib::Lib.g_source_unref(self)
    end
    alias_method 'can_recurse', 'get_can_recurse'
    alias_method 'can_recurse=', 'set_can_recurse'
    alias_method 'context', 'get_context'
    alias_method 'current_time', 'get_current_time'
    alias_method 'funcs=', 'set_funcs'
    alias_method 'id', 'get_id'
    alias_method 'name=', 'set_name'
    alias_method 'priority=', 'set_priority'
    alias_method 'ready_time', 'get_ready_time'
    alias_method 'ready_time=', 'set_ready_time'
    alias_method 'static_name=', 'set_static_name'
    alias_method 'time', 'get_time'
  end
  class GLib::SourceCallbackFuncs < GirFFI::StructBase
  
    def get
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(16)
      _v2
    end
    def ref
      _v1 = @struct.to_ptr
      _v2 = GLib::SourceCallbackFuncs::Ref.get_value_from_pointer(_v1, 0)
      _v2
    end
    def unref
      _v1 = @struct.to_ptr
      _v2 = GLib::SourceCallbackFuncs::Unref.get_value_from_pointer(_v1, 8)
      _v2
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  class GLib::SourceFuncs < GirFFI::StructBase
  
    def check
      _v1 = @struct.to_ptr
      _v2 = GLib::SourceFuncsCheckFunc.get_value_from_pointer(_v1, 8)
      _v2
    end
    def check=(value)
      _v1 = @struct.to_ptr
      _v2 = GLib::SourceFuncsCheckFunc.from(value)
      GLib::SourceFuncsCheckFunc.copy_value_to_pointer(_v2, _v1, 8)
    end
    def closure_callback
      _v1 = @struct.to_ptr
      _v2 = GLib::SourceFunc.get_value_from_pointer(_v1, 32)
      _v2
    end
    def closure_marshal
      _v1 = @struct.to_ptr
      _v2 = GLib::SourceDummyMarshal.get_value_from_pointer(_v1, 40)
      _v2
    end
    def dispatch
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(16)
      _v2
    end
    def dispatch=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_pointer(16, _v2)
    end
    def finalize
      _v1 = @struct.to_ptr
      _v2 = GLib::SourceFuncsFinalizeFunc.get_value_from_pointer(_v1, 24)
      _v2
    end
    def finalize=(value)
      _v1 = @struct.to_ptr
      _v2 = GLib::SourceFuncsFinalizeFunc.from(value)
      GLib::SourceFuncsFinalizeFunc.copy_value_to_pointer(_v2, _v1, 24)
    end
    def prepare
      _v1 = @struct.to_ptr
      _v2 = GLib::SourceFuncsPrepareFunc.get_value_from_pointer(_v1, 0)
      _v2
    end
    def prepare=(value)
      _v1 = @struct.to_ptr
      _v2 = GLib::SourceFuncsPrepareFunc.from(value)
      GLib::SourceFuncsPrepareFunc.copy_value_to_pointer(_v2, _v1)
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  class GLib::SourcePrivate < GirFFI::StructBase
  
  
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print enum
  # XXX: Don't know how to print flags
  class GLib::StatBuf < GirFFI::StructBase
  
  
  end
  class GLib::String < GirFFI::BoxedBase
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def self.new_len(*args, &block)
      raise(NoMethodError) unless (self == GLib::String)
      obj = allocate
      obj.__send__(:initialize_len, *args, &block)
      obj
    end
    def self.new_take(*args, &block)
      raise(NoMethodError) unless (self == GLib::String)
      obj = allocate
      obj.__send__(:initialize_take, *args, &block)
      obj
    end
    def self.sized_new(*args, &block)
      raise(NoMethodError) unless (self == GLib::String)
      obj = allocate
      obj.__send__(:sized_new, *args, &block)
      obj
    end
    def allocated_len
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint64(16)
      _v2
    end
    def allocated_len=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint64(16, _v2)
    end
    def append(val)
      _v1 = GirFFI::InPointer.from_utf8(val)
      _v2 = GLib::Lib.g_string_append(self, _v1)
      _v3 = GLib::String.wrap_copy(_v2)
      return _v3
    end
    def append_c(c)
      _v1 = c
      _v2 = GLib::Lib.g_string_append_c(self, _v1)
      _v3 = GLib::String.wrap_copy(_v2)
      return _v3
    end
    def append_len(val, len)
      _v1 = GirFFI::InPointer.from_utf8(val)
      _v2 = len
      _v3 = GLib::Lib.g_string_append_len(self, _v1, _v2)
      _v4 = GLib::String.wrap_copy(_v3)
      return _v4
    end
    def append_unichar(wc)
      _v1 = wc
      _v2 = GLib::Lib.g_string_append_unichar(self, _v1)
      _v3 = GLib::String.wrap_copy(_v2)
      return _v3
    end
    def append_uri_escaped(unescaped, reserved_chars_allowed, allow_utf8)
      _v1 = GirFFI::InPointer.from_utf8(unescaped)
      _v2 = GirFFI::InPointer.from_utf8(reserved_chars_allowed)
      _v3 = allow_utf8
      _v4 = GLib::Lib.g_string_append_uri_escaped(self, _v1, _v2, _v3)
      _v5 = GLib::String.wrap_copy(_v4)
      return _v5
    end
    def ascii_down
      _v1 = GLib::Lib.g_string_ascii_down(self)
      _v2 = GLib::String.wrap_copy(_v1)
      return _v2
    end
    def ascii_up
      _v1 = GLib::Lib.g_string_ascii_up(self)
      _v2 = GLib::String.wrap_copy(_v1)
      return _v2
    end
    def assign(rval)
      _v1 = GirFFI::InPointer.from_utf8(rval)
      _v2 = GLib::Lib.g_string_assign(self, _v1)
      _v3 = GLib::String.wrap_copy(_v2)
      return _v3
    end
    def down
      _v1 = GLib::Lib.g_string_down(self)
      _v2 = GLib::String.wrap_copy(_v1)
      return _v2
    end
    def equal(v2)
      _v1 = GLib::String.from(v2)
      _v2 = GLib::Lib.g_string_equal(self, _v1)
      return _v2
    end
    def erase(pos, len)
      _v1 = pos
      _v2 = len
      _v3 = GLib::Lib.g_string_erase(self, _v1, _v2)
      _v4 = GLib::String.wrap_copy(_v3)
      return _v4
    end
    def free(free_segment)
      _v1 = free_segment
      _v2 = GLib::Lib.g_string_free(self, _v1)
      _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
      return _v3
    end
    def free_and_steal
      _v1 = GLib::Lib.g_string_free_and_steal(self)
      _v2 = GirFFI::AllocationHelper.free_after(_v1, &:to_utf8)
      return _v2
    end
    def free_to_bytes
      _v1 = GLib::Lib.g_string_free_to_bytes(self)
      _v2 = GLib::Bytes.wrap_own(_v1)
      return _v2
    end
    def hash
      _v1 = GLib::Lib.g_string_hash(self)
      return _v1
    end
    def initialize_len(init, len)
      _v1 = GirFFI::InPointer.from_utf8(init)
      _v2 = len
      _v3 = GLib::Lib.g_string_new_len(_v1, _v2)
      store_pointer(_v3)
      @struct.owned = true
    end
    def initialize_take(init = nil)
      _v1 = GirFFI::InPointer.from_utf8(init)
      _v2 = GLib::Lib.g_string_new_take(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def insert(pos, val)
      _v1 = pos
      _v2 = GirFFI::InPointer.from_utf8(val)
      _v3 = GLib::Lib.g_string_insert(self, _v1, _v2)
      _v4 = GLib::String.wrap_copy(_v3)
      return _v4
    end
    def insert_c(pos, c)
      _v1 = pos
      _v2 = c
      _v3 = GLib::Lib.g_string_insert_c(self, _v1, _v2)
      _v4 = GLib::String.wrap_copy(_v3)
      return _v4
    end
    def insert_len(pos, val, len)
      _v1 = pos
      _v2 = GirFFI::InPointer.from_utf8(val)
      _v3 = len
      _v4 = GLib::Lib.g_string_insert_len(self, _v1, _v2, _v3)
      _v5 = GLib::String.wrap_copy(_v4)
      return _v5
    end
    def insert_unichar(pos, wc)
      _v1 = pos
      _v2 = wc
      _v3 = GLib::Lib.g_string_insert_unichar(self, _v1, _v2)
      _v4 = GLib::String.wrap_copy(_v3)
      return _v4
    end
    def len
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint64(8)
      _v2
    end
    def len=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint64(8, _v2)
    end
    def overwrite(pos, val)
      _v1 = pos
      _v2 = GirFFI::InPointer.from_utf8(val)
      _v3 = GLib::Lib.g_string_overwrite(self, _v1, _v2)
      _v4 = GLib::String.wrap_copy(_v3)
      return _v4
    end
    def overwrite_len(pos, val, len)
      _v1 = pos
      _v2 = GirFFI::InPointer.from_utf8(val)
      _v3 = len
      _v4 = GLib::Lib.g_string_overwrite_len(self, _v1, _v2, _v3)
      _v5 = GLib::String.wrap_copy(_v4)
      return _v5
    end
    def prepend(val)
      _v1 = GirFFI::InPointer.from_utf8(val)
      _v2 = GLib::Lib.g_string_prepend(self, _v1)
      _v3 = GLib::String.wrap_copy(_v2)
      return _v3
    end
    def prepend_c(c)
      _v1 = c
      _v2 = GLib::Lib.g_string_prepend_c(self, _v1)
      _v3 = GLib::String.wrap_copy(_v2)
      return _v3
    end
    def prepend_len(val, len)
      _v1 = GirFFI::InPointer.from_utf8(val)
      _v2 = len
      _v3 = GLib::Lib.g_string_prepend_len(self, _v1, _v2)
      _v4 = GLib::String.wrap_copy(_v3)
      return _v4
    end
    def prepend_unichar(wc)
      _v1 = wc
      _v2 = GLib::Lib.g_string_prepend_unichar(self, _v1)
      _v3 = GLib::String.wrap_copy(_v2)
      return _v3
    end
    def replace(find, replace, limit)
      _v1 = GirFFI::InPointer.from_utf8(find)
      _v2 = GirFFI::InPointer.from_utf8(replace)
      _v3 = limit
      _v4 = GLib::Lib.g_string_replace(self, _v1, _v2, _v3)
      return _v4
    end
    def set_size(len)
      _v1 = len
      _v2 = GLib::Lib.g_string_set_size(self, _v1)
      _v3 = GLib::String.wrap_copy(_v2)
      return _v3
    end
    def sized_new(dfl_size)
      _v1 = dfl_size
      _v2 = GLib::Lib.g_string_sized_new(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def str
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(0)
      _v3 = _v2.to_utf8
      _v3
    end
    def str=(value)
      _v1 = @struct.to_ptr
      _v2 = GirFFI::InPointer.from_utf8(value)
      _v1.put_pointer(0, _v2)
    end
    def truncate(len)
      _v1 = len
      _v2 = GLib::Lib.g_string_truncate(self, _v1)
      _v3 = GLib::String.wrap_copy(_v2)
      return _v3
    end
    def up
      _v1 = GLib::Lib.g_string_up(self)
      _v2 = GLib::String.wrap_copy(_v1)
      return _v2
    end
    alias_method 'size=', 'set_size'
  end
  class GLib::StringChunk < GirFFI::StructBase
  
    def clear
      GLib::Lib.g_string_chunk_clear(self)
    end
    def free
      GLib::Lib.g_string_chunk_free(self)
    end
    def insert(string)
      _v1 = GirFFI::InPointer.from_utf8(string)
      _v2 = GLib::Lib.g_string_chunk_insert(self, _v1)
      _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
      return _v3
    end
    def insert_const(string)
      _v1 = GirFFI::InPointer.from_utf8(string)
      _v2 = GLib::Lib.g_string_chunk_insert_const(self, _v1)
      _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
      return _v3
    end
    def insert_len(string, len)
      _v1 = GirFFI::InPointer.from_utf8(string)
      _v2 = len
      _v3 = GLib::Lib.g_string_chunk_insert_len(self, _v1, _v2)
      _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
      return _v4
    end
  end
  class GLib::StrvBuilder < GirFFI::BoxedBase
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def add(value)
      _v1 = GirFFI::InPointer.from_utf8(value)
      GLib::Lib.g_strv_builder_add(self, _v1)
    end
    def addv(value)
      _v1 = GLib::Strv.from(value)
      GLib::Lib.g_strv_builder_addv(self, _v1)
    end
    def end
      _v1 = GLib::Lib.g_strv_builder_end(self)
      _v2 = GLib::Strv.wrap(_v1)
      return _v2
    end
    def ref
      _v1 = GLib::Lib.g_strv_builder_ref(self)
      _v2 = GLib::StrvBuilder.wrap_own(_v1)
      return _v2
    end
    def take(value)
      _v1 = GirFFI::InPointer.from_utf8(value)
      GLib::Lib.g_strv_builder_take(self, _v1)
    end
    def unref
      GLib::Lib.g_strv_builder_unref(self)
    end
    def unref_to_strv
      _v1 = GLib::Lib.g_strv_builder_unref_to_strv(self)
      _v2 = GLib::Strv.wrap(_v1)
      return _v2
    end
  end
  TEST_OPTION_ISOLATE_DIRS = "isolate_dirs"
  TEST_OPTION_NONFATAL_ASSERTIONS = "nonfatal-assertions"
  TEST_OPTION_NO_PRGNAME = "no_g_set_prgname"
  TIME_SPAN_DAY = 86400000000
  TIME_SPAN_HOUR = 3600000000
  TIME_SPAN_MILLISECOND = 1000
  TIME_SPAN_MINUTE = 60000000
  TIME_SPAN_SECOND = 1000000
  class GLib::TestCase < GirFFI::StructBase
  
    def free
      GLib::Lib.g_test_case_free(self)
    end
  end
  class GLib::TestConfig < GirFFI::StructBase
  
    def test_initialized
      _v1 = @struct.to_ptr
      _v2 = GirFFI::Boolean.get_value_from_pointer(_v1, 0)
      _v2
    end
    def test_initialized=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      GirFFI::Boolean.copy_value_to_pointer(_v2, _v1)
    end
    def test_perf
      _v1 = @struct.to_ptr
      _v2 = GirFFI::Boolean.get_value_from_pointer(_v1, 8)
      _v2
    end
    def test_perf=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      GirFFI::Boolean.copy_value_to_pointer(_v2, _v1, 8)
    end
    def test_quick
      _v1 = @struct.to_ptr
      _v2 = GirFFI::Boolean.get_value_from_pointer(_v1, 4)
      _v2
    end
    def test_quick=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      GirFFI::Boolean.copy_value_to_pointer(_v2, _v1, 4)
    end
    def test_quiet
      _v1 = @struct.to_ptr
      _v2 = GirFFI::Boolean.get_value_from_pointer(_v1, 16)
      _v2
    end
    def test_quiet=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      GirFFI::Boolean.copy_value_to_pointer(_v2, _v1, 16)
    end
    def test_undefined
      _v1 = @struct.to_ptr
      _v2 = GirFFI::Boolean.get_value_from_pointer(_v1, 20)
      _v2
    end
    def test_undefined=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      GirFFI::Boolean.copy_value_to_pointer(_v2, _v1, 20)
    end
    def test_verbose
      _v1 = @struct.to_ptr
      _v2 = GirFFI::Boolean.get_value_from_pointer(_v1, 12)
      _v2
    end
    def test_verbose=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      GirFFI::Boolean.copy_value_to_pointer(_v2, _v1, 12)
    end
  end
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print enum
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  class GLib::TestLogBuffer < GirFFI::StructBase
  
    def data
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(0)
      _v3 = GLib::String.wrap(_v2)
      _v3
    end
    def free
      GLib::Lib.g_test_log_buffer_free(self)
    end
    def msgs
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(8)
      _v3 = GLib::SList.wrap([:pointer, :void], _v2)
      _v3
    end
    def push(n_bytes, bytes)
      _v1 = n_bytes
      _v2 = bytes
      GLib::Lib.g_test_log_buffer_push(self, _v1, _v2)
    end
  end
  # XXX: Don't know how to print callback
  class GLib::TestLogMsg < GirFFI::StructBase
  
    def free
      GLib::Lib.g_test_log_msg_free(self)
    end
    def log_type
      _v1 = @struct.to_ptr
      _v2 = GLib::TestLogType.get_value_from_pointer(_v1, 0)
      _v2
    end
    def log_type=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      GLib::TestLogType.copy_value_to_pointer(_v2, _v1)
    end
    def n_nums
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(16)
      _v2
    end
    def n_nums=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(16, _v2)
    end
    def n_strings
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(4)
      _v2
    end
    def n_strings=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(4, _v2)
    end
    def nums
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(24)
      _v2
    end
    def nums=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_pointer(24, _v2)
    end
    def strings
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(8)
      _v3 = _v2.to_utf8
      _v3
    end
    def strings=(value)
      _v1 = @struct.to_ptr
      _v2 = GirFFI::InPointer.from_utf8(value)
      _v1.put_pointer(8, _v2)
    end
  end
  # XXX: Don't know how to print enum
  # XXX: Don't know how to print enum
  # XXX: Don't know how to print flags
  class GLib::TestSuite < GirFFI::StructBase
  
    def add(test_case)
      _v1 = GLib::TestCase.from(test_case)
      GLib::Lib.g_test_suite_add(self, _v1)
    end
    def add_suite(nestedsuite)
      _v1 = GLib::TestSuite.from(nestedsuite)
      GLib::Lib.g_test_suite_add_suite(self, _v1)
    end
    def free
      GLib::Lib.g_test_suite_free(self)
    end
  end
  # XXX: Don't know how to print flags
  class GLib::Thread < GirFFI::BoxedBase
    def self.error_quark
      _v1 = GLib::Lib.g_thread_error_quark
      return _v1
    end
    def self.exit(retval = nil)
      _v1 = retval
      GLib::Lib.g_thread_exit(_v1)
    end
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def self.self
      _v1 = GLib::Lib.g_thread_self
      _v2 = GLib::Thread.wrap_copy(_v1)
      return _v2
    end
    def self.try_new(*args, &block)
      raise(NoMethodError) unless (self == GLib::Thread)
      obj = allocate
      obj.__send__(:try_new, *args, &block)
      obj
    end
    def self.yield
      GLib::Lib.g_thread_yield
    end
    def data
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(8)
      _v2
    end
    def func
      _v1 = @struct.to_ptr
      _v2 = GLib::ThreadFunc.get_value_from_pointer(_v1, 0)
      _v2
    end
    def get_name
      _v1 = GLib::Lib.g_thread_get_name(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def join
      _v1 = GLib::Lib.g_thread_join(self)
      return _v1
    end
    def joinable
      _v1 = @struct.to_ptr
      _v2 = GirFFI::Boolean.get_value_from_pointer(_v1, 16)
      _v2
    end
    def priority
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(24)
      _v2
    end
    def ref
      _v1 = GLib::Lib.g_thread_ref(self)
      _v2 = GLib::Thread.wrap_own(_v1)
      return _v2
    end
    def try_new(name = nil, &func)
      _v1 = GirFFI::InPointer.from_utf8(name)
      _v2 = GLib::ThreadFunc.from(func)
      _v3 = GirFFI::ArgHelper.store(_v2)
      _v4 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v5 = GLib::Lib.g_thread_try_new(_v1, _v2, _v3, _v4)
      GirFFI::ArgHelper.check_error(_v4)
      store_pointer(_v5)
      @struct.owned = true
    end
    def unref
      GLib::Lib.g_thread_unref(self)
    end
    alias_method 'name', 'get_name'
  end
  # XXX: Don't know how to print enum
  # XXX: Don't know how to print callback
  class GLib::ThreadPool < GirFFI::StructBase
    def self.get_max_idle_time
      _v1 = GLib::Lib.g_thread_pool_get_max_idle_time
      return _v1
    end
    def self.get_max_unused_threads
      _v1 = GLib::Lib.g_thread_pool_get_max_unused_threads
      return _v1
    end
    def self.get_num_unused_threads
      _v1 = GLib::Lib.g_thread_pool_get_num_unused_threads
      return _v1
    end
    def self.set_max_idle_time(interval)
      _v1 = interval
      GLib::Lib.g_thread_pool_set_max_idle_time(_v1)
    end
    def self.set_max_unused_threads(max_threads)
      _v1 = max_threads
      GLib::Lib.g_thread_pool_set_max_unused_threads(_v1)
    end
    def self.stop_unused_threads
      GLib::Lib.g_thread_pool_stop_unused_threads
    end
    def exclusive
      _v1 = @struct.to_ptr
      _v2 = GirFFI::Boolean.get_value_from_pointer(_v1, 16)
      _v2
    end
    def exclusive=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      GirFFI::Boolean.copy_value_to_pointer(_v2, _v1, 16)
    end
    def free(immediate, wait_)
      _v1 = immediate
      _v2 = wait_
      GLib::Lib.g_thread_pool_free(self, _v1, _v2)
    end
    def func
      _v1 = @struct.to_ptr
      _v2 = GLib::Func.get_value_from_pointer(_v1, 0)
      _v2
    end
    def func=(value)
      _v1 = @struct.to_ptr
      _v2 = GLib::Func.from(value)
      GLib::Func.copy_value_to_pointer(_v2, _v1)
    end
    def get_max_threads
      _v1 = GLib::Lib.g_thread_pool_get_max_threads(self)
      return _v1
    end
    def get_num_threads
      _v1 = GLib::Lib.g_thread_pool_get_num_threads(self)
      return _v1
    end
    def move_to_front(data = nil)
      _v1 = data
      _v2 = GLib::Lib.g_thread_pool_move_to_front(self, _v1)
      return _v2
    end
    def push(data = nil)
      _v1 = data
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_thread_pool_push(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      return _v3
    end
    def set_max_threads(max_threads)
      _v1 = max_threads
      _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v3 = GLib::Lib.g_thread_pool_set_max_threads(self, _v1, _v2)
      GirFFI::ArgHelper.check_error(_v2)
      return _v3
    end
    def unprocessed
      _v1 = GLib::Lib.g_thread_pool_unprocessed(self)
      return _v1
    end
    def user_data
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(8)
      _v2
    end
    def user_data=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_pointer(8, _v2)
    end
    alias_method 'max_threads', 'get_max_threads'
    alias_method 'max_threads=', 'set_max_threads'
    alias_method 'num_threads', 'get_num_threads'
  end
  # XXX: Don't know how to print enum
  class GLib::TimeVal < GirFFI::StructBase
    def self.from_iso8601(iso_date)
      _v1 = GirFFI::InPointer.from_utf8(iso_date)
      _v2 = GLib::TimeVal.new
      _v3 = GLib::Lib.g_time_val_from_iso8601(_v1, _v2)
      return [_v3, _v2]
    end
    def add(microseconds)
      _v1 = microseconds
      GLib::Lib.g_time_val_add(self, _v1)
    end
    def to_iso8601
      _v1 = GLib::Lib.g_time_val_to_iso8601(self)
      _v2 = GirFFI::AllocationHelper.free_after(_v1, &:to_utf8)
      return _v2
    end
    def tv_sec
      _v1 = @struct.to_ptr
      _v2 = _v1.get_int64(0)
      _v2
    end
    def tv_sec=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_int64(0, _v2)
    end
    def tv_usec
      _v1 = @struct.to_ptr
      _v2 = _v1.get_int64(8)
      _v2
    end
    def tv_usec=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_int64(8, _v2)
    end
  end
  class GLib::TimeZone < GirFFI::BoxedBase
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def self.new_identifier(*args, &block)
      raise(NoMethodError) unless (self == GLib::TimeZone)
      obj = allocate
      obj.__send__(:initialize_identifier, *args, &block)
      obj
    end
    def self.new_local(*args, &block)
      raise(NoMethodError) unless (self == GLib::TimeZone)
      obj = allocate
      obj.__send__(:initialize_local, *args, &block)
      obj
    end
    def self.new_offset(*args, &block)
      raise(NoMethodError) unless (self == GLib::TimeZone)
      obj = allocate
      obj.__send__(:initialize_offset, *args, &block)
      obj
    end
    def self.new_utc(*args, &block)
      raise(NoMethodError) unless (self == GLib::TimeZone)
      obj = allocate
      obj.__send__(:initialize_utc, *args, &block)
      obj
    end
    def adjust_time(type, time_)
      _v1 = type
      _v2 = FFI::MemoryPointer.new(:int64)
      _v2.put_int64(0, time_)
      _v3 = GLib::Lib.g_time_zone_adjust_time(self, _v1, _v2)
      _v4 = _v2.get_int64(0)
      return [_v3, _v4]
    end
    def find_interval(type, time_)
      _v1 = type
      _v2 = time_
      _v3 = GLib::Lib.g_time_zone_find_interval(self, _v1, _v2)
      return _v3
    end
    def get_abbreviation(interval)
      _v1 = interval
      _v2 = GLib::Lib.g_time_zone_get_abbreviation(self, _v1)
      _v3 = _v2.to_utf8
      return _v3
    end
    def get_identifier
      _v1 = GLib::Lib.g_time_zone_get_identifier(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def get_offset(interval)
      _v1 = interval
      _v2 = GLib::Lib.g_time_zone_get_offset(self, _v1)
      return _v2
    end
    def initialize_identifier(identifier = nil)
      _v1 = GirFFI::InPointer.from_utf8(identifier)
      _v2 = GLib::Lib.g_time_zone_new_identifier(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_local
      _v1 = GLib::Lib.g_time_zone_new_local
      store_pointer(_v1)
      @struct.owned = true
    end
    def initialize_offset(seconds)
      _v1 = seconds
      _v2 = GLib::Lib.g_time_zone_new_offset(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_utc
      _v1 = GLib::Lib.g_time_zone_new_utc
      store_pointer(_v1)
      @struct.owned = true
    end
    def is_dst(interval)
      _v1 = interval
      _v2 = GLib::Lib.g_time_zone_is_dst(self, _v1)
      return _v2
    end
    def ref
      _v1 = GLib::Lib.g_time_zone_ref(self)
      _v2 = GLib::TimeZone.wrap_own(_v1)
      return _v2
    end
    def unref
      GLib::Lib.g_time_zone_unref(self)
    end
    alias_method 'abbreviation', 'get_abbreviation'
    alias_method 'identifier', 'get_identifier'
    alias_method 'offset', 'get_offset'
  end
  class GLib::Timer < GirFFI::StructBase
  
    def continue
      GLib::Lib.g_timer_continue(self)
    end
    def destroy
      GLib::Lib.g_timer_destroy(self)
    end
    def elapsed(microseconds)
      _v1 = microseconds
      _v2 = GLib::Lib.g_timer_elapsed(self, _v1)
      return _v2
    end
    def is_active
      _v1 = GLib::Lib.g_timer_is_active(self)
      return _v1
    end
    def reset
      GLib::Lib.g_timer_reset(self)
    end
    def start
      GLib::Lib.g_timer_start(self)
    end
    def stop
      GLib::Lib.g_timer_stop(self)
    end
  end
  # XXX: Don't know how to print enum
  # XXX: Don't know how to print union
  # XXX: Don't know how to print callback
  class GLib::TrashStack < GirFFI::StructBase
    def self.height(stack_p)
      _v1 = GLib::TrashStack.from(stack_p)
      _v2 = GLib::Lib.g_trash_stack_height(_v1)
      return _v2
    end
    def self.peek(stack_p)
      _v1 = GLib::TrashStack.from(stack_p)
      _v2 = GLib::Lib.g_trash_stack_peek(_v1)
      return _v2
    end
    def self.pop(stack_p)
      _v1 = GLib::TrashStack.from(stack_p)
      _v2 = GLib::Lib.g_trash_stack_pop(_v1)
      return _v2
    end
    def self.push(stack_p, data_p)
      _v1 = GLib::TrashStack.from(stack_p)
      _v2 = data_p
      GLib::Lib.g_trash_stack_push(_v1, _v2)
    end
    def next
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(0)
      _v3 = GLib::TrashStack.wrap(_v2)
      _v3
    end
    def next=(value)
      _v1 = @struct.to_ptr
      _v2 = GLib::TrashStack.copy_from(value)
      _v1.put_pointer(0, _v2)
    end
  end
  # XXX: Don't know how to print flags
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print callback
  # XXX: Don't know how to print enum
  class GLib::Tree < GirFFI::BoxedBase
    def self.new_full(*args, &block)
      raise(NoMethodError) unless (self == GLib::Tree)
      obj = allocate
      obj.__send__(:initialize_full, *args, &block)
      obj
    end
    def destroy
      GLib::Lib.g_tree_destroy(self)
    end
    def foreach(&func)
      _v1 = GLib::TraverseFunc.from(func)
      _v2 = GirFFI::ArgHelper.store(_v1)
      GLib::Lib.g_tree_foreach(self, _v1, _v2)
    end
    def foreach_node(&func)
      _v1 = GLib::TraverseNodeFunc.from(func)
      _v2 = GirFFI::ArgHelper.store(_v1)
      GLib::Lib.g_tree_foreach_node(self, _v1, _v2)
    end
    def height
      _v1 = GLib::Lib.g_tree_height(self)
      return _v1
    end
    def initialize_full(key_compare_func, key_destroy_func)
      _v1 = GLib::CompareDataFunc.from(key_compare_func)
      _v2 = GirFFI::ArgHelper.store(_v1)
      _v3 = GLib::DestroyNotify.from(key_destroy_func)
      _v4 = GLib::DestroyNotify.default
      _v5 = GLib::Lib.g_tree_new_full(_v1, _v2, _v3, _v4)
      store_pointer(_v5)
      @struct.owned = true
    end
    def insert(key = nil, value = nil)
      _v1 = key
      _v2 = value
      GLib::Lib.g_tree_insert(self, _v1, _v2)
    end
    def insert_node(key = nil, value = nil)
      _v1 = key
      _v2 = value
      _v3 = GLib::Lib.g_tree_insert_node(self, _v1, _v2)
      _v4 = GLib::TreeNode.wrap_copy(_v3)
      return _v4
    end
    def lookup(key = nil)
      _v1 = key
      _v2 = GLib::Lib.g_tree_lookup(self, _v1)
      return _v2
    end
    def lookup_extended(lookup_key = nil)
      _v1 = lookup_key
      _v2 = FFI::MemoryPointer.new(:pointer)
      _v3 = FFI::MemoryPointer.new(:pointer)
      _v4 = GLib::Lib.g_tree_lookup_extended(self, _v1, _v2, _v3)
      _v5 = _v2.get_pointer(0)
      _v6 = _v3.get_pointer(0)
      return [_v4, _v5, _v6]
    end
    def lookup_node(key = nil)
      _v1 = key
      _v2 = GLib::Lib.g_tree_lookup_node(self, _v1)
      _v3 = GLib::TreeNode.wrap_copy(_v2)
      return _v3
    end
    def lower_bound(key = nil)
      _v1 = key
      _v2 = GLib::Lib.g_tree_lower_bound(self, _v1)
      _v3 = GLib::TreeNode.wrap_copy(_v2)
      return _v3
    end
    def nnodes
      _v1 = GLib::Lib.g_tree_nnodes(self)
      return _v1
    end
    def node_first
      _v1 = GLib::Lib.g_tree_node_first(self)
      _v2 = GLib::TreeNode.wrap_copy(_v1)
      return _v2
    end
    def node_last
      _v1 = GLib::Lib.g_tree_node_last(self)
      _v2 = GLib::TreeNode.wrap_copy(_v1)
      return _v2
    end
    def ref
      _v1 = GLib::Lib.g_tree_ref(self)
      _v2 = GLib::Tree.wrap_own(_v1)
      return _v2
    end
    def remove(key = nil)
      _v1 = key
      _v2 = GLib::Lib.g_tree_remove(self, _v1)
      return _v2
    end
    def remove_all
      GLib::Lib.g_tree_remove_all(self)
    end
    def replace(key = nil, value = nil)
      _v1 = key
      _v2 = value
      GLib::Lib.g_tree_replace(self, _v1, _v2)
    end
    def replace_node(key = nil, value = nil)
      _v1 = key
      _v2 = value
      _v3 = GLib::Lib.g_tree_replace_node(self, _v1, _v2)
      _v4 = GLib::TreeNode.wrap_copy(_v3)
      return _v4
    end
    def search(&search_func)
      _v1 = GLib::CompareFunc.from(search_func)
      _v2 = GirFFI::ArgHelper.store(_v1)
      _v3 = GLib::Lib.g_tree_search(self, _v1, _v2)
      return _v3
    end
    def search_node(&search_func)
      _v1 = GLib::CompareFunc.from(search_func)
      _v2 = GirFFI::ArgHelper.store(_v1)
      _v3 = GLib::Lib.g_tree_search_node(self, _v1, _v2)
      _v4 = GLib::TreeNode.wrap_copy(_v3)
      return _v4
    end
    def steal(key = nil)
      _v1 = key
      _v2 = GLib::Lib.g_tree_steal(self, _v1)
      return _v2
    end
    def traverse(traverse_type, &traverse_func)
      _v1 = GLib::TraverseFunc.from(traverse_func)
      _v2 = traverse_type
      _v3 = GirFFI::ArgHelper.store(_v1)
      GLib::Lib.g_tree_traverse(self, _v1, _v2, _v3)
    end
    def unref
      GLib::Lib.g_tree_unref(self)
    end
    def upper_bound(key = nil)
      _v1 = key
      _v2 = GLib::Lib.g_tree_upper_bound(self, _v1)
      _v3 = GLib::TreeNode.wrap_copy(_v2)
      return _v3
    end
  end
  class GLib::TreeNode < GirFFI::StructBase
  
    def key
      _v1 = GLib::Lib.g_tree_node_key(self)
      return _v1
    end
    def next
      _v1 = GLib::Lib.g_tree_node_next(self)
      _v2 = GLib::TreeNode.wrap_copy(_v1)
      return _v2
    end
    def previous
      _v1 = GLib::Lib.g_tree_node_previous(self)
      _v2 = GLib::TreeNode.wrap_copy(_v1)
      return _v2
    end
    def value
      _v1 = GLib::Lib.g_tree_node_value(self)
      return _v1
    end
  end
  class GLib::Tuples < GirFFI::StructBase
  
    def destroy
      GLib::Lib.g_tuples_destroy(self)
    end
    def index(index_, field)
      _v1 = index_
      _v2 = field
      _v3 = GLib::Lib.g_tuples_index(self, _v1, _v2)
      return _v3
    end
    def len
      _v1 = @struct.to_ptr
      _v2 = _v1.get_uint32(0)
      _v2
    end
    def len=(value)
      _v1 = @struct.to_ptr
      _v2 = value
      _v1.put_uint32(0, _v2)
    end
  end
  UNICHAR_MAX_DECOMPOSITION_LENGTH = 18
  URI_RESERVED_CHARS_GENERIC_DELIMITERS = ":/?#[]@"
  URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS = "!$&'()*+,;="
  USEC_PER_SEC = 1000000
  # XXX: Don't know how to print enum
  # XXX: Don't know how to print enum
  # XXX: Don't know how to print enum
  # XXX: Don't know how to print callback
  class GLib::UnixPipe < GirFFI::StructBase
  
    def fds
      _v1 = @struct.to_ptr
      _v2 = GirFFI::SizedArray.get_value_from_pointer(_v1, 0)
      _v3 = GirFFI::SizedArray.wrap(:gint32, 2, _v2)
      _v3
    end
    def fds=(value)
      _v1 = @struct.to_ptr
      GirFFI::ArgHelper.check_fixed_array_size(2, value, "value")
      _v2 = GirFFI::SizedArray.copy_from(:gint32, 2, value)
      GirFFI::SizedArray.copy_value_to_pointer(_v2, _v1)
    end
  end
  # XXX: Don't know how to print enum
  class GLib::Uri < GirFFI::BoxedBase
    def self.build(flags, scheme, userinfo, host, port, path, query = nil, fragment = nil)
      _v1 = flags
      _v2 = GirFFI::InPointer.from_utf8(scheme)
      _v3 = GirFFI::InPointer.from_utf8(userinfo)
      _v4 = GirFFI::InPointer.from_utf8(host)
      _v5 = port
      _v6 = GirFFI::InPointer.from_utf8(path)
      _v7 = GirFFI::InPointer.from_utf8(query)
      _v8 = GirFFI::InPointer.from_utf8(fragment)
      _v9 = GLib::Lib.g_uri_build(_v1, _v2, _v3, _v4, _v5, _v6, _v7, _v8)
      _v10 = GLib::Uri.wrap_own(_v9)
      return _v10
    end
    def self.build_with_user(flags, scheme, user, password, auth_params, host, port, path, query = nil, fragment = nil)
      _v1 = flags
      _v2 = GirFFI::InPointer.from_utf8(scheme)
      _v3 = GirFFI::InPointer.from_utf8(user)
      _v4 = GirFFI::InPointer.from_utf8(password)
      _v5 = GirFFI::InPointer.from_utf8(auth_params)
      _v6 = GirFFI::InPointer.from_utf8(host)
      _v7 = port
      _v8 = GirFFI::InPointer.from_utf8(path)
      _v9 = GirFFI::InPointer.from_utf8(query)
      _v10 = GirFFI::InPointer.from_utf8(fragment)
      _v11 = GLib::Lib.g_uri_build_with_user(_v1, _v2, _v3, _v4, _v5, _v6, _v7, _v8, _v9, _v10)
      _v12 = GLib::Uri.wrap_own(_v11)
      return _v12
    end
    def self.error_quark
      _v1 = GLib::Lib.g_uri_error_quark
      return _v1
    end
    def self.escape_bytes(unescaped, reserved_chars_allowed = nil)
      length = unescaped.nil? ? (0) : (unescaped.length)
      _v1 = length
      _v2 = GirFFI::InPointer.from_utf8(reserved_chars_allowed)
      _v3 = GirFFI::SizedArray.from(:guint8, -1, unescaped)
      _v4 = GLib::Lib.g_uri_escape_bytes(_v3, _v1, _v2)
      _v5 = GirFFI::AllocationHelper.free_after(_v4, &:to_utf8)
      return _v5
    end
    def self.escape_string(unescaped, reserved_chars_allowed, allow_utf8)
      _v1 = GirFFI::InPointer.from_utf8(unescaped)
      _v2 = GirFFI::InPointer.from_utf8(reserved_chars_allowed)
      _v3 = allow_utf8
      _v4 = GLib::Lib.g_uri_escape_string(_v1, _v2, _v3)
      _v5 = GirFFI::AllocationHelper.free_after(_v4, &:to_utf8)
      return _v5
    end
    def self.is_valid(uri_string, flags)
      _v1 = GirFFI::InPointer.from_utf8(uri_string)
      _v2 = flags
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_uri_is_valid(_v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      return _v4
    end
    def self.join(flags, scheme, userinfo, host, port, path, query = nil, fragment = nil)
      _v1 = flags
      _v2 = GirFFI::InPointer.from_utf8(scheme)
      _v3 = GirFFI::InPointer.from_utf8(userinfo)
      _v4 = GirFFI::InPointer.from_utf8(host)
      _v5 = port
      _v6 = GirFFI::InPointer.from_utf8(path)
      _v7 = GirFFI::InPointer.from_utf8(query)
      _v8 = GirFFI::InPointer.from_utf8(fragment)
      _v9 = GLib::Lib.g_uri_join(_v1, _v2, _v3, _v4, _v5, _v6, _v7, _v8)
      _v10 = GirFFI::AllocationHelper.free_after(_v9, &:to_utf8)
      return _v10
    end
    def self.join_with_user(flags, scheme, user, password, auth_params, host, port, path, query = nil, fragment = nil)
      _v1 = flags
      _v2 = GirFFI::InPointer.from_utf8(scheme)
      _v3 = GirFFI::InPointer.from_utf8(user)
      _v4 = GirFFI::InPointer.from_utf8(password)
      _v5 = GirFFI::InPointer.from_utf8(auth_params)
      _v6 = GirFFI::InPointer.from_utf8(host)
      _v7 = port
      _v8 = GirFFI::InPointer.from_utf8(path)
      _v9 = GirFFI::InPointer.from_utf8(query)
      _v10 = GirFFI::InPointer.from_utf8(fragment)
      _v11 = GLib::Lib.g_uri_join_with_user(_v1, _v2, _v3, _v4, _v5, _v6, _v7, _v8, _v9, _v10)
      _v12 = GirFFI::AllocationHelper.free_after(_v11, &:to_utf8)
      return _v12
    end
    def self.list_extract_uris(uri_list)
      _v1 = GirFFI::InPointer.from_utf8(uri_list)
      _v2 = GLib::Lib.g_uri_list_extract_uris(_v1)
      _v3 = GLib::Strv.wrap(_v2)
      return _v3
    end
    def self.parse(uri_string, flags)
      _v1 = GirFFI::InPointer.from_utf8(uri_string)
      _v2 = flags
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_uri_parse(_v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      _v5 = GLib::Uri.wrap_own(_v4)
      return _v5
    end
    def self.parse_params(params, length, separators, flags)
      _v1 = GirFFI::InPointer.from_utf8(params)
      _v2 = length
      _v3 = GirFFI::InPointer.from_utf8(separators)
      _v4 = flags
      _v5 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v6 = GLib::Lib.g_uri_parse_params(_v1, _v2, _v3, _v4, _v5)
      GirFFI::ArgHelper.check_error(_v5)
      _v7 = GLib::HashTable.wrap([:utf8, :utf8], _v6)
      return _v7
    end
    def self.parse_scheme(uri)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = GLib::Lib.g_uri_parse_scheme(_v1)
      _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
      return _v3
    end
    def self.peek_scheme(uri)
      _v1 = GirFFI::InPointer.from_utf8(uri)
      _v2 = GLib::Lib.g_uri_peek_scheme(_v1)
      _v3 = _v2.to_utf8
      return _v3
    end
    def self.resolve_relative(base_uri_string, uri_ref, flags)
      _v1 = GirFFI::InPointer.from_utf8(base_uri_string)
      _v2 = GirFFI::InPointer.from_utf8(uri_ref)
      _v3 = flags
      _v4 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v5 = GLib::Lib.g_uri_resolve_relative(_v1, _v2, _v3, _v4)
      GirFFI::ArgHelper.check_error(_v4)
      _v6 = GirFFI::AllocationHelper.free_after(_v5, &:to_utf8)
      return _v6
    end
    def self.split(uri_ref, flags)
      _v1 = GirFFI::InPointer.from_utf8(uri_ref)
      _v2 = flags
      _v3 = FFI::MemoryPointer.new(:pointer)
      _v4 = FFI::MemoryPointer.new(:pointer)
      _v5 = FFI::MemoryPointer.new(:pointer)
      _v6 = FFI::MemoryPointer.new(:int32)
      _v7 = FFI::MemoryPointer.new(:pointer)
      _v8 = FFI::MemoryPointer.new(:pointer)
      _v9 = FFI::MemoryPointer.new(:pointer)
      _v10 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      GLib::Lib.g_uri_split(_v1, _v2, _v3, _v4, _v5, _v6, _v7, _v8, _v9, _v10)
      GirFFI::ArgHelper.check_error(_v10)
      _v11 = GirFFI::AllocationHelper.free_after(_v3.get_pointer(0), &:to_utf8)
      _v12 = GirFFI::AllocationHelper.free_after(_v4.get_pointer(0), &:to_utf8)
      _v13 = GirFFI::AllocationHelper.free_after(_v5.get_pointer(0), &:to_utf8)
      _v14 = _v6.get_int32(0)
      _v15 = GirFFI::AllocationHelper.free_after(_v7.get_pointer(0), &:to_utf8)
      _v16 = GirFFI::AllocationHelper.free_after(_v8.get_pointer(0), &:to_utf8)
      _v17 = GirFFI::AllocationHelper.free_after(_v9.get_pointer(0), &:to_utf8)
      return [_v11, _v12, _v13, _v14, _v15, _v16, _v17]
    end
    def self.split_network(uri_string, flags)
      _v1 = GirFFI::InPointer.from_utf8(uri_string)
      _v2 = flags
      _v3 = FFI::MemoryPointer.new(:pointer)
      _v4 = FFI::MemoryPointer.new(:pointer)
      _v5 = FFI::MemoryPointer.new(:int32)
      _v6 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      GLib::Lib.g_uri_split_network(_v1, _v2, _v3, _v4, _v5, _v6)
      GirFFI::ArgHelper.check_error(_v6)
      _v7 = GirFFI::AllocationHelper.free_after(_v3.get_pointer(0), &:to_utf8)
      _v8 = GirFFI::AllocationHelper.free_after(_v4.get_pointer(0), &:to_utf8)
      _v9 = _v5.get_int32(0)
      return [_v7, _v8, _v9]
    end
    def self.split_with_user(uri_ref, flags)
      _v1 = GirFFI::InPointer.from_utf8(uri_ref)
      _v2 = flags
      _v3 = FFI::MemoryPointer.new(:pointer)
      _v4 = FFI::MemoryPointer.new(:pointer)
      _v5 = FFI::MemoryPointer.new(:pointer)
      _v6 = FFI::MemoryPointer.new(:pointer)
      _v7 = FFI::MemoryPointer.new(:pointer)
      _v8 = FFI::MemoryPointer.new(:int32)
      _v9 = FFI::MemoryPointer.new(:pointer)
      _v10 = FFI::MemoryPointer.new(:pointer)
      _v11 = FFI::MemoryPointer.new(:pointer)
      _v12 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      GLib::Lib.g_uri_split_with_user(_v1, _v2, _v3, _v4, _v5, _v6, _v7, _v8, _v9, _v10, _v11, _v12)
      GirFFI::ArgHelper.check_error(_v12)
      _v13 = GirFFI::AllocationHelper.free_after(_v3.get_pointer(0), &:to_utf8)
      _v14 = GirFFI::AllocationHelper.free_after(_v4.get_pointer(0), &:to_utf8)
      _v15 = GirFFI::AllocationHelper.free_after(_v5.get_pointer(0), &:to_utf8)
      _v16 = GirFFI::AllocationHelper.free_after(_v6.get_pointer(0), &:to_utf8)
      _v17 = GirFFI::AllocationHelper.free_after(_v7.get_pointer(0), &:to_utf8)
      _v18 = _v8.get_int32(0)
      _v19 = GirFFI::AllocationHelper.free_after(_v9.get_pointer(0), &:to_utf8)
      _v20 = GirFFI::AllocationHelper.free_after(_v10.get_pointer(0), &:to_utf8)
      _v21 = GirFFI::AllocationHelper.free_after(_v11.get_pointer(0), &:to_utf8)
      return [_v13, _v14, _v15, _v16, _v17, _v18, _v19, _v20, _v21]
    end
    def self.unescape_bytes(escaped_string, length, illegal_characters = nil)
      _v1 = GirFFI::InPointer.from_utf8(escaped_string)
      _v2 = length
      _v3 = GirFFI::InPointer.from_utf8(illegal_characters)
      _v4 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v5 = GLib::Lib.g_uri_unescape_bytes(_v1, _v2, _v3, _v4)
      GirFFI::ArgHelper.check_error(_v4)
      _v6 = GLib::Bytes.wrap_own(_v5)
      return _v6
    end
    def self.unescape_segment(escaped_string = nil, escaped_string_end = nil, illegal_characters = nil)
      _v1 = GirFFI::InPointer.from_utf8(escaped_string)
      _v2 = GirFFI::InPointer.from_utf8(escaped_string_end)
      _v3 = GirFFI::InPointer.from_utf8(illegal_characters)
      _v4 = GLib::Lib.g_uri_unescape_segment(_v1, _v2, _v3)
      _v5 = GirFFI::AllocationHelper.free_after(_v4, &:to_utf8)
      return _v5
    end
    def self.unescape_string(escaped_string, illegal_characters = nil)
      _v1 = GirFFI::InPointer.from_utf8(escaped_string)
      _v2 = GirFFI::InPointer.from_utf8(illegal_characters)
      _v3 = GLib::Lib.g_uri_unescape_string(_v1, _v2)
      _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
      return _v4
    end
    def get_auth_params
      _v1 = GLib::Lib.g_uri_get_auth_params(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def get_flags
      _v1 = GLib::Lib.g_uri_get_flags(self)
      return _v1
    end
    def get_fragment
      _v1 = GLib::Lib.g_uri_get_fragment(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def get_host
      _v1 = GLib::Lib.g_uri_get_host(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def get_password
      _v1 = GLib::Lib.g_uri_get_password(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def get_path
      _v1 = GLib::Lib.g_uri_get_path(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def get_port
      _v1 = GLib::Lib.g_uri_get_port(self)
      return _v1
    end
    def get_query
      _v1 = GLib::Lib.g_uri_get_query(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def get_scheme
      _v1 = GLib::Lib.g_uri_get_scheme(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def get_user
      _v1 = GLib::Lib.g_uri_get_user(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def get_userinfo
      _v1 = GLib::Lib.g_uri_get_userinfo(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def parse_relative(uri_ref, flags)
      _v1 = GirFFI::InPointer.from_utf8(uri_ref)
      _v2 = flags
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_uri_parse_relative(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      _v5 = GLib::Uri.wrap_own(_v4)
      return _v5
    end
    def to_string
      _v1 = GLib::Lib.g_uri_to_string(self)
      _v2 = GirFFI::AllocationHelper.free_after(_v1, &:to_utf8)
      return _v2
    end
    def to_string_partial(flags)
      _v1 = flags
      _v2 = GLib::Lib.g_uri_to_string_partial(self, _v1)
      _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
      return _v3
    end
    alias_method 'auth_params', 'get_auth_params'
    alias_method 'flags', 'get_flags'
    alias_method 'fragment', 'get_fragment'
    alias_method 'host', 'get_host'
    alias_method 'password', 'get_password'
    alias_method 'path', 'get_path'
    alias_method 'port', 'get_port'
    alias_method 'query', 'get_query'
    alias_method 'scheme', 'get_scheme'
    alias_method 'user', 'get_user'
    alias_method 'userinfo', 'get_userinfo'
  end
  # XXX: Don't know how to print enum
  # XXX: Don't know how to print flags
  # XXX: Don't know how to print flags
  # XXX: Don't know how to print flags
  class GLib::UriParamsIter < GirFFI::StructBase
  
    def dummy0
      _v1 = @struct.to_ptr
      _v2 = _v1.get_int32(0)
      _v2
    end
    def dummy1
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(8)
      _v2
    end
    def dummy2
      _v1 = @struct.to_ptr
      _v2 = _v1.get_pointer(16)
      _v2
    end
    def dummy3
      _v1 = @struct.to_ptr
      _v2 = GirFFI::SizedArray.get_value_from_pointer(_v1, 24)
      _v3 = GirFFI::SizedArray.wrap(:guint8, 256, _v2)
      _v3
    end
    def init(params, length, separators, flags)
      _v1 = GirFFI::InPointer.from_utf8(params)
      _v2 = length
      _v3 = GirFFI::InPointer.from_utf8(separators)
      _v4 = flags
      GLib::Lib.g_uri_params_iter_init(self, _v1, _v2, _v3, _v4)
    end
    def next
      _v1 = FFI::MemoryPointer.new(:pointer)
      _v2 = FFI::MemoryPointer.new(:pointer)
      _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v4 = GLib::Lib.g_uri_params_iter_next(self, _v1, _v2, _v3)
      GirFFI::ArgHelper.check_error(_v3)
      _v5 = GirFFI::AllocationHelper.free_after(_v1.get_pointer(0), &:to_utf8)
      _v6 = GirFFI::AllocationHelper.free_after(_v2.get_pointer(0), &:to_utf8)
      return [_v4, _v5, _v6]
    end
  end
  # XXX: Don't know how to print enum
  VA_COPY_AS_ARRAY = 1
  VERSION_MIN_REQUIRED = 2
  class GLib::Variant < GirFFI::StructBase
    def self.is_object_path(string)
      _v1 = GirFFI::InPointer.from_utf8(string)
      _v2 = GLib::Lib.g_variant_is_object_path(_v1)
      return _v2
    end
    def self.is_signature(string)
      _v1 = GirFFI::InPointer.from_utf8(string)
      _v2 = GLib::Lib.g_variant_is_signature(_v1)
      return _v2
    end
    def self.new_array(*args, &block)
      raise(NoMethodError) unless (self == GLib::Variant)
      obj = allocate
      obj.__send__(:initialize_array, *args, &block)
      obj
    end
    def self.new_boolean(*args, &block)
      raise(NoMethodError) unless (self == GLib::Variant)
      obj = allocate
      obj.__send__(:initialize_boolean, *args, &block)
      obj
    end
    def self.new_byte(*args, &block)
      raise(NoMethodError) unless (self == GLib::Variant)
      obj = allocate
      obj.__send__(:initialize_byte, *args, &block)
      obj
    end
    def self.new_bytestring(*args, &block)
      raise(NoMethodError) unless (self == GLib::Variant)
      obj = allocate
      obj.__send__(:initialize_bytestring, *args, &block)
      obj
    end
    def self.new_bytestring_array(*args, &block)
      raise(NoMethodError) unless (self == GLib::Variant)
      obj = allocate
      obj.__send__(:initialize_bytestring_array, *args, &block)
      obj
    end
    def self.new_dict_entry(*args, &block)
      raise(NoMethodError) unless (self == GLib::Variant)
      obj = allocate
      obj.__send__(:initialize_dict_entry, *args, &block)
      obj
    end
    def self.new_double(*args, &block)
      raise(NoMethodError) unless (self == GLib::Variant)
      obj = allocate
      obj.__send__(:initialize_double, *args, &block)
      obj
    end
    def self.new_fixed_array(*args, &block)
      raise(NoMethodError) unless (self == GLib::Variant)
      obj = allocate
      obj.__send__(:initialize_fixed_array, *args, &block)
      obj
    end
    def self.new_from_bytes(*args, &block)
      raise(NoMethodError) unless (self == GLib::Variant)
      obj = allocate
      obj.__send__(:initialize_from_bytes, *args, &block)
      obj
    end
    def self.new_from_data(*args, &block)
      raise(NoMethodError) unless (self == GLib::Variant)
      obj = allocate
      obj.__send__(:initialize_from_data, *args, &block)
      obj
    end
    def self.new_handle(*args, &block)
      raise(NoMethodError) unless (self == GLib::Variant)
      obj = allocate
      obj.__send__(:initialize_handle, *args, &block)
      obj
    end
    def self.new_int16(*args, &block)
      raise(NoMethodError) unless (self == GLib::Variant)
      obj = allocate
      obj.__send__(:initialize_int16, *args, &block)
      obj
    end
    def self.new_int32(*args, &block)
      raise(NoMethodError) unless (self == GLib::Variant)
      obj = allocate
      obj.__send__(:initialize_int32, *args, &block)
      obj
    end
    def self.new_int64(*args, &block)
      raise(NoMethodError) unless (self == GLib::Variant)
      obj = allocate
      obj.__send__(:initialize_int64, *args, &block)
      obj
    end
    def self.new_maybe(*args, &block)
      raise(NoMethodError) unless (self == GLib::Variant)
      obj = allocate
      obj.__send__(:initialize_maybe, *args, &block)
      obj
    end
    def self.new_object_path(*args, &block)
      raise(NoMethodError) unless (self == GLib::Variant)
      obj = allocate
      obj.__send__(:initialize_object_path, *args, &block)
      obj
    end
    def self.new_objv(*args, &block)
      raise(NoMethodError) unless (self == GLib::Variant)
      obj = allocate
      obj.__send__(:initialize_objv, *args, &block)
      obj
    end
    def self.new_signature(*args, &block)
      raise(NoMethodError) unless (self == GLib::Variant)
      obj = allocate
      obj.__send__(:initialize_signature, *args, &block)
      obj
    end
    def self.new_string(*args, &block)
      raise(NoMethodError) unless (self == GLib::Variant)
      obj = allocate
      obj.__send__(:initialize_string, *args, &block)
      obj
    end
    def self.new_strv(*args, &block)
      raise(NoMethodError) unless (self == GLib::Variant)
      obj = allocate
      obj.__send__(:initialize_strv, *args, &block)
      obj
    end
    def self.new_tuple(*args, &block)
      raise(NoMethodError) unless (self == GLib::Variant)
      obj = allocate
      obj.__send__(:initialize_tuple, *args, &block)
      obj
    end
    def self.new_uint16(*args, &block)
      raise(NoMethodError) unless (self == GLib::Variant)
      obj = allocate
      obj.__send__(:initialize_uint16, *args, &block)
      obj
    end
    def self.new_uint32(*args, &block)
      raise(NoMethodError) unless (self == GLib::Variant)
      obj = allocate
      obj.__send__(:initialize_uint32, *args, &block)
      obj
    end
    def self.new_uint64(*args, &block)
      raise(NoMethodError) unless (self == GLib::Variant)
      obj = allocate
      obj.__send__(:initialize_uint64, *args, &block)
      obj
    end
    def self.new_variant(*args, &block)
      raise(NoMethodError) unless (self == GLib::Variant)
      obj = allocate
      obj.__send__(:initialize_variant, *args, &block)
      obj
    end
    def self.parse(type, text, limit = nil, endptr = nil)
      _v1 = GLib::VariantType.from(type)
      _v2 = GirFFI::InPointer.from_utf8(text)
      _v3 = GirFFI::InPointer.from_utf8(limit)
      _v4 = GirFFI::InPointer.from_utf8(endptr)
      _v5 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
      _v6 = GLib::Lib.g_variant_parse(_v1, _v2, _v3, _v4, _v5)
      GirFFI::ArgHelper.check_error(_v5)
      _v7 = GLib::Variant.wrap_own(_v6)
      return _v7
    end
    def self.parse_error_print_context(error, source_str)
      _v1 = GLib::Error.from(error)
      _v2 = GirFFI::InPointer.from_utf8(source_str)
      _v3 = GLib::Lib.g_variant_parse_error_print_context(_v1, _v2)
      _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
      return _v4
    end
    def self.parse_error_quark
      _v1 = GLib::Lib.g_variant_parse_error_quark
      return _v1
    end
    def self.parser_get_error_quark
      _v1 = GLib::Lib.g_variant_parser_get_error_quark
      return _v1
    end
    def self.wrap_copy(val)
      wrap(val)
    end
    def byteswap
      _v1 = GLib::Lib.g_variant_byteswap(self)
      _v2 = GLib::Variant.wrap_own(_v1)
      return _v2
    end
    def check_format_string(format_string, copy_only)
      _v1 = GirFFI::InPointer.from_utf8(format_string)
      _v2 = copy_only
      _v3 = GLib::Lib.g_variant_check_format_string(self, _v1, _v2)
      return _v3
    end
    def classify
      _v1 = GLib::Lib.g_variant_classify(self)
      return _v1
    end
    def compare(two)
      _v1 = GLib::Variant.from(two)
      _v2 = GLib::Lib.g_variant_compare(self, _v1)
      return _v2
    end
    def dup_bytestring
      _v1 = FFI::MemoryPointer.new(:uint64)
      _v2 = GLib::Lib.g_variant_dup_bytestring(self, _v1)
      _v3 = _v1.get_uint64(0)
      _v4 = GirFFI::ZeroTerminated.wrap(:guint8, _v2)
      return _v4
    end
    def dup_bytestring_array
      _v1 = FFI::MemoryPointer.new(:uint64)
      _v2 = GLib::Lib.g_variant_dup_bytestring_array(self, _v1)
      _v3 = _v1.get_uint64(0)
      _v4 = GirFFI::SizedArray.wrap(:utf8, _v3, _v2)
      return _v4
    end
    def dup_objv
      _v1 = FFI::MemoryPointer.new(:uint64)
      _v2 = GLib::Lib.g_variant_dup_objv(self, _v1)
      _v3 = GLib::Strv.wrap(_v2)
      return _v3
    end
    def dup_string
      _v1 = FFI::MemoryPointer.new(:uint64)
      _v2 = GLib::Lib.g_variant_dup_string(self, _v1)
      _v3 = _v1.get_uint64(0)
      _v4 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
      return [_v4, _v3]
    end
    def dup_strv
      _v1 = FFI::MemoryPointer.new(:uint64)
      _v2 = GLib::Lib.g_variant_dup_strv(self, _v1)
      _v3 = GLib::Strv.wrap(_v2)
      return _v3
    end
    def equal(two)
      _v1 = GLib::Variant.from(two)
      _v2 = GLib::Lib.g_variant_equal(self, _v1)
      return _v2
    end
    def get_boolean
      _v1 = GLib::Lib.g_variant_get_boolean(self)
      return _v1
    end
    def get_byte
      _v1 = GLib::Lib.g_variant_get_byte(self)
      return _v1
    end
    def get_bytestring
      _v1 = GLib::Lib.g_variant_get_bytestring(self)
      _v2 = GirFFI::ZeroTerminated.wrap(:guint8, _v1)
      return _v2
    end
    def get_bytestring_array
      _v1 = FFI::MemoryPointer.new(:uint64)
      _v2 = GLib::Lib.g_variant_get_bytestring_array(self, _v1)
      _v3 = _v1.get_uint64(0)
      _v4 = GirFFI::SizedArray.wrap(:utf8, _v3, _v2)
      return _v4
    end
    def get_child_value(index_)
      _v1 = index_
      _v2 = GLib::Lib.g_variant_get_child_value(self, _v1)
      _v3 = GLib::Variant.wrap_own(_v2)
      return _v3
    end
    def get_data
      _v1 = GLib::Lib.g_variant_get_data(self)
      return _v1
    end
    def get_data_as_bytes
      _v1 = GLib::Lib.g_variant_get_data_as_bytes(self)
      _v2 = GLib::Bytes.wrap_own(_v1)
      return _v2
    end
    def get_double
      _v1 = GLib::Lib.g_variant_get_double(self)
      return _v1
    end
    def get_handle
      _v1 = GLib::Lib.g_variant_get_handle(self)
      return _v1
    end
    def get_int16
      _v1 = GLib::Lib.g_variant_get_int16(self)
      return _v1
    end
    def get_int32
      _v1 = GLib::Lib.g_variant_get_int32(self)
      return _v1
    end
    def get_int64
      _v1 = GLib::Lib.g_variant_get_int64(self)
      return _v1
    end
    def get_maybe
      _v1 = GLib::Lib.g_variant_get_maybe(self)
      _v2 = GLib::Variant.wrap_own(_v1)
      return _v2
    end
    def get_normal_form
      _v1 = GLib::Lib.g_variant_get_normal_form(self)
      _v2 = GLib::Variant.wrap_own(_v1)
      return _v2
    end
    def get_objv
      _v1 = FFI::MemoryPointer.new(:uint64)
      _v2 = GLib::Lib.g_variant_get_objv(self, _v1)
      _v3 = GLib::Strv.wrap(_v2)
      return _v3
    end
    def get_size
      _v1 = GLib::Lib.g_variant_get_size(self)
      return _v1
    end
    def get_string_with_override
      get_string_without_override.first
    end
    def get_strv
      _v1 = FFI::MemoryPointer.new(:uint64)
      _v2 = GLib::Lib.g_variant_get_strv(self, _v1)
      _v3 = GLib::Strv.wrap(_v2)
      return _v3
    end
    def get_type
      _v1 = GLib::Lib.g_variant_get_type(self)
      _v2 = GLib::VariantType.wrap_copy(_v1)
      return _v2
    end
    def get_type_string
      _v1 = GLib::Lib.g_variant_get_type_string(self)
      _v2 = _v1.to_utf8
      return _v2
    end
    def get_uint16
      _v1 = GLib::Lib.g_variant_get_uint16(self)
      return _v1
    end
    def get_uint32
      _v1 = GLib::Lib.g_variant_get_uint32(self)
      return _v1
    end
    def get_uint64
      _v1 = GLib::Lib.g_variant_get_uint64(self)
      return _v1
    end
    def get_variant
      _v1 = GLib::Lib.g_variant_get_variant(self)
      _v2 = GLib::Variant.wrap_own(_v1)
      return _v2
    end
    def hash
      _v1 = GLib::Lib.g_variant_hash(self)
      return _v1
    end
    def initialize_array(child_type = nil, children = nil)
      _v1 = GLib::VariantType.from(child_type)
      n_children = children.nil? ? (0) : (children.length)
      _v2 = n_children
      _v3 = GirFFI::SizedArray.from([:pointer, GLib::Variant], -1, children)
      _v4 = GLib::Lib.g_variant_new_array(_v1, _v3, _v2)
      store_pointer(_v4)
      @struct.owned = true
    end
    def initialize_boolean(value)
      _v1 = value
      _v2 = GLib::Lib.g_variant_new_boolean(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_byte(value)
      _v1 = value
      _v2 = GLib::Lib.g_variant_new_byte(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_bytestring(string)
      _v1 = GirFFI::ZeroTerminated.from(:guint8, string)
      _v2 = GLib::Lib.g_variant_new_bytestring(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_bytestring_array(strv)
      length = strv.nil? ? (0) : (strv.length)
      _v1 = length
      _v2 = GirFFI::SizedArray.from(:utf8, -1, strv)
      _v3 = GLib::Lib.g_variant_new_bytestring_array(_v2, _v1)
      store_pointer(_v3)
      @struct.owned = true
    end
    def initialize_dict_entry(key, value)
      _v1 = GLib::Variant.from(key)
      _v2 = GLib::Variant.from(value)
      _v3 = GLib::Lib.g_variant_new_dict_entry(_v1, _v2)
      store_pointer(_v3)
      @struct.owned = true
    end
    def initialize_double(value)
      _v1 = value
      _v2 = GLib::Lib.g_variant_new_double(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_fixed_array(element_type, elements, n_elements, element_size)
      _v1 = GLib::VariantType.from(element_type)
      _v2 = elements
      _v3 = n_elements
      _v4 = element_size
      _v5 = GLib::Lib.g_variant_new_fixed_array(_v1, _v2, _v3, _v4)
      store_pointer(_v5)
      @struct.owned = true
    end
    def initialize_from_bytes(type, bytes, trusted)
      _v1 = GLib::VariantType.from(type)
      _v2 = GLib::Bytes.from(bytes)
      _v3 = trusted
      _v4 = GLib::Lib.g_variant_new_from_bytes(_v1, _v2, _v3)
      store_pointer(_v4)
      @struct.owned = true
    end
    def initialize_from_data(type, data, trusted, user_data = nil, &notify)
      _v1 = GLib::VariantType.from(type)
      size = data.nil? ? (0) : (data.length)
      _v2 = size
      _v3 = trusted
      _v4 = GLib::DestroyNotify.from(notify)
      _v5 = user_data
      _v6 = GirFFI::SizedArray.from(:guint8, -1, data)
      _v7 = GLib::Lib.g_variant_new_from_data(_v1, _v6, _v2, _v3, _v4, _v5)
      store_pointer(_v7)
      @struct.owned = true
    end
    def initialize_handle(value)
      _v1 = value
      _v2 = GLib::Lib.g_variant_new_handle(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_int16(value)
      _v1 = value
      _v2 = GLib::Lib.g_variant_new_int16(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_int32(value)
      _v1 = value
      _v2 = GLib::Lib.g_variant_new_int32(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_int64(value)
      _v1 = value
      _v2 = GLib::Lib.g_variant_new_int64(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_maybe(child_type = nil, child = nil)
      _v1 = GLib::VariantType.from(child_type)
      _v2 = GLib::Variant.from(child)
      _v3 = GLib::Lib.g_variant_new_maybe(_v1, _v2)
      store_pointer(_v3)
      @struct.owned = true
    end
    def initialize_object_path(object_path)
      _v1 = GirFFI::InPointer.from_utf8(object_path)
      _v2 = GLib::Lib.g_variant_new_object_path(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_objv(strv)
      length = strv.nil? ? (0) : (strv.length)
      _v1 = length
      _v2 = GirFFI::SizedArray.from(:utf8, -1, strv)
      _v3 = GLib::Lib.g_variant_new_objv(_v2, _v1)
      store_pointer(_v3)
      @struct.owned = true
    end
    def initialize_signature(signature)
      _v1 = GirFFI::InPointer.from_utf8(signature)
      _v2 = GLib::Lib.g_variant_new_signature(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_string(string)
      _v1 = GirFFI::InPointer.from_utf8(string)
      _v2 = GLib::Lib.g_variant_new_string(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_strv(strv)
      length = strv.nil? ? (0) : (strv.length)
      _v1 = length
      _v2 = GirFFI::SizedArray.from(:utf8, -1, strv)
      _v3 = GLib::Lib.g_variant_new_strv(_v2, _v1)
      store_pointer(_v3)
      @struct.owned = true
    end
    def initialize_tuple(children)
      n_children = children.nil? ? (0) : (children.length)
      _v1 = n_children
      _v2 = GirFFI::SizedArray.from([:pointer, GLib::Variant], -1, children)
      _v3 = GLib::Lib.g_variant_new_tuple(_v2, _v1)
      store_pointer(_v3)
      @struct.owned = true
    end
    def initialize_uint16(value)
      _v1 = value
      _v2 = GLib::Lib.g_variant_new_uint16(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_uint32(value)
      _v1 = value
      _v2 = GLib::Lib.g_variant_new_uint32(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_uint64(value)
      _v1 = value
      _v2 = GLib::Lib.g_variant_new_uint64(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_variant(value)
      _v1 = GLib::Variant.from(value)
      _v2 = GLib::Lib.g_variant_new_variant(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def is_container
      _v1 = GLib::Lib.g_variant_is_container(self)
      return _v1
    end
    def is_floating
      _v1 = GLib::Lib.g_variant_is_floating(self)
      return _v1
    end
    def is_normal_form
      _v1 = GLib::Lib.g_variant_is_normal_form(self)
      return _v1
    end
    def is_of_type(type)
      _v1 = GLib::VariantType.from(type)
      _v2 = GLib::Lib.g_variant_is_of_type(self, _v1)
      return _v2
    end
    def lookup_value(key, expected_type = nil)
      _v1 = GirFFI::InPointer.from_utf8(key)
      _v2 = GLib::VariantType.from(expected_type)
      _v3 = GLib::Lib.g_variant_lookup_value(self, _v1, _v2)
      _v4 = GLib::Variant.wrap_own(_v3)
      return _v4
    end
    def n_children
      _v1 = GLib::Lib.g_variant_n_children(self)
      return _v1
    end
    def print(type_annotate)
      _v1 = type_annotate
      _v2 = GLib::Lib.g_variant_print(self, _v1)
      _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
      return _v3
    end
    def ref
      _v1 = GLib::Lib.g_variant_ref(self)
      _v2 = GLib::Variant.wrap_own(_v1)
      return _v2
    end
    def ref_sink
      _v1 = GLib::Lib.g_variant_ref_sink(self)
      _v2 = GLib::Variant.wrap_own(_v1)
      return _v2
    end
    def store(data)
      _v1 = data
      GLib::Lib.g_variant_store(self, _v1)
    end
    # Initializing method used in constructors. For Variant the constructing
    # functions all return floating references, so this is need to take full
    # ownership.
    #
    # Also see the documentation for g_variant_ref_sink.
    def store_pointer(ptr)
      Lib.g_variant_ref_sink(ptr)
      super
    end
    def take_ref
      _v1 = GLib::Lib.g_variant_take_ref(self)
      _v2 = GLib::Variant.wrap_own(_v1)
      return _v2
    end
    def unref
      GLib::Lib.g_variant_unref(self)
    end
    alias_method 'boolean', 'get_boolean'
    alias_method 'byte', 'get_byte'
    alias_method 'bytestring', 'get_bytestring'
    alias_method 'bytestring_array', 'get_bytestring_array'
    alias_method 'child_value', 'get_child_value'
    alias_method 'data', 'get_data'
    alias_method 'data_as_bytes', 'get_data_as_bytes'
    alias_method 'double', 'get_double'
    alias_method 'get_string', 'get_string_with_override'
    alias_method 'get_string_without_override', 'get_string'
    alias_method 'handle', 'get_handle'
    alias_method 'int16', 'get_int16'
    alias_method 'int32', 'get_int32'
    alias_method 'int64', 'get_int64'
    alias_method 'maybe', 'get_maybe'
    alias_method 'normal_form', 'get_normal_form'
    alias_method 'objv', 'get_objv'
    alias_method 'size', 'get_size'
    alias_method 'string', 'get_string'
    alias_method 'strv', 'get_strv'
    alias_method 'type', 'get_type'
    alias_method 'type_string', 'get_type_string'
    alias_method 'uint16', 'get_uint16'
    alias_method 'uint32', 'get_uint32'
    alias_method 'uint64', 'get_uint64'
    alias_method 'variant', 'get_variant'
  end
  class GLib::VariantBuilder < GirFFI::BoxedBase
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def add_value(value)
      _v1 = GLib::Variant.from(value)
      GLib::Lib.g_variant_builder_add_value(self, _v1)
    end
    def close
      GLib::Lib.g_variant_builder_close(self)
    end
    def end
      _v1 = GLib::Lib.g_variant_builder_end(self)
      _v2 = GLib::Variant.wrap_copy(_v1)
      return _v2
    end
    def open(type)
      _v1 = GLib::VariantType.from(type)
      GLib::Lib.g_variant_builder_open(self, _v1)
    end
    def ref
      _v1 = GLib::Lib.g_variant_builder_ref(self)
      _v2 = GLib::VariantBuilder.wrap_own(_v1)
      return _v2
    end
    def unref
      GLib::Lib.g_variant_builder_unref(self)
    end
  end
  # XXX: Don't know how to print enum
  class GLib::VariantDict < GirFFI::BoxedBase
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def clear
      GLib::Lib.g_variant_dict_clear(self)
    end
    def contains(key)
      _v1 = GirFFI::InPointer.from_utf8(key)
      _v2 = GLib::Lib.g_variant_dict_contains(self, _v1)
      return _v2
    end
    def end
      _v1 = GLib::Lib.g_variant_dict_end(self)
      _v2 = GLib::Variant.wrap_copy(_v1)
      return _v2
    end
    def insert_value(key, value)
      _v1 = GirFFI::InPointer.from_utf8(key)
      _v2 = GLib::Variant.from(value)
      GLib::Lib.g_variant_dict_insert_value(self, _v1, _v2)
    end
    def lookup_value(key, expected_type = nil)
      _v1 = GirFFI::InPointer.from_utf8(key)
      _v2 = GLib::VariantType.from(expected_type)
      _v3 = GLib::Lib.g_variant_dict_lookup_value(self, _v1, _v2)
      _v4 = GLib::Variant.wrap_own(_v3)
      return _v4
    end
    def ref
      _v1 = GLib::Lib.g_variant_dict_ref(self)
      _v2 = GLib::VariantDict.wrap_own(_v1)
      return _v2
    end
    def remove(key)
      _v1 = GirFFI::InPointer.from_utf8(key)
      _v2 = GLib::Lib.g_variant_dict_remove(self, _v1)
      return _v2
    end
    def unref
      GLib::Lib.g_variant_dict_unref(self)
    end
  end
  # XXX: Don't know how to print enum
  class GLib::VariantType < GirFFI::BoxedBase
    def self.checked_(type_string)
      _v1 = GirFFI::InPointer.from_utf8(type_string)
      _v2 = GLib::Lib.g_variant_type_checked_(_v1)
      _v3 = GLib::VariantType.wrap_copy(_v2)
      return _v3
    end
    def self.new(*args, &block)
      obj = allocate
      obj.__send__(:initialize, *args, &block)
      obj
    end
    def self.new_array(*args, &block)
      raise(NoMethodError) unless (self == GLib::VariantType)
      obj = allocate
      obj.__send__(:initialize_array, *args, &block)
      obj
    end
    def self.new_dict_entry(*args, &block)
      raise(NoMethodError) unless (self == GLib::VariantType)
      obj = allocate
      obj.__send__(:initialize_dict_entry, *args, &block)
      obj
    end
    def self.new_maybe(*args, &block)
      raise(NoMethodError) unless (self == GLib::VariantType)
      obj = allocate
      obj.__send__(:initialize_maybe, *args, &block)
      obj
    end
    def self.new_tuple(*args, &block)
      raise(NoMethodError) unless (self == GLib::VariantType)
      obj = allocate
      obj.__send__(:initialize_tuple, *args, &block)
      obj
    end
    def self.string_get_depth_(type_string)
      _v1 = GirFFI::InPointer.from_utf8(type_string)
      _v2 = GLib::Lib.g_variant_type_string_get_depth_(_v1)
      return _v2
    end
    def self.string_is_valid(type_string)
      _v1 = GirFFI::InPointer.from_utf8(type_string)
      _v2 = GLib::Lib.g_variant_type_string_is_valid(_v1)
      return _v2
    end
    def self.string_scan(string, limit = nil)
      _v1 = GirFFI::InPointer.from_utf8(string)
      _v2 = GirFFI::InPointer.from_utf8(limit)
      _v3 = FFI::MemoryPointer.new(:pointer)
      _v4 = GLib::Lib.g_variant_type_string_scan(_v1, _v2, _v3)
      _v5 = GirFFI::AllocationHelper.free_after(_v3.get_pointer(0), &:to_utf8)
      return [_v4, _v5]
    end
    def copy
      _v1 = GLib::Lib.g_variant_type_copy(self)
      _v2 = GLib::VariantType.wrap_own(_v1)
      return _v2
    end
    def dup_string
      _v1 = GLib::Lib.g_variant_type_dup_string(self)
      _v2 = GirFFI::AllocationHelper.free_after(_v1, &:to_utf8)
      return _v2
    end
    def element
      _v1 = GLib::Lib.g_variant_type_element(self)
      _v2 = GLib::VariantType.wrap_copy(_v1)
      return _v2
    end
    def equal(type2)
      _v1 = GLib::VariantType.from(type2)
      _v2 = GLib::Lib.g_variant_type_equal(self, _v1)
      return _v2
    end
    def first
      _v1 = GLib::Lib.g_variant_type_first(self)
      _v2 = GLib::VariantType.wrap_copy(_v1)
      return _v2
    end
    def free
      GLib::Lib.g_variant_type_free(self)
    end
    def get_string_length
      _v1 = GLib::Lib.g_variant_type_get_string_length(self)
      return _v1
    end
    def hash
      _v1 = GLib::Lib.g_variant_type_hash(self)
      return _v1
    end
    def initialize_array(element)
      _v1 = GLib::VariantType.from(element)
      _v2 = GLib::Lib.g_variant_type_new_array(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_dict_entry(key, value)
      _v1 = GLib::VariantType.from(key)
      _v2 = GLib::VariantType.from(value)
      _v3 = GLib::Lib.g_variant_type_new_dict_entry(_v1, _v2)
      store_pointer(_v3)
      @struct.owned = true
    end
    def initialize_maybe(element)
      _v1 = GLib::VariantType.from(element)
      _v2 = GLib::Lib.g_variant_type_new_maybe(_v1)
      store_pointer(_v2)
      @struct.owned = true
    end
    def initialize_tuple(items)
      length = items.nil? ? (0) : (items.length)
      _v1 = length
      _v2 = GirFFI::SizedArray.from([:pointer, GLib::VariantType], -1, items)
      _v3 = GLib::Lib.g_variant_type_new_tuple(_v2, _v1)
      store_pointer(_v3)
      @struct.owned = true
    end
    def is_array
      _v1 = GLib::Lib.g_variant_type_is_array(self)
      return _v1
    end
    def is_basic
      _v1 = GLib::Lib.g_variant_type_is_basic(self)
      return _v1
    end
    def is_container
      _v1 = GLib::Lib.g_variant_type_is_container(self)
      return _v1
    end
    def is_definite
      _v1 = GLib::Lib.g_variant_type_is_definite(self)
      return _v1
    end
    def is_dict_entry
      _v1 = GLib::Lib.g_variant_type_is_dict_entry(self)
      return _v1
    end
    def is_maybe
      _v1 = GLib::Lib.g_variant_type_is_maybe(self)
      return _v1
    end
    def is_subtype_of(supertype)
      _v1 = GLib::VariantType.from(supertype)
      _v2 = GLib::Lib.g_variant_type_is_subtype_of(self, _v1)
      return _v2
    end
    def is_tuple
      _v1 = GLib::Lib.g_variant_type_is_tuple(self)
      return _v1
    end
    def is_variant
      _v1 = GLib::Lib.g_variant_type_is_variant(self)
      return _v1
    end
    def key
      _v1 = GLib::Lib.g_variant_type_key(self)
      _v2 = GLib::VariantType.wrap_copy(_v1)
      return _v2
    end
    def n_items
      _v1 = GLib::Lib.g_variant_type_n_items(self)
      return _v1
    end
    def next
      _v1 = GLib::Lib.g_variant_type_next(self)
      _v2 = GLib::VariantType.wrap_copy(_v1)
      return _v2
    end
    def value
      _v1 = GLib::Lib.g_variant_type_value(self)
      _v2 = GLib::VariantType.wrap_copy(_v1)
      return _v2
    end
    alias_method 'string_length', 'get_string_length'
  end
  # XXX: Don't know how to print callback
  WIN32_MSG_HANDLE = 19981206
  def self.access(filename, mode)
    _v1 = filename
    _v2 = mode
    _v3 = GLib::Lib.g_access(_v1, _v2)
    return _v3
  end
  def self.aligned_alloc(n_blocks, n_block_bytes, alignment)
    _v1 = n_blocks
    _v2 = n_block_bytes
    _v3 = alignment
    _v4 = GLib::Lib.g_aligned_alloc(_v1, _v2, _v3)
    return _v4
  end
  def self.aligned_alloc0(n_blocks, n_block_bytes, alignment)
    _v1 = n_blocks
    _v2 = n_block_bytes
    _v3 = alignment
    _v4 = GLib::Lib.g_aligned_alloc0(_v1, _v2, _v3)
    return _v4
  end
  def self.aligned_free(mem = nil)
    _v1 = mem
    GLib::Lib.g_aligned_free(_v1)
  end
  def self.aligned_free_sized(mem, alignment, size)
    _v1 = mem
    _v2 = alignment
    _v3 = size
    GLib::Lib.g_aligned_free_sized(_v1, _v2, _v3)
  end
  def self.ascii_digit_value(c)
    _v1 = c
    _v2 = GLib::Lib.g_ascii_digit_value(_v1)
    return _v2
  end
  def self.ascii_dtostr(buffer, buf_len, d)
    _v1 = GirFFI::InPointer.from_utf8(buffer)
    _v2 = buf_len
    _v3 = d
    _v4 = GLib::Lib.g_ascii_dtostr(_v1, _v2, _v3)
    _v5 = GirFFI::AllocationHelper.free_after(_v4, &:to_utf8)
    return _v5
  end
  def self.ascii_formatd(buffer, buf_len, format, d)
    _v1 = GirFFI::InPointer.from_utf8(buffer)
    _v2 = buf_len
    _v3 = GirFFI::InPointer.from_utf8(format)
    _v4 = d
    _v5 = GLib::Lib.g_ascii_formatd(_v1, _v2, _v3, _v4)
    _v6 = GirFFI::AllocationHelper.free_after(_v5, &:to_utf8)
    return _v6
  end
  def self.ascii_strcasecmp(s1, s2)
    _v1 = GirFFI::InPointer.from_utf8(s1)
    _v2 = GirFFI::InPointer.from_utf8(s2)
    _v3 = GLib::Lib.g_ascii_strcasecmp(_v1, _v2)
    return _v3
  end
  def self.ascii_strdown(str, len)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = len
    _v3 = GLib::Lib.g_ascii_strdown(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.ascii_string_to_signed(str, base, min, max)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = base
    _v3 = min
    _v4 = max
    _v5 = FFI::MemoryPointer.new(:int64)
    _v6 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v7 = GLib::Lib.g_ascii_string_to_signed(_v1, _v2, _v3, _v4, _v5, _v6)
    GirFFI::ArgHelper.check_error(_v6)
    _v8 = _v5.get_int64(0)
    return [_v7, _v8]
  end
  def self.ascii_string_to_unsigned(str, base, min, max)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = base
    _v3 = min
    _v4 = max
    _v5 = FFI::MemoryPointer.new(:uint64)
    _v6 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v7 = GLib::Lib.g_ascii_string_to_unsigned(_v1, _v2, _v3, _v4, _v5, _v6)
    GirFFI::ArgHelper.check_error(_v6)
    _v8 = _v5.get_uint64(0)
    return [_v7, _v8]
  end
  def self.ascii_strncasecmp(s1, s2, n)
    _v1 = GirFFI::InPointer.from_utf8(s1)
    _v2 = GirFFI::InPointer.from_utf8(s2)
    _v3 = n
    _v4 = GLib::Lib.g_ascii_strncasecmp(_v1, _v2, _v3)
    return _v4
  end
  def self.ascii_strtod(nptr)
    _v1 = GirFFI::InPointer.from_utf8(nptr)
    _v2 = FFI::MemoryPointer.new(:pointer)
    _v3 = GLib::Lib.g_ascii_strtod(_v1, _v2)
    _v4 = _v2.get_pointer(0).to_utf8
    return [_v3, _v4]
  end
  def self.ascii_strtoll(nptr, base)
    _v1 = GirFFI::InPointer.from_utf8(nptr)
    _v2 = FFI::MemoryPointer.new(:pointer)
    _v3 = base
    _v4 = GLib::Lib.g_ascii_strtoll(_v1, _v2, _v3)
    _v5 = _v2.get_pointer(0).to_utf8
    return [_v4, _v5]
  end
  def self.ascii_strtoull(nptr, base)
    _v1 = GirFFI::InPointer.from_utf8(nptr)
    _v2 = FFI::MemoryPointer.new(:pointer)
    _v3 = base
    _v4 = GLib::Lib.g_ascii_strtoull(_v1, _v2, _v3)
    _v5 = _v2.get_pointer(0).to_utf8
    return [_v4, _v5]
  end
  def self.ascii_strup(str, len)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = len
    _v3 = GLib::Lib.g_ascii_strup(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.ascii_tolower(c)
    _v1 = c
    _v2 = GLib::Lib.g_ascii_tolower(_v1)
    return _v2
  end
  def self.ascii_toupper(c)
    _v1 = c
    _v2 = GLib::Lib.g_ascii_toupper(_v1)
    return _v2
  end
  def self.ascii_xdigit_value(c)
    _v1 = c
    _v2 = GLib::Lib.g_ascii_xdigit_value(_v1)
    return _v2
  end
  def self.assert_warning(log_domain, file, line, pretty_function, expression)
    _v1 = GirFFI::InPointer.from_utf8(log_domain)
    _v2 = GirFFI::InPointer.from_utf8(file)
    _v3 = line
    _v4 = GirFFI::InPointer.from_utf8(pretty_function)
    _v5 = GirFFI::InPointer.from_utf8(expression)
    GLib::Lib.g_assert_warning(_v1, _v2, _v3, _v4, _v5)
  end
  def self.assertion_message(domain, file, line, func, message)
    _v1 = GirFFI::InPointer.from_utf8(domain)
    _v2 = GirFFI::InPointer.from_utf8(file)
    _v3 = line
    _v4 = GirFFI::InPointer.from_utf8(func)
    _v5 = GirFFI::InPointer.from_utf8(message)
    GLib::Lib.g_assertion_message(_v1, _v2, _v3, _v4, _v5)
  end
  def self.assertion_message_cmpint(domain, file, line, func, expr, arg1, cmp, arg2, numtype)
    _v1 = GirFFI::InPointer.from_utf8(domain)
    _v2 = GirFFI::InPointer.from_utf8(file)
    _v3 = line
    _v4 = GirFFI::InPointer.from_utf8(func)
    _v5 = GirFFI::InPointer.from_utf8(expr)
    _v6 = arg1
    _v7 = GirFFI::InPointer.from_utf8(cmp)
    _v8 = arg2
    _v9 = numtype
    GLib::Lib.g_assertion_message_cmpint(_v1, _v2, _v3, _v4, _v5, _v6, _v7, _v8, _v9)
  end
  def self.assertion_message_cmpstr(domain, file, line, func, expr, arg1, cmp, arg2)
    _v1 = GirFFI::InPointer.from_utf8(domain)
    _v2 = GirFFI::InPointer.from_utf8(file)
    _v3 = line
    _v4 = GirFFI::InPointer.from_utf8(func)
    _v5 = GirFFI::InPointer.from_utf8(expr)
    _v6 = GirFFI::InPointer.from_utf8(arg1)
    _v7 = GirFFI::InPointer.from_utf8(cmp)
    _v8 = GirFFI::InPointer.from_utf8(arg2)
    GLib::Lib.g_assertion_message_cmpstr(_v1, _v2, _v3, _v4, _v5, _v6, _v7, _v8)
  end
  def self.assertion_message_cmpstrv(domain, file, line, func, expr, arg1, arg2, first_wrong_idx)
    _v1 = GirFFI::InPointer.from_utf8(domain)
    _v2 = GirFFI::InPointer.from_utf8(file)
    _v3 = line
    _v4 = GirFFI::InPointer.from_utf8(func)
    _v5 = GirFFI::InPointer.from_utf8(expr)
    _v6 = GirFFI::InPointer.from_utf8(arg1)
    _v7 = GirFFI::InPointer.from_utf8(arg2)
    _v8 = first_wrong_idx
    GLib::Lib.g_assertion_message_cmpstrv(_v1, _v2, _v3, _v4, _v5, _v6, _v7, _v8)
  end
  def self.assertion_message_error(domain, file, line, func, expr, error, error_domain, error_code)
    _v1 = GirFFI::InPointer.from_utf8(domain)
    _v2 = GirFFI::InPointer.from_utf8(file)
    _v3 = line
    _v4 = GirFFI::InPointer.from_utf8(func)
    _v5 = GirFFI::InPointer.from_utf8(expr)
    _v6 = GLib::Error.from(error)
    _v7 = error_domain
    _v8 = error_code
    GLib::Lib.g_assertion_message_error(_v1, _v2, _v3, _v4, _v5, _v6, _v7, _v8)
  end
  def self.async_queue_new
    _v1 = GLib::Lib.g_async_queue_new
    _v2 = GLib::AsyncQueue.wrap_own(_v1)
    return _v2
  end
  def self.async_queue_new_full(&item_free_func)
    _v1 = GLib::DestroyNotify.from(item_free_func)
    _v2 = GLib::Lib.g_async_queue_new_full(_v1)
    _v3 = GLib::AsyncQueue.wrap_own(_v2)
    return _v3
  end
  def self.atexit(&func)
    _v1 = GLib::VoidFunc.from(func)
    GLib::Lib.g_atexit(_v1)
  end
  def self.atomic_int_add(atomic, val)
    _v1 = atomic
    _v2 = val
    _v3 = GLib::Lib.g_atomic_int_add(_v1, _v2)
    return _v3
  end
  def self.atomic_int_and(atomic, val)
    _v1 = atomic
    _v2 = val
    _v3 = GLib::Lib.g_atomic_int_and(_v1, _v2)
    return _v3
  end
  def self.atomic_int_compare_and_exchange(atomic, oldval, newval)
    _v1 = atomic
    _v2 = oldval
    _v3 = newval
    _v4 = GLib::Lib.g_atomic_int_compare_and_exchange(_v1, _v2, _v3)
    return _v4
  end
  def self.atomic_int_compare_and_exchange_full(atomic, oldval, newval)
    _v1 = atomic
    _v2 = oldval
    _v3 = newval
    _v4 = FFI::MemoryPointer.new(:int32)
    _v5 = GLib::Lib.g_atomic_int_compare_and_exchange_full(_v1, _v2, _v3, _v4)
    _v6 = _v4.get_int32(0)
    return [_v5, _v6]
  end
  def self.atomic_int_dec_and_test(atomic)
    _v1 = atomic
    _v2 = GLib::Lib.g_atomic_int_dec_and_test(_v1)
    return _v2
  end
  def self.atomic_int_exchange(atomic, newval)
    _v1 = atomic
    _v2 = newval
    _v3 = GLib::Lib.g_atomic_int_exchange(_v1, _v2)
    return _v3
  end
  def self.atomic_int_exchange_and_add(atomic, val)
    _v1 = atomic
    _v2 = val
    _v3 = GLib::Lib.g_atomic_int_exchange_and_add(_v1, _v2)
    return _v3
  end
  def self.atomic_int_get(atomic)
    _v1 = atomic
    _v2 = GLib::Lib.g_atomic_int_get(_v1)
    return _v2
  end
  def self.atomic_int_inc(atomic)
    _v1 = atomic
    GLib::Lib.g_atomic_int_inc(_v1)
  end
  def self.atomic_int_or(atomic, val)
    _v1 = atomic
    _v2 = val
    _v3 = GLib::Lib.g_atomic_int_or(_v1, _v2)
    return _v3
  end
  def self.atomic_int_set(atomic, newval)
    _v1 = atomic
    _v2 = newval
    GLib::Lib.g_atomic_int_set(_v1, _v2)
  end
  def self.atomic_int_xor(atomic, val)
    _v1 = atomic
    _v2 = val
    _v3 = GLib::Lib.g_atomic_int_xor(_v1, _v2)
    return _v3
  end
  def self.atomic_pointer_add(atomic, val)
    _v1 = atomic
    _v2 = val
    _v3 = GLib::Lib.g_atomic_pointer_add(_v1, _v2)
    return _v3
  end
  def self.atomic_pointer_and(atomic, val)
    _v1 = atomic
    _v2 = val
    _v3 = GLib::Lib.g_atomic_pointer_and(_v1, _v2)
    return _v3
  end
  def self.atomic_pointer_compare_and_exchange(atomic, oldval = nil, newval = nil)
    _v1 = atomic
    _v2 = oldval
    _v3 = newval
    _v4 = GLib::Lib.g_atomic_pointer_compare_and_exchange(_v1, _v2, _v3)
    return _v4
  end
  def self.atomic_pointer_compare_and_exchange_full(atomic, oldval = nil, newval = nil)
    _v1 = atomic
    _v2 = oldval
    _v3 = newval
    _v4 = FFI::MemoryPointer.new(:pointer)
    _v5 = GLib::Lib.g_atomic_pointer_compare_and_exchange_full(_v1, _v2, _v3, _v4)
    _v6 = _v4.get_pointer(0)
    return [_v5, _v6]
  end
  def self.atomic_pointer_exchange(atomic = nil, newval = nil)
    _v1 = atomic
    _v2 = newval
    _v3 = GLib::Lib.g_atomic_pointer_exchange(_v1, _v2)
    return _v3
  end
  def self.atomic_pointer_get(atomic)
    _v1 = atomic
    _v2 = GLib::Lib.g_atomic_pointer_get(_v1)
    return _v2
  end
  def self.atomic_pointer_or(atomic, val)
    _v1 = atomic
    _v2 = val
    _v3 = GLib::Lib.g_atomic_pointer_or(_v1, _v2)
    return _v3
  end
  def self.atomic_pointer_set(atomic, newval = nil)
    _v1 = atomic
    _v2 = newval
    GLib::Lib.g_atomic_pointer_set(_v1, _v2)
  end
  def self.atomic_pointer_xor(atomic, val)
    _v1 = atomic
    _v2 = val
    _v3 = GLib::Lib.g_atomic_pointer_xor(_v1, _v2)
    return _v3
  end
  def self.atomic_rc_box_acquire(mem_block)
    _v1 = mem_block
    _v2 = GLib::Lib.g_atomic_rc_box_acquire(_v1)
    return _v2
  end
  def self.atomic_rc_box_alloc(block_size)
    _v1 = block_size
    _v2 = GLib::Lib.g_atomic_rc_box_alloc(_v1)
    return _v2
  end
  def self.atomic_rc_box_alloc0(block_size)
    _v1 = block_size
    _v2 = GLib::Lib.g_atomic_rc_box_alloc0(_v1)
    return _v2
  end
  def self.atomic_rc_box_dup(block_size, mem_block)
    _v1 = block_size
    _v2 = mem_block
    _v3 = GLib::Lib.g_atomic_rc_box_dup(_v1, _v2)
    return _v3
  end
  def self.atomic_rc_box_get_size(mem_block)
    _v1 = mem_block
    _v2 = GLib::Lib.g_atomic_rc_box_get_size(_v1)
    return _v2
  end
  def self.atomic_rc_box_release(mem_block)
    _v1 = mem_block
    GLib::Lib.g_atomic_rc_box_release(_v1)
  end
  def self.atomic_rc_box_release_full(mem_block, &clear_func)
    _v1 = mem_block
    _v2 = GLib::DestroyNotify.from(clear_func)
    GLib::Lib.g_atomic_rc_box_release_full(_v1, _v2)
  end
  def self.atomic_ref_count_compare(arc, val)
    _v1 = arc
    _v2 = val
    _v3 = GLib::Lib.g_atomic_ref_count_compare(_v1, _v2)
    return _v3
  end
  def self.atomic_ref_count_dec(arc)
    _v1 = arc
    _v2 = GLib::Lib.g_atomic_ref_count_dec(_v1)
    return _v2
  end
  def self.atomic_ref_count_inc(arc)
    _v1 = arc
    GLib::Lib.g_atomic_ref_count_inc(_v1)
  end
  def self.atomic_ref_count_init(arc)
    _v1 = arc
    GLib::Lib.g_atomic_ref_count_init(_v1)
  end
  def self.base64_decode(text)
    _v1 = GirFFI::InPointer.from_utf8(text)
    _v2 = FFI::MemoryPointer.new(:uint64)
    _v3 = GLib::Lib.g_base64_decode(_v1, _v2)
    _v4 = _v2.get_uint64(0)
    _v5 = GirFFI::SizedArray.wrap(:guint8, _v4, _v3)
    return _v5
  end
  def self.base64_decode_inplace(text)
    out_len = text.nil? ? (0) : (text.length)
    _v1 = FFI::MemoryPointer.new(:uint64)
    _v1.put_uint64(0, out_len)
    _v2 = FFI::MemoryPointer.new(:pointer)
    _v2.put_pointer(0, GirFFI::SizedArray.copy_from(:guint8, -1, text))
    _v3 = GLib::Lib.g_base64_decode_inplace(_v2, _v1)
    _v4 = _v1.get_uint64(0)
    _v5 = GirFFI::SizedArray.wrap(:guint8, _v4, _v2.get_pointer(0))
    return [_v3, _v5]
  end
  def self.base64_encode(data = nil)
    len = data.nil? ? (0) : (data.length)
    _v1 = len
    _v2 = GirFFI::SizedArray.from(:guint8, -1, data)
    _v3 = GLib::Lib.g_base64_encode(_v2, _v1)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.base64_encode_close(break_lines, state, save)
    _v1 = break_lines
    _v2 = FFI::MemoryPointer.new(:pointer)
    _v3 = FFI::MemoryPointer.new(:int32)
    _v3.put_int32(0, state)
    _v4 = FFI::MemoryPointer.new(:int32)
    _v4.put_int32(0, save)
    _v5 = GLib::Lib.g_base64_encode_close(_v1, _v2, _v3, _v4)
    _v6 = GirFFI::SizedArray.wrap(:guint8, -1, _v2.get_pointer(0))
    _v7 = _v3.get_int32(0)
    _v8 = _v4.get_int32(0)
    return [_v5, _v6, _v7, _v8]
  end
  def self.base64_encode_step(in_, break_lines, state, save)
    len = in_.nil? ? (0) : (in_.length)
    _v1 = len
    _v2 = break_lines
    _v3 = FFI::MemoryPointer.new(:pointer)
    _v4 = FFI::MemoryPointer.new(:int32)
    _v4.put_int32(0, state)
    _v5 = FFI::MemoryPointer.new(:int32)
    _v5.put_int32(0, save)
    _v6 = GirFFI::SizedArray.from(:guint8, -1, in_)
    _v7 = GLib::Lib.g_base64_encode_step(_v6, _v1, _v2, _v3, _v4, _v5)
    _v8 = GirFFI::SizedArray.wrap(:guint8, -1, _v3.get_pointer(0))
    _v9 = _v4.get_int32(0)
    _v10 = _v5.get_int32(0)
    return [_v7, _v8, _v9, _v10]
  end
  def self.basename(file_name)
    _v1 = file_name
    _v2 = GLib::Lib.g_basename(_v1)
    _v3 = _v2.to_utf8
    return _v3
  end
  def self.bit_lock(address, lock_bit)
    _v1 = address
    _v2 = lock_bit
    GLib::Lib.g_bit_lock(_v1, _v2)
  end
  def self.bit_nth_lsf(mask, nth_bit)
    _v1 = mask
    _v2 = nth_bit
    _v3 = GLib::Lib.g_bit_nth_lsf(_v1, _v2)
    return _v3
  end
  def self.bit_nth_msf(mask, nth_bit)
    _v1 = mask
    _v2 = nth_bit
    _v3 = GLib::Lib.g_bit_nth_msf(_v1, _v2)
    return _v3
  end
  def self.bit_storage(number)
    _v1 = number
    _v2 = GLib::Lib.g_bit_storage(_v1)
    return _v2
  end
  def self.bit_trylock(address, lock_bit)
    _v1 = address
    _v2 = lock_bit
    _v3 = GLib::Lib.g_bit_trylock(_v1, _v2)
    return _v3
  end
  def self.bit_unlock(address, lock_bit)
    _v1 = address
    _v2 = lock_bit
    GLib::Lib.g_bit_unlock(_v1, _v2)
  end
  def self.blow_chunks
    GLib::Lib.g_blow_chunks
  end
  def self.bookmark_file_error_quark
    _v1 = GLib::Lib.g_bookmark_file_error_quark
    return _v1
  end
  def self.build_filenamev(args)
    _v1 = GLib::Strv.from(args)
    _v2 = GLib::Lib.g_build_filenamev(_v1)
    _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
    return _v3
  end
  def self.build_pathv(separator, args)
    _v1 = GirFFI::InPointer.from_utf8(separator)
    _v2 = GLib::Strv.from(args)
    _v3 = GLib::Lib.g_build_pathv(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.byte_array_append(array, data, len)
    _v1 = array
    _v2 = data
    _v3 = len
    _v4 = GLib::Lib.g_byte_array_append(_v1, _v2, _v3)
    _v5 = GLib::ByteArray.wrap(_v4)
    return _v5
  end
  def self.byte_array_free(array, free_segment)
    _v1 = array
    _v2 = free_segment
    _v3 = GLib::Lib.g_byte_array_free(_v1, _v2)
    return _v3
  end
  def self.byte_array_free_to_bytes(array)
    _v1 = array
    _v2 = GLib::Lib.g_byte_array_free_to_bytes(_v1)
    _v3 = GLib::Bytes.wrap_own(_v2)
    return _v3
  end
  def self.byte_array_new
    _v1 = GLib::Lib.g_byte_array_new
    _v2 = GLib::ByteArray.wrap(_v1)
    return _v2
  end
  def self.byte_array_new_take(data)
    len = data.nil? ? (0) : (data.length)
    _v1 = len
    _v2 = GirFFI::SizedArray.copy_from(:guint8, -1, data)
    _v3 = GLib::Lib.g_byte_array_new_take(_v2, _v1)
    _v4 = GLib::ByteArray.wrap(_v3)
    return _v4
  end
  def self.byte_array_prepend(array, data, len)
    _v1 = array
    _v2 = data
    _v3 = len
    _v4 = GLib::Lib.g_byte_array_prepend(_v1, _v2, _v3)
    _v5 = GLib::ByteArray.wrap(_v4)
    return _v5
  end
  def self.byte_array_ref(array)
    _v1 = array
    _v2 = GLib::Lib.g_byte_array_ref(_v1)
    _v3 = GLib::ByteArray.wrap(_v2)
    return _v3
  end
  def self.byte_array_remove_index(array, index_)
    _v1 = array
    _v2 = index_
    _v3 = GLib::Lib.g_byte_array_remove_index(_v1, _v2)
    _v4 = GLib::ByteArray.wrap(_v3)
    return _v4
  end
  def self.byte_array_remove_index_fast(array, index_)
    _v1 = array
    _v2 = index_
    _v3 = GLib::Lib.g_byte_array_remove_index_fast(_v1, _v2)
    _v4 = GLib::ByteArray.wrap(_v3)
    return _v4
  end
  def self.byte_array_remove_range(array, index_, length)
    _v1 = array
    _v2 = index_
    _v3 = length
    _v4 = GLib::Lib.g_byte_array_remove_range(_v1, _v2, _v3)
    _v5 = GLib::ByteArray.wrap(_v4)
    return _v5
  end
  def self.byte_array_set_size(array, length)
    _v1 = array
    _v2 = length
    _v3 = GLib::Lib.g_byte_array_set_size(_v1, _v2)
    _v4 = GLib::ByteArray.wrap(_v3)
    return _v4
  end
  def self.byte_array_sized_new(reserved_size)
    _v1 = reserved_size
    _v2 = GLib::Lib.g_byte_array_sized_new(_v1)
    _v3 = GLib::ByteArray.wrap(_v2)
    return _v3
  end
  def self.byte_array_sort(array, &compare_func)
    _v1 = array
    _v2 = GLib::CompareFunc.from(compare_func)
    GLib::Lib.g_byte_array_sort(_v1, _v2)
  end
  def self.byte_array_sort_with_data(array, &compare_func)
    _v1 = array
    _v2 = GLib::CompareDataFunc.from(compare_func)
    _v3 = GirFFI::ArgHelper.store(_v2)
    GLib::Lib.g_byte_array_sort_with_data(_v1, _v2, _v3)
  end
  def self.byte_array_steal(array)
    _v1 = array
    _v2 = FFI::MemoryPointer.new(:uint64)
    _v3 = GLib::Lib.g_byte_array_steal(_v1, _v2)
    _v4 = _v2.get_uint64(0)
    return [_v3, _v4]
  end
  def self.byte_array_unref(array)
    _v1 = array
    GLib::Lib.g_byte_array_unref(_v1)
  end
  def self.canonicalize_filename(filename, relative_to = nil)
    _v1 = filename
    _v2 = relative_to
    _v3 = GLib::Lib.g_canonicalize_filename(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.chdir(path)
    _v1 = path
    _v2 = GLib::Lib.g_chdir(_v1)
    return _v2
  end
  def self.check_version(required_major, required_minor, required_micro)
    _v1 = required_major
    _v2 = required_minor
    _v3 = required_micro
    _v4 = GLib::Lib.glib_check_version(_v1, _v2, _v3)
    _v5 = _v4.to_utf8
    return _v5
  end
  def self.checksum_type_get_length(checksum_type)
    _v1 = checksum_type
    _v2 = GLib::Lib.g_checksum_type_get_length(_v1)
    return _v2
  end
  def self.child_watch_add(priority, pid, &function)
    _v1 = priority
    _v2 = pid
    _v3 = GLib::ChildWatchFunc.from(function)
    _v4 = GirFFI::ArgHelper.store(_v3)
    _v5 = GLib::DestroyNotify.default
    _v6 = GLib::Lib.g_child_watch_add_full(_v1, _v2, _v3, _v4, _v5)
    return _v6
  end
  def self.child_watch_source_new(pid)
    _v1 = pid
    _v2 = GLib::Lib.g_child_watch_source_new(_v1)
    _v3 = GLib::Source.wrap_own(_v2)
    return _v3
  end
  def self.chmod(filename, mode)
    _v1 = filename
    _v2 = mode
    _v3 = GLib::Lib.g_chmod(_v1, _v2)
    return _v3
  end
  def self.clear_error
    _v1 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    GLib::Lib.g_clear_error(_v1)
    GirFFI::ArgHelper.check_error(_v1)
  end
  def self.close(fd)
    _v1 = fd
    _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v3 = GLib::Lib.g_close(_v1, _v2)
    GirFFI::ArgHelper.check_error(_v2)
    return _v3
  end
  def self.closefrom(lowfd)
    _v1 = lowfd
    _v2 = GLib::Lib.g_closefrom(_v1)
    return _v2
  end
  def self.compute_checksum_for_bytes(checksum_type, data)
    _v1 = checksum_type
    _v2 = GLib::Bytes.from(data)
    _v3 = GLib::Lib.g_compute_checksum_for_bytes(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.compute_checksum_for_data(checksum_type, data)
    _v1 = checksum_type
    length = data.nil? ? (0) : (data.length)
    _v2 = length
    _v3 = GirFFI::SizedArray.from(:guint8, -1, data)
    _v4 = GLib::Lib.g_compute_checksum_for_data(_v1, _v3, _v2)
    _v5 = GirFFI::AllocationHelper.free_after(_v4, &:to_utf8)
    return _v5
  end
  def self.compute_checksum_for_string(checksum_type, str, length)
    _v1 = checksum_type
    _v2 = GirFFI::InPointer.from_utf8(str)
    _v3 = length
    _v4 = GLib::Lib.g_compute_checksum_for_string(_v1, _v2, _v3)
    _v5 = GirFFI::AllocationHelper.free_after(_v4, &:to_utf8)
    return _v5
  end
  def self.compute_hmac_for_bytes(digest_type, key, data)
    _v1 = digest_type
    _v2 = GLib::Bytes.from(key)
    _v3 = GLib::Bytes.from(data)
    _v4 = GLib::Lib.g_compute_hmac_for_bytes(_v1, _v2, _v3)
    _v5 = GirFFI::AllocationHelper.free_after(_v4, &:to_utf8)
    return _v5
  end
  def self.compute_hmac_for_data(digest_type, key, data)
    _v1 = digest_type
    key_len = key.nil? ? (0) : (key.length)
    _v2 = key_len
    length = data.nil? ? (0) : (data.length)
    _v3 = length
    _v4 = GirFFI::SizedArray.from(:guint8, -1, key)
    _v5 = GirFFI::SizedArray.from(:guint8, -1, data)
    _v6 = GLib::Lib.g_compute_hmac_for_data(_v1, _v4, _v2, _v5, _v3)
    _v7 = GirFFI::AllocationHelper.free_after(_v6, &:to_utf8)
    return _v7
  end
  def self.compute_hmac_for_string(digest_type, key, str, length)
    _v1 = digest_type
    key_len = key.nil? ? (0) : (key.length)
    _v2 = key_len
    _v3 = GirFFI::InPointer.from_utf8(str)
    _v4 = length
    _v5 = GirFFI::SizedArray.from(:guint8, -1, key)
    _v6 = GLib::Lib.g_compute_hmac_for_string(_v1, _v5, _v2, _v3, _v4)
    _v7 = GirFFI::AllocationHelper.free_after(_v6, &:to_utf8)
    return _v7
  end
  def self.convert(str, to_codeset, from_codeset)
    len = str.nil? ? (0) : (str.length)
    _v1 = len
    _v2 = GirFFI::InPointer.from_utf8(to_codeset)
    _v3 = GirFFI::InPointer.from_utf8(from_codeset)
    _v4 = FFI::MemoryPointer.new(:uint64)
    _v5 = FFI::MemoryPointer.new(:uint64)
    _v6 = GirFFI::SizedArray.from(:guint8, -1, str)
    _v7 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v8 = GLib::Lib.g_convert(_v6, _v1, _v2, _v3, _v4, _v5, _v7)
    GirFFI::ArgHelper.check_error(_v7)
    _v9 = _v4.get_uint64(0)
    _v10 = _v5.get_uint64(0)
    _v11 = GirFFI::SizedArray.wrap(:guint8, _v10, _v8)
    return [_v11, _v9]
  end
  def self.convert_error_quark
    _v1 = GLib::Lib.g_convert_error_quark
    return _v1
  end
  def self.convert_with_fallback(str, to_codeset, from_codeset, fallback)
    len = str.nil? ? (0) : (str.length)
    _v1 = len
    _v2 = GirFFI::InPointer.from_utf8(to_codeset)
    _v3 = GirFFI::InPointer.from_utf8(from_codeset)
    _v4 = GirFFI::InPointer.from_utf8(fallback)
    _v5 = FFI::MemoryPointer.new(:uint64)
    _v6 = FFI::MemoryPointer.new(:uint64)
    _v7 = GirFFI::SizedArray.from(:guint8, -1, str)
    _v8 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v9 = GLib::Lib.g_convert_with_fallback(_v7, _v1, _v2, _v3, _v4, _v5, _v6, _v8)
    GirFFI::ArgHelper.check_error(_v8)
    _v10 = _v5.get_uint64(0)
    _v11 = _v6.get_uint64(0)
    _v12 = GirFFI::SizedArray.wrap(:guint8, _v11, _v9)
    return [_v12, _v10]
  end
  def self.creat(filename, mode)
    _v1 = filename
    _v2 = mode
    _v3 = GLib::Lib.g_creat(_v1, _v2)
    return _v3
  end
  def self.datalist_foreach(datalist, &func)
    _v1 = GLib::Data.from(datalist)
    _v2 = GLib::DataForeachFunc.from(func)
    _v3 = GirFFI::ArgHelper.store(_v2)
    GLib::Lib.g_datalist_foreach(_v1, _v2, _v3)
  end
  def self.datalist_get_data(datalist, key)
    _v1 = GLib::Data.from(datalist)
    _v2 = GirFFI::InPointer.from_utf8(key)
    _v3 = GLib::Lib.g_datalist_get_data(_v1, _v2)
    return _v3
  end
  def self.datalist_get_flags(datalist)
    _v1 = GLib::Data.from(datalist)
    _v2 = GLib::Lib.g_datalist_get_flags(_v1)
    return _v2
  end
  def self.datalist_id_get_data(datalist, key_id)
    _v1 = GLib::Data.from(datalist)
    _v2 = key_id
    _v3 = GLib::Lib.g_datalist_id_get_data(_v1, _v2)
    return _v3
  end
  def self.datalist_id_remove_multiple(datalist, keys)
    _v1 = GLib::Data.from(datalist)
    n_keys = keys.nil? ? (0) : (keys.length)
    _v2 = n_keys
    _v3 = GirFFI::SizedArray.from(:guint32, -1, keys)
    GLib::Lib.g_datalist_id_remove_multiple(_v1, _v3, _v2)
  end
  def self.datalist_set_flags(datalist, flags)
    _v1 = GLib::Data.from(datalist)
    _v2 = flags
    GLib::Lib.g_datalist_set_flags(_v1, _v2)
  end
  def self.datalist_unset_flags(datalist, flags)
    _v1 = GLib::Data.from(datalist)
    _v2 = flags
    GLib::Lib.g_datalist_unset_flags(_v1, _v2)
  end
  def self.dataset_destroy(dataset_location)
    _v1 = dataset_location
    GLib::Lib.g_dataset_destroy(_v1)
  end
  def self.dataset_foreach(dataset_location, &func)
    _v1 = dataset_location
    _v2 = GLib::DataForeachFunc.from(func)
    _v3 = GirFFI::ArgHelper.store(_v2)
    GLib::Lib.g_dataset_foreach(_v1, _v2, _v3)
  end
  def self.dataset_id_get_data(dataset_location, key_id)
    _v1 = dataset_location
    _v2 = key_id
    _v3 = GLib::Lib.g_dataset_id_get_data(_v1, _v2)
    return _v3
  end
  def self.date_get_days_in_month(month, year)
    _v1 = month
    _v2 = year
    _v3 = GLib::Lib.g_date_get_days_in_month(_v1, _v2)
    return _v3
  end
  def self.date_get_monday_weeks_in_year(year)
    _v1 = year
    _v2 = GLib::Lib.g_date_get_monday_weeks_in_year(_v1)
    return _v2
  end
  def self.date_get_sunday_weeks_in_year(year)
    _v1 = year
    _v2 = GLib::Lib.g_date_get_sunday_weeks_in_year(_v1)
    return _v2
  end
  def self.date_is_leap_year(year)
    _v1 = year
    _v2 = GLib::Lib.g_date_is_leap_year(_v1)
    return _v2
  end
  def self.date_strftime(s, slen, format, date)
    _v1 = GirFFI::InPointer.from_utf8(s)
    _v2 = slen
    _v3 = GirFFI::InPointer.from_utf8(format)
    _v4 = GLib::Date.from(date)
    _v5 = GLib::Lib.g_date_strftime(_v1, _v2, _v3, _v4)
    return _v5
  end
  def self.date_valid_day(day)
    _v1 = day
    _v2 = GLib::Lib.g_date_valid_day(_v1)
    return _v2
  end
  def self.date_valid_dmy(day, month, year)
    _v1 = day
    _v2 = month
    _v3 = year
    _v4 = GLib::Lib.g_date_valid_dmy(_v1, _v2, _v3)
    return _v4
  end
  def self.date_valid_julian(julian_date)
    _v1 = julian_date
    _v2 = GLib::Lib.g_date_valid_julian(_v1)
    return _v2
  end
  def self.date_valid_month(month)
    _v1 = month
    _v2 = GLib::Lib.g_date_valid_month(_v1)
    return _v2
  end
  def self.date_valid_weekday(weekday)
    _v1 = weekday
    _v2 = GLib::Lib.g_date_valid_weekday(_v1)
    return _v2
  end
  def self.date_valid_year(year)
    _v1 = year
    _v2 = GLib::Lib.g_date_valid_year(_v1)
    return _v2
  end
  def self.dcgettext(domain, msgid, category)
    _v1 = GirFFI::InPointer.from_utf8(domain)
    _v2 = GirFFI::InPointer.from_utf8(msgid)
    _v3 = category
    _v4 = GLib::Lib.g_dcgettext(_v1, _v2, _v3)
    _v5 = _v4.to_utf8
    return _v5
  end
  def self.dgettext(domain, msgid)
    _v1 = GirFFI::InPointer.from_utf8(domain)
    _v2 = GirFFI::InPointer.from_utf8(msgid)
    _v3 = GLib::Lib.g_dgettext(_v1, _v2)
    _v4 = _v3.to_utf8
    return _v4
  end
  def self.dir_make_tmp(tmpl = nil)
    _v1 = tmpl
    _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v3 = GLib::Lib.g_dir_make_tmp(_v1, _v2)
    GirFFI::ArgHelper.check_error(_v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.direct_equal(v1 = nil, v2 = nil)
    _v1 = v1
    _v2 = v2
    _v3 = GLib::Lib.g_direct_equal(_v1, _v2)
    return _v3
  end
  def self.direct_hash(v = nil)
    _v1 = v
    _v2 = GLib::Lib.g_direct_hash(_v1)
    return _v2
  end
  def self.dngettext(domain, msgid, msgid_plural, n)
    _v1 = GirFFI::InPointer.from_utf8(domain)
    _v2 = GirFFI::InPointer.from_utf8(msgid)
    _v3 = GirFFI::InPointer.from_utf8(msgid_plural)
    _v4 = n
    _v5 = GLib::Lib.g_dngettext(_v1, _v2, _v3, _v4)
    _v6 = _v5.to_utf8
    return _v6
  end
  def self.double_equal(v1, v2)
    _v1 = v1
    _v2 = v2
    _v3 = GLib::Lib.g_double_equal(_v1, _v2)
    return _v3
  end
  def self.double_hash(v)
    _v1 = v
    _v2 = GLib::Lib.g_double_hash(_v1)
    return _v2
  end
  def self.dpgettext(domain, msgctxtid, msgidoffset)
    _v1 = GirFFI::InPointer.from_utf8(domain)
    _v2 = GirFFI::InPointer.from_utf8(msgctxtid)
    _v3 = msgidoffset
    _v4 = GLib::Lib.g_dpgettext(_v1, _v2, _v3)
    _v5 = _v4.to_utf8
    return _v5
  end
  def self.dpgettext2(domain, context, msgid)
    _v1 = GirFFI::InPointer.from_utf8(domain)
    _v2 = GirFFI::InPointer.from_utf8(context)
    _v3 = GirFFI::InPointer.from_utf8(msgid)
    _v4 = GLib::Lib.g_dpgettext2(_v1, _v2, _v3)
    _v5 = _v4.to_utf8
    return _v5
  end
  def self.environ_getenv(envp, variable)
    _v1 = GLib::Strv.from(envp)
    _v2 = variable
    _v3 = GLib::Lib.g_environ_getenv(_v1, _v2)
    _v4 = _v3.to_utf8
    return _v4
  end
  def self.environ_setenv(envp, variable, value, overwrite)
    _v1 = GLib::Strv.from(envp)
    _v2 = variable
    _v3 = value
    _v4 = overwrite
    _v5 = GLib::Lib.g_environ_setenv(_v1, _v2, _v3, _v4)
    _v6 = GLib::Strv.wrap(_v5)
    return _v6
  end
  def self.environ_unsetenv(envp, variable)
    _v1 = GLib::Strv.from(envp)
    _v2 = variable
    _v3 = GLib::Lib.g_environ_unsetenv(_v1, _v2)
    _v4 = GLib::Strv.wrap(_v3)
    return _v4
  end
  def self.error_domain_register(error_type_name, error_type_private_size, error_type_init, error_type_copy, error_type_clear)
    _v1 = GirFFI::InPointer.from_utf8(error_type_name)
    _v2 = error_type_private_size
    _v3 = GLib::ErrorInitFunc.from(error_type_init)
    _v4 = GLib::ErrorCopyFunc.from(error_type_copy)
    _v5 = GLib::ErrorClearFunc.from(error_type_clear)
    _v6 = GLib::Lib.g_error_domain_register(_v1, _v2, _v3, _v4, _v5)
    return _v6
  end
  def self.error_domain_register_static(error_type_name, error_type_private_size, error_type_init, error_type_copy, error_type_clear)
    _v1 = GirFFI::InPointer.from_utf8(error_type_name)
    _v2 = error_type_private_size
    _v3 = GLib::ErrorInitFunc.from(error_type_init)
    _v4 = GLib::ErrorCopyFunc.from(error_type_copy)
    _v5 = GLib::ErrorClearFunc.from(error_type_clear)
    _v6 = GLib::Lib.g_error_domain_register_static(_v1, _v2, _v3, _v4, _v5)
    return _v6
  end
  def self.fdwalk_set_cloexec(lowfd)
    _v1 = lowfd
    _v2 = GLib::Lib.g_fdwalk_set_cloexec(_v1)
    return _v2
  end
  def self.file_error_from_errno(err_no)
    _v1 = err_no
    _v2 = GLib::Lib.g_file_error_from_errno(_v1)
    return _v2
  end
  def self.file_error_quark
    _v1 = GLib::Lib.g_file_error_quark
    return _v1
  end
  def self.file_get_contents(filename)
    _v1 = filename
    _v2 = FFI::MemoryPointer.new(:uint64)
    _v3 = FFI::MemoryPointer.new(:pointer)
    _v4 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v5 = GLib::Lib.g_file_get_contents(_v1, _v3, _v2, _v4)
    GirFFI::ArgHelper.check_error(_v4)
    _v6 = _v2.get_uint64(0)
    _v7 = GirFFI::SizedArray.wrap(:guint8, _v6, _v3.get_pointer(0))
    return [_v5, _v7]
  end
  def self.file_open_tmp(tmpl = nil)
    _v1 = tmpl
    _v2 = FFI::MemoryPointer.new(:pointer)
    _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v4 = GLib::Lib.g_file_open_tmp(_v1, _v2, _v3)
    GirFFI::ArgHelper.check_error(_v3)
    _v5 = GirFFI::AllocationHelper.free_after(_v2.get_pointer(0), &:to_utf8)
    return [_v4, _v5]
  end
  def self.file_read_link(filename)
    _v1 = filename
    _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v3 = GLib::Lib.g_file_read_link(_v1, _v2)
    GirFFI::ArgHelper.check_error(_v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.file_set_contents(filename, contents)
    _v1 = filename
    length = contents.nil? ? (0) : (contents.length)
    _v2 = length
    _v3 = GirFFI::SizedArray.from(:guint8, -1, contents)
    _v4 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v5 = GLib::Lib.g_file_set_contents(_v1, _v3, _v2, _v4)
    GirFFI::ArgHelper.check_error(_v4)
    return _v5
  end
  def self.file_set_contents_full(filename, contents, flags, mode)
    _v1 = filename
    length = contents.nil? ? (0) : (contents.length)
    _v2 = length
    _v3 = flags
    _v4 = mode
    _v5 = GirFFI::SizedArray.from(:guint8, -1, contents)
    _v6 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v7 = GLib::Lib.g_file_set_contents_full(_v1, _v5, _v2, _v3, _v4, _v6)
    GirFFI::ArgHelper.check_error(_v6)
    return _v7
  end
  def self.file_test(filename, test)
    _v1 = filename
    _v2 = test
    _v3 = GLib::Lib.g_file_test(_v1, _v2)
    return _v3
  end
  def self.filename_display_basename(filename)
    _v1 = filename
    _v2 = GLib::Lib.g_filename_display_basename(_v1)
    _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
    return _v3
  end
  def self.filename_display_name(filename)
    _v1 = filename
    _v2 = GLib::Lib.g_filename_display_name(_v1)
    _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
    return _v3
  end
  def self.filename_from_uri(uri)
    _v1 = GirFFI::InPointer.from_utf8(uri)
    _v2 = FFI::MemoryPointer.new(:pointer)
    _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v4 = GLib::Lib.g_filename_from_uri(_v1, _v2, _v3)
    GirFFI::ArgHelper.check_error(_v3)
    _v5 = GirFFI::AllocationHelper.free_after(_v2.get_pointer(0), &:to_utf8)
    _v6 = GirFFI::AllocationHelper.free_after(_v4, &:to_utf8)
    return [_v6, _v5]
  end
  def self.filename_from_utf8(utf8string, len)
    _v1 = GirFFI::InPointer.from_utf8(utf8string)
    _v2 = len
    _v3 = FFI::MemoryPointer.new(:uint64)
    _v4 = FFI::MemoryPointer.new(:uint64)
    _v5 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v6 = GLib::Lib.g_filename_from_utf8(_v1, _v2, _v3, _v4, _v5)
    GirFFI::ArgHelper.check_error(_v5)
    _v7 = _v3.get_uint64(0)
    _v8 = _v4.get_uint64(0)
    _v9 = GirFFI::AllocationHelper.free_after(_v6, &:to_utf8)
    return [_v9, _v7, _v8]
  end
  def self.filename_to_uri(filename, hostname = nil)
    _v1 = filename
    _v2 = GirFFI::InPointer.from_utf8(hostname)
    _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v4 = GLib::Lib.g_filename_to_uri(_v1, _v2, _v3)
    GirFFI::ArgHelper.check_error(_v3)
    _v5 = GirFFI::AllocationHelper.free_after(_v4, &:to_utf8)
    return _v5
  end
  def self.filename_to_utf8(opsysstring, len)
    _v1 = opsysstring
    _v2 = len
    _v3 = FFI::MemoryPointer.new(:uint64)
    _v4 = FFI::MemoryPointer.new(:uint64)
    _v5 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v6 = GLib::Lib.g_filename_to_utf8(_v1, _v2, _v3, _v4, _v5)
    GirFFI::ArgHelper.check_error(_v5)
    _v7 = _v3.get_uint64(0)
    _v8 = _v4.get_uint64(0)
    _v9 = GirFFI::AllocationHelper.free_after(_v6, &:to_utf8)
    return [_v9, _v7, _v8]
  end
  def self.find_program_in_path(program)
    _v1 = program
    _v2 = GLib::Lib.g_find_program_in_path(_v1)
    _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
    return _v3
  end
  def self.fopen(filename, mode)
    _v1 = filename
    _v2 = GirFFI::InPointer.from_utf8(mode)
    _v3 = GLib::Lib.g_fopen(_v1, _v2)
    return _v3
  end
  def self.format_size(size)
    _v1 = size
    _v2 = GLib::Lib.g_format_size(_v1)
    _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
    return _v3
  end
  def self.format_size_for_display(size)
    _v1 = size
    _v2 = GLib::Lib.g_format_size_for_display(_v1)
    _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
    return _v3
  end
  def self.format_size_full(size, flags)
    _v1 = size
    _v2 = flags
    _v3 = GLib::Lib.g_format_size_full(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.free(mem = nil)
    _v1 = mem
    GLib::Lib.g_free(_v1)
  end
  def self.free_sized(mem, size)
    _v1 = mem
    _v2 = size
    GLib::Lib.g_free_sized(_v1, _v2)
  end
  def self.freopen(filename, mode, stream = nil)
    _v1 = filename
    _v2 = GirFFI::InPointer.from_utf8(mode)
    _v3 = stream
    _v4 = GLib::Lib.g_freopen(_v1, _v2, _v3)
    return _v4
  end
  def self.fsync(fd)
    _v1 = fd
    _v2 = GLib::Lib.g_fsync(_v1)
    return _v2
  end
  def self.get_application_name
    _v1 = GLib::Lib.g_get_application_name
    _v2 = _v1.to_utf8
    return _v2
  end
  def self.get_charset
    _v1 = FFI::MemoryPointer.new(:pointer)
    _v2 = GLib::Lib.g_get_charset(_v1)
    _v3 = _v1.get_pointer(0).to_utf8
    return [_v2, _v3]
  end
  def self.get_codeset
    _v1 = GLib::Lib.g_get_codeset
    _v2 = GirFFI::AllocationHelper.free_after(_v1, &:to_utf8)
    return _v2
  end
  def self.get_console_charset
    _v1 = FFI::MemoryPointer.new(:pointer)
    _v2 = GLib::Lib.g_get_console_charset(_v1)
    _v3 = _v1.get_pointer(0).to_utf8
    return [_v2, _v3]
  end
  def self.get_current_dir
    _v1 = GLib::Lib.g_get_current_dir
    _v2 = GirFFI::AllocationHelper.free_after(_v1, &:to_utf8)
    return _v2
  end
  def self.get_current_time(result)
    _v1 = GLib::TimeVal.from(result)
    GLib::Lib.g_get_current_time(_v1)
  end
  def self.get_environ
    _v1 = GLib::Lib.g_get_environ
    _v2 = GLib::Strv.wrap(_v1)
    return _v2
  end
  def self.get_filename_charsets
    _v1 = FFI::MemoryPointer.new(:pointer)
    _v2 = GLib::Lib.g_get_filename_charsets(_v1)
    _v3 = GLib::Strv.wrap(_v1.get_pointer(0))
    return [_v2, _v3]
  end
  def self.get_home_dir
    _v1 = GLib::Lib.g_get_home_dir
    _v2 = _v1.to_utf8
    return _v2
  end
  def self.get_host_name
    _v1 = GLib::Lib.g_get_host_name
    _v2 = _v1.to_utf8
    return _v2
  end
  def self.get_language_names
    _v1 = GLib::Lib.g_get_language_names
    _v2 = GLib::Strv.wrap(_v1)
    return _v2
  end
  def self.get_language_names_with_category(category_name)
    _v1 = GirFFI::InPointer.from_utf8(category_name)
    _v2 = GLib::Lib.g_get_language_names_with_category(_v1)
    _v3 = GLib::Strv.wrap(_v2)
    return _v3
  end
  def self.get_locale_variants(locale)
    _v1 = GirFFI::InPointer.from_utf8(locale)
    _v2 = GLib::Lib.g_get_locale_variants(_v1)
    _v3 = GLib::Strv.wrap(_v2)
    return _v3
  end
  def self.get_monotonic_time
    _v1 = GLib::Lib.g_get_monotonic_time
    return _v1
  end
  def self.get_num_processors
    _v1 = GLib::Lib.g_get_num_processors
    return _v1
  end
  def self.get_os_info(key_name)
    _v1 = GirFFI::InPointer.from_utf8(key_name)
    _v2 = GLib::Lib.g_get_os_info(_v1)
    _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
    return _v3
  end
  def self.get_prgname
    _v1 = GLib::Lib.g_get_prgname
    _v2 = _v1.to_utf8
    return _v2
  end
  def self.get_real_name
    _v1 = GLib::Lib.g_get_real_name
    _v2 = _v1.to_utf8
    return _v2
  end
  def self.get_real_time
    _v1 = GLib::Lib.g_get_real_time
    return _v1
  end
  def self.get_system_config_dirs
    _v1 = GLib::Lib.g_get_system_config_dirs
    _v2 = GLib::Strv.wrap(_v1)
    return _v2
  end
  def self.get_system_data_dirs
    _v1 = GLib::Lib.g_get_system_data_dirs
    _v2 = GLib::Strv.wrap(_v1)
    return _v2
  end
  def self.get_tmp_dir
    _v1 = GLib::Lib.g_get_tmp_dir
    _v2 = _v1.to_utf8
    return _v2
  end
  def self.get_user_cache_dir
    _v1 = GLib::Lib.g_get_user_cache_dir
    _v2 = _v1.to_utf8
    return _v2
  end
  def self.get_user_config_dir
    _v1 = GLib::Lib.g_get_user_config_dir
    _v2 = _v1.to_utf8
    return _v2
  end
  def self.get_user_data_dir
    _v1 = GLib::Lib.g_get_user_data_dir
    _v2 = _v1.to_utf8
    return _v2
  end
  def self.get_user_name
    _v1 = GLib::Lib.g_get_user_name
    _v2 = _v1.to_utf8
    return _v2
  end
  def self.get_user_runtime_dir
    _v1 = GLib::Lib.g_get_user_runtime_dir
    _v2 = _v1.to_utf8
    return _v2
  end
  def self.get_user_special_dir(directory)
    _v1 = directory
    _v2 = GLib::Lib.g_get_user_special_dir(_v1)
    _v3 = _v2.to_utf8
    return _v3
  end
  def self.get_user_state_dir
    _v1 = GLib::Lib.g_get_user_state_dir
    _v2 = _v1.to_utf8
    return _v2
  end
  def self.getenv(variable)
    _v1 = variable
    _v2 = GLib::Lib.g_getenv(_v1)
    _v3 = _v2.to_utf8
    return _v3
  end
  def self.hash_table_add(hash_table, key = nil)
    _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
    _v2 = key
    _v3 = GLib::Lib.g_hash_table_add(_v1, _v2)
    return _v3
  end
  def self.hash_table_contains(hash_table, key = nil)
    _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
    _v2 = key
    _v3 = GLib::Lib.g_hash_table_contains(_v1, _v2)
    return _v3
  end
  def self.hash_table_destroy(hash_table)
    _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
    GLib::Lib.g_hash_table_destroy(_v1)
  end
  def self.hash_table_find(hash_table, &predicate)
    _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
    _v2 = GLib::HRFunc.from(predicate)
    _v3 = GirFFI::ArgHelper.store(_v2)
    _v4 = GLib::Lib.g_hash_table_find(_v1, _v2, _v3)
    return _v4
  end
  def self.hash_table_foreach(hash_table, &func)
    _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
    _v2 = GLib::HFunc.from(func)
    _v3 = GirFFI::ArgHelper.store(_v2)
    GLib::Lib.g_hash_table_foreach(_v1, _v2, _v3)
  end
  def self.hash_table_foreach_remove(hash_table, &func)
    _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
    _v2 = GLib::HRFunc.from(func)
    _v3 = GirFFI::ArgHelper.store(_v2)
    _v4 = GLib::Lib.g_hash_table_foreach_remove(_v1, _v2, _v3)
    return _v4
  end
  def self.hash_table_foreach_steal(hash_table, &func)
    _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
    _v2 = GLib::HRFunc.from(func)
    _v3 = GirFFI::ArgHelper.store(_v2)
    _v4 = GLib::Lib.g_hash_table_foreach_steal(_v1, _v2, _v3)
    return _v4
  end
  def self.hash_table_insert(hash_table, key = nil, value = nil)
    _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
    _v2 = key
    _v3 = value
    _v4 = GLib::Lib.g_hash_table_insert(_v1, _v2, _v3)
    return _v4
  end
  def self.hash_table_lookup(hash_table, key = nil)
    _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
    _v2 = key
    _v3 = GLib::Lib.g_hash_table_lookup(_v1, _v2)
    return _v3
  end
  def self.hash_table_lookup_extended(hash_table, lookup_key = nil)
    _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
    _v2 = lookup_key
    _v3 = FFI::MemoryPointer.new(:pointer)
    _v4 = FFI::MemoryPointer.new(:pointer)
    _v5 = GLib::Lib.g_hash_table_lookup_extended(_v1, _v2, _v3, _v4)
    _v6 = _v3.get_pointer(0)
    _v7 = _v4.get_pointer(0)
    return [_v5, _v6, _v7]
  end
  def self.hash_table_new_similar(other_hash_table)
    _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], other_hash_table)
    _v2 = GLib::Lib.g_hash_table_new_similar(_v1)
    _v3 = GLib::HashTable.wrap([[:pointer, :void], [:pointer, :void]], _v2)
    return _v3
  end
  def self.hash_table_ref(hash_table)
    _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
    _v2 = GLib::Lib.g_hash_table_ref(_v1)
    _v3 = GLib::HashTable.wrap([[:pointer, :void], [:pointer, :void]], _v2)
    return _v3
  end
  def self.hash_table_remove(hash_table, key = nil)
    _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
    _v2 = key
    _v3 = GLib::Lib.g_hash_table_remove(_v1, _v2)
    return _v3
  end
  def self.hash_table_remove_all(hash_table)
    _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
    GLib::Lib.g_hash_table_remove_all(_v1)
  end
  def self.hash_table_replace(hash_table, key = nil, value = nil)
    _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
    _v2 = key
    _v3 = value
    _v4 = GLib::Lib.g_hash_table_replace(_v1, _v2, _v3)
    return _v4
  end
  def self.hash_table_size(hash_table)
    _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
    _v2 = GLib::Lib.g_hash_table_size(_v1)
    return _v2
  end
  def self.hash_table_steal(hash_table, key = nil)
    _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
    _v2 = key
    _v3 = GLib::Lib.g_hash_table_steal(_v1, _v2)
    return _v3
  end
  def self.hash_table_steal_all(hash_table)
    _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
    GLib::Lib.g_hash_table_steal_all(_v1)
  end
  def self.hash_table_steal_extended(hash_table, lookup_key = nil)
    _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
    _v2 = lookup_key
    _v3 = FFI::MemoryPointer.new(:pointer)
    _v4 = FFI::MemoryPointer.new(:pointer)
    _v5 = GLib::Lib.g_hash_table_steal_extended(_v1, _v2, _v3, _v4)
    _v6 = _v3.get_pointer(0)
    _v7 = _v4.get_pointer(0)
    return [_v5, _v6, _v7]
  end
  def self.hash_table_unref(hash_table)
    _v1 = GLib::HashTable.from([[:pointer, :void], [:pointer, :void]], hash_table)
    GLib::Lib.g_hash_table_unref(_v1)
  end
  def self.hook_destroy(hook_list, hook_id)
    _v1 = GLib::HookList.from(hook_list)
    _v2 = hook_id
    _v3 = GLib::Lib.g_hook_destroy(_v1, _v2)
    return _v3
  end
  def self.hook_destroy_link(hook_list, hook)
    _v1 = GLib::HookList.from(hook_list)
    _v2 = GLib::Hook.from(hook)
    GLib::Lib.g_hook_destroy_link(_v1, _v2)
  end
  def self.hook_free(hook_list, hook)
    _v1 = GLib::HookList.from(hook_list)
    _v2 = GLib::Hook.from(hook)
    GLib::Lib.g_hook_free(_v1, _v2)
  end
  def self.hook_insert_before(hook_list, sibling, hook)
    _v1 = GLib::HookList.from(hook_list)
    _v2 = GLib::Hook.from(sibling)
    _v3 = GLib::Hook.from(hook)
    GLib::Lib.g_hook_insert_before(_v1, _v2, _v3)
  end
  def self.hook_insert_sorted(hook_list, hook, &func)
    _v1 = GLib::HookList.from(hook_list)
    _v2 = GLib::Hook.from(hook)
    _v3 = GLib::HookCompareFunc.from(func)
    GLib::Lib.g_hook_insert_sorted(_v1, _v2, _v3)
  end
  def self.hook_prepend(hook_list, hook)
    _v1 = GLib::HookList.from(hook_list)
    _v2 = GLib::Hook.from(hook)
    GLib::Lib.g_hook_prepend(_v1, _v2)
  end
  def self.hook_unref(hook_list, hook)
    _v1 = GLib::HookList.from(hook_list)
    _v2 = GLib::Hook.from(hook)
    GLib::Lib.g_hook_unref(_v1, _v2)
  end
  def self.hostname_is_ascii_encoded(hostname)
    _v1 = GirFFI::InPointer.from_utf8(hostname)
    _v2 = GLib::Lib.g_hostname_is_ascii_encoded(_v1)
    return _v2
  end
  def self.hostname_is_ip_address(hostname)
    _v1 = GirFFI::InPointer.from_utf8(hostname)
    _v2 = GLib::Lib.g_hostname_is_ip_address(_v1)
    return _v2
  end
  def self.hostname_is_non_ascii(hostname)
    _v1 = GirFFI::InPointer.from_utf8(hostname)
    _v2 = GLib::Lib.g_hostname_is_non_ascii(_v1)
    return _v2
  end
  def self.hostname_to_ascii(hostname)
    _v1 = GirFFI::InPointer.from_utf8(hostname)
    _v2 = GLib::Lib.g_hostname_to_ascii(_v1)
    _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
    return _v3
  end
  def self.hostname_to_unicode(hostname)
    _v1 = GirFFI::InPointer.from_utf8(hostname)
    _v2 = GLib::Lib.g_hostname_to_unicode(_v1)
    _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
    return _v3
  end
  def self.idle_add(priority, &function)
    _v1 = priority
    _v2 = GLib::SourceFunc.from(function)
    _v3 = GirFFI::ArgHelper.store(_v2)
    _v4 = GLib::DestroyNotify.default
    _v5 = GLib::Lib.g_idle_add_full(_v1, _v2, _v3, _v4)
    return _v5
  end
  def self.idle_remove_by_data(data = nil)
    _v1 = data
    _v2 = GLib::Lib.g_idle_remove_by_data(_v1)
    return _v2
  end
  def self.idle_source_new
    _v1 = GLib::Lib.g_idle_source_new
    _v2 = GLib::Source.wrap_own(_v1)
    return _v2
  end
  def self.int64_equal(v1, v2)
    _v1 = v1
    _v2 = v2
    _v3 = GLib::Lib.g_int64_equal(_v1, _v2)
    return _v3
  end
  def self.int64_hash(v)
    _v1 = v
    _v2 = GLib::Lib.g_int64_hash(_v1)
    return _v2
  end
  def self.int_equal(v1, v2)
    _v1 = v1
    _v2 = v2
    _v3 = GLib::Lib.g_int_equal(_v1, _v2)
    return _v3
  end
  def self.int_hash(v)
    _v1 = v
    _v2 = GLib::Lib.g_int_hash(_v1)
    return _v2
  end
  def self.intern_static_string(string = nil)
    _v1 = GirFFI::InPointer.from_utf8(string)
    _v2 = GLib::Lib.g_intern_static_string(_v1)
    _v3 = _v2.to_utf8
    return _v3
  end
  def self.intern_string(string = nil)
    _v1 = GirFFI::InPointer.from_utf8(string)
    _v2 = GLib::Lib.g_intern_string(_v1)
    _v3 = _v2.to_utf8
    return _v3
  end
  def self.io_add_watch(channel, priority, condition, &func)
    _v1 = GLib::IOChannel.from(channel)
    _v2 = priority
    _v3 = condition
    _v4 = GLib::IOFunc.from(func)
    _v5 = GirFFI::ArgHelper.store(_v4)
    _v6 = GLib::DestroyNotify.default
    _v7 = GLib::Lib.g_io_add_watch_full(_v1, _v2, _v3, _v4, _v5, _v6)
    return _v7
  end
  def self.io_channel_error_from_errno(en)
    _v1 = en
    _v2 = GLib::Lib.g_io_channel_error_from_errno(_v1)
    return _v2
  end
  def self.io_channel_error_quark
    _v1 = GLib::Lib.g_io_channel_error_quark
    return _v1
  end
  def self.io_create_watch(channel, condition)
    _v1 = GLib::IOChannel.from(channel)
    _v2 = condition
    _v3 = GLib::Lib.g_io_create_watch(_v1, _v2)
    _v4 = GLib::Source.wrap_own(_v3)
    return _v4
  end
  def self.key_file_error_quark
    _v1 = GLib::Lib.g_key_file_error_quark
    return _v1
  end
  def self.list_pop_allocator
    GLib::Lib.g_list_pop_allocator
  end
  def self.list_push_allocator(allocator)
    _v1 = GLib::Allocator.from(allocator)
    GLib::Lib.g_list_push_allocator(_v1)
  end
  def self.listenv
    _v1 = GLib::Lib.g_listenv
    _v2 = GLib::Strv.wrap(_v1)
    return _v2
  end
  def self.locale_from_utf8(utf8string, len)
    _v1 = GirFFI::InPointer.from_utf8(utf8string)
    _v2 = len
    _v3 = FFI::MemoryPointer.new(:uint64)
    _v4 = FFI::MemoryPointer.new(:uint64)
    _v5 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v6 = GLib::Lib.g_locale_from_utf8(_v1, _v2, _v3, _v4, _v5)
    GirFFI::ArgHelper.check_error(_v5)
    _v7 = _v3.get_uint64(0)
    _v8 = _v4.get_uint64(0)
    _v9 = GirFFI::SizedArray.wrap(:guint8, _v8, _v6)
    return [_v9, _v7]
  end
  def self.locale_to_utf8(opsysstring)
    len = opsysstring.nil? ? (0) : (opsysstring.length)
    _v1 = len
    _v2 = FFI::MemoryPointer.new(:uint64)
    _v3 = FFI::MemoryPointer.new(:uint64)
    _v4 = GirFFI::SizedArray.from(:guint8, -1, opsysstring)
    _v5 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v6 = GLib::Lib.g_locale_to_utf8(_v4, _v1, _v2, _v3, _v5)
    GirFFI::ArgHelper.check_error(_v5)
    _v7 = _v2.get_uint64(0)
    _v8 = _v3.get_uint64(0)
    _v9 = GirFFI::AllocationHelper.free_after(_v6, &:to_utf8)
    return [_v9, _v7, _v8]
  end
  def self.log_default_handler(log_domain, log_level, message = nil, unused_data = nil)
    _v1 = GirFFI::InPointer.from_utf8(log_domain)
    _v2 = log_level
    _v3 = GirFFI::InPointer.from_utf8(message)
    _v4 = unused_data
    GLib::Lib.g_log_default_handler(_v1, _v2, _v3, _v4)
  end
  def self.log_get_debug_enabled
    _v1 = GLib::Lib.g_log_get_debug_enabled
    return _v1
  end
  def self.log_remove_handler(log_domain, handler_id)
    _v1 = GirFFI::InPointer.from_utf8(log_domain)
    _v2 = handler_id
    GLib::Lib.g_log_remove_handler(_v1, _v2)
  end
  def self.log_set_always_fatal(fatal_mask)
    _v1 = fatal_mask
    _v2 = GLib::Lib.g_log_set_always_fatal(_v1)
    return _v2
  end
  def self.log_set_debug_enabled(enabled)
    _v1 = enabled
    GLib::Lib.g_log_set_debug_enabled(_v1)
  end
  def self.log_set_fatal_mask(log_domain, fatal_mask)
    _v1 = GirFFI::InPointer.from_utf8(log_domain)
    _v2 = fatal_mask
    _v3 = GLib::Lib.g_log_set_fatal_mask(_v1, _v2)
    return _v3
  end
  def self.log_set_handler(log_domain, log_levels, &log_func)
    _v1 = GirFFI::InPointer.from_utf8(log_domain)
    _v2 = log_levels
    _v3 = GLib::LogFunc.from(log_func)
    _v4 = GirFFI::ArgHelper.store(_v3)
    _v5 = GLib::DestroyNotify.default
    _v6 = GLib::Lib.g_log_set_handler_full(_v1, _v2, _v3, _v4, _v5)
    return _v6
  end
  def self.log_set_writer_func
    _v1 = GLib::DestroyNotify.default
    _v2 = GirFFI::ArgHelper.store(_v1)
    _v3 = GLib::DestroyNotify.default
    GLib::Lib.g_log_set_writer_func(_v1, _v2, _v3)
  end
  def self.log_structured_array(log_level, fields)
    _v1 = log_level
    n_fields = fields.nil? ? (0) : (fields.length)
    _v2 = n_fields
    _v3 = GirFFI::SizedArray.from(GLib::LogField, -1, fields)
    GLib::Lib.g_log_structured_array(_v1, _v3, _v2)
  end
  def self.log_variant(log_domain, log_level, fields)
    _v1 = GirFFI::InPointer.from_utf8(log_domain)
    _v2 = log_level
    _v3 = GLib::Variant.from(fields)
    GLib::Lib.g_log_variant(_v1, _v2, _v3)
  end
  def self.log_writer_default(log_level, fields, user_data = nil)
    _v1 = log_level
    n_fields = fields.nil? ? (0) : (fields.length)
    _v2 = n_fields
    _v3 = user_data
    _v4 = GirFFI::SizedArray.from(GLib::LogField, -1, fields)
    _v5 = GLib::Lib.g_log_writer_default(_v1, _v4, _v2, _v3)
    return _v5
  end
  def self.log_writer_default_set_debug_domains(domains = nil)
    _v1 = GirFFI::InPointer.from_utf8(domains)
    GLib::Lib.g_log_writer_default_set_debug_domains(_v1)
  end
  def self.log_writer_default_set_use_stderr(use_stderr)
    _v1 = use_stderr
    GLib::Lib.g_log_writer_default_set_use_stderr(_v1)
  end
  def self.log_writer_default_would_drop(log_level, log_domain = nil)
    _v1 = log_level
    _v2 = GirFFI::InPointer.from_utf8(log_domain)
    _v3 = GLib::Lib.g_log_writer_default_would_drop(_v1, _v2)
    return _v3
  end
  def self.log_writer_format_fields(log_level, fields, use_color)
    _v1 = log_level
    n_fields = fields.nil? ? (0) : (fields.length)
    _v2 = n_fields
    _v3 = use_color
    _v4 = GirFFI::SizedArray.from(GLib::LogField, -1, fields)
    _v5 = GLib::Lib.g_log_writer_format_fields(_v1, _v4, _v2, _v3)
    _v6 = GirFFI::AllocationHelper.free_after(_v5, &:to_utf8)
    return _v6
  end
  def self.log_writer_is_journald(output_fd)
    _v1 = output_fd
    _v2 = GLib::Lib.g_log_writer_is_journald(_v1)
    return _v2
  end
  def self.log_writer_journald(log_level, fields, user_data = nil)
    _v1 = log_level
    n_fields = fields.nil? ? (0) : (fields.length)
    _v2 = n_fields
    _v3 = user_data
    _v4 = GirFFI::SizedArray.from(GLib::LogField, -1, fields)
    _v5 = GLib::Lib.g_log_writer_journald(_v1, _v4, _v2, _v3)
    return _v5
  end
  def self.log_writer_standard_streams(log_level, fields, user_data = nil)
    _v1 = log_level
    n_fields = fields.nil? ? (0) : (fields.length)
    _v2 = n_fields
    _v3 = user_data
    _v4 = GirFFI::SizedArray.from(GLib::LogField, -1, fields)
    _v5 = GLib::Lib.g_log_writer_standard_streams(_v1, _v4, _v2, _v3)
    return _v5
  end
  def self.log_writer_supports_color(output_fd)
    _v1 = output_fd
    _v2 = GLib::Lib.g_log_writer_supports_color(_v1)
    return _v2
  end
  def self.log_writer_syslog(log_level, fields, user_data = nil)
    _v1 = log_level
    n_fields = fields.nil? ? (0) : (fields.length)
    _v2 = n_fields
    _v3 = user_data
    _v4 = GirFFI::SizedArray.from(GLib::LogField, -1, fields)
    _v5 = GLib::Lib.g_log_writer_syslog(_v1, _v4, _v2, _v3)
    return _v5
  end
  def self.lstat(filename, buf)
    _v1 = filename
    _v2 = GLib::StatBuf.from(buf)
    _v3 = GLib::Lib.g_lstat(_v1, _v2)
    return _v3
  end
  Macro__has_attribute___noreturn__ = 0
  Macro__has_attribute_ifunc = 0
  Macro__has_attribute_no_sanitize_address = 0
  def self.main_context_default
    _v1 = GLib::Lib.g_main_context_default
    _v2 = GLib::MainContext.wrap_copy(_v1)
    return _v2
  end
  def self.main_context_get_thread_default
    _v1 = GLib::Lib.g_main_context_get_thread_default
    _v2 = GLib::MainContext.wrap_copy(_v1)
    return _v2
  end
  def self.main_context_ref_thread_default
    _v1 = GLib::Lib.g_main_context_ref_thread_default
    _v2 = GLib::MainContext.wrap_own(_v1)
    return _v2
  end
  def self.main_current_source
    _v1 = GLib::Lib.g_main_current_source
    _v2 = GLib::Source.wrap_copy(_v1)
    return _v2
  end
  def self.main_depth
    _v1 = GLib::Lib.g_main_depth
    return _v1
  end
  def self.malloc(n_bytes)
    _v1 = n_bytes
    _v2 = GLib::Lib.g_malloc(_v1)
    return _v2
  end
  def self.malloc0(n_bytes)
    _v1 = n_bytes
    _v2 = GLib::Lib.g_malloc0(_v1)
    return _v2
  end
  def self.malloc0_n(n_blocks, n_block_bytes)
    _v1 = n_blocks
    _v2 = n_block_bytes
    _v3 = GLib::Lib.g_malloc0_n(_v1, _v2)
    return _v3
  end
  def self.malloc_n(n_blocks, n_block_bytes)
    _v1 = n_blocks
    _v2 = n_block_bytes
    _v3 = GLib::Lib.g_malloc_n(_v1, _v2)
    return _v3
  end
  def self.markup_error_quark
    _v1 = GLib::Lib.g_markup_error_quark
    return _v1
  end
  def self.markup_escape_text(text, length)
    _v1 = GirFFI::InPointer.from_utf8(text)
    _v2 = length
    _v3 = GLib::Lib.g_markup_escape_text(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.mem_chunk_info
    GLib::Lib.g_mem_chunk_info
  end
  def self.mem_is_system_malloc
    _v1 = GLib::Lib.g_mem_is_system_malloc
    return _v1
  end
  def self.mem_profile
    GLib::Lib.g_mem_profile
  end
  def self.mem_set_vtable(vtable)
    _v1 = GLib::MemVTable.from(vtable)
    GLib::Lib.g_mem_set_vtable(_v1)
  end
  def self.memdup(mem, byte_size)
    _v1 = mem
    _v2 = byte_size
    _v3 = GLib::Lib.g_memdup(_v1, _v2)
    return _v3
  end
  def self.memdup2(mem, byte_size)
    _v1 = mem
    _v2 = byte_size
    _v3 = GLib::Lib.g_memdup2(_v1, _v2)
    return _v3
  end
  def self.mkdir(filename, mode)
    _v1 = filename
    _v2 = mode
    _v3 = GLib::Lib.g_mkdir(_v1, _v2)
    return _v3
  end
  def self.mkdir_with_parents(pathname, mode)
    _v1 = pathname
    _v2 = mode
    _v3 = GLib::Lib.g_mkdir_with_parents(_v1, _v2)
    return _v3
  end
  def self.node_pop_allocator
    GLib::Lib.g_node_pop_allocator
  end
  def self.node_push_allocator(allocator)
    _v1 = GLib::Allocator.from(allocator)
    GLib::Lib.g_node_push_allocator(_v1)
  end
  def self.nullify_pointer(nullify_location)
    _v1 = nullify_location
    GLib::Lib.g_nullify_pointer(_v1)
  end
  def self.number_parser_error_quark
    _v1 = GLib::Lib.g_number_parser_error_quark
    return _v1
  end
  def self.on_error_query(prg_name)
    _v1 = GirFFI::InPointer.from_utf8(prg_name)
    GLib::Lib.g_on_error_query(_v1)
  end
  def self.on_error_stack_trace(prg_name = nil)
    _v1 = GirFFI::InPointer.from_utf8(prg_name)
    GLib::Lib.g_on_error_stack_trace(_v1)
  end
  def self.once_init_enter(location)
    _v1 = FFI::MemoryPointer.new(:pointer)
    _v1.put_pointer(0, location)
    _v2 = GLib::Lib.g_once_init_enter(_v1)
    _v3 = _v1.get_pointer(0)
    return [_v2, _v3]
  end
  def self.once_init_enter_impl(location)
    _v1 = location
    _v2 = GLib::Lib.g_once_init_enter_impl(_v1)
    return _v2
  end
  def self.once_init_enter_pointer(location)
    _v1 = location
    _v2 = GLib::Lib.g_once_init_enter_pointer(_v1)
    return _v2
  end
  def self.once_init_leave(location, result)
    _v1 = FFI::MemoryPointer.new(:pointer)
    _v1.put_pointer(0, location)
    _v2 = result
    GLib::Lib.g_once_init_leave(_v1, _v2)
    _v3 = _v1.get_pointer(0)
    return _v3
  end
  def self.once_init_leave_pointer(location, result = nil)
    _v1 = location
    _v2 = result
    GLib::Lib.g_once_init_leave_pointer(_v1, _v2)
  end
  def self.open(filename, flags, mode)
    _v1 = filename
    _v2 = flags
    _v3 = mode
    _v4 = GLib::Lib.g_open(_v1, _v2, _v3)
    return _v4
  end
  def self.option_error_quark
    _v1 = GLib::Lib.g_option_error_quark
    return _v1
  end
  def self.parse_debug_string(string, keys)
    _v1 = GirFFI::InPointer.from_utf8(string)
    nkeys = keys.nil? ? (0) : (keys.length)
    _v2 = nkeys
    _v3 = GirFFI::SizedArray.from(GLib::DebugKey, -1, keys)
    _v4 = GLib::Lib.g_parse_debug_string(_v1, _v3, _v2)
    return _v4
  end
  def self.path_buf_equal(v1, v2)
    _v1 = v1
    _v2 = v2
    _v3 = GLib::Lib.g_path_buf_equal(_v1, _v2)
    return _v3
  end
  def self.path_get_basename(file_name)
    _v1 = file_name
    _v2 = GLib::Lib.g_path_get_basename(_v1)
    _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
    return _v3
  end
  def self.path_get_dirname(file_name)
    _v1 = file_name
    _v2 = GLib::Lib.g_path_get_dirname(_v1)
    _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
    return _v3
  end
  def self.path_is_absolute(file_name)
    _v1 = file_name
    _v2 = GLib::Lib.g_path_is_absolute(_v1)
    return _v2
  end
  def self.path_skip_root(file_name)
    _v1 = file_name
    _v2 = GLib::Lib.g_path_skip_root(_v1)
    _v3 = _v2.to_utf8
    return _v3
  end
  def self.pattern_match_simple(pattern, string)
    _v1 = GirFFI::InPointer.from_utf8(pattern)
    _v2 = GirFFI::InPointer.from_utf8(string)
    _v3 = GLib::Lib.g_pattern_match_simple(_v1, _v2)
    return _v3
  end
  def self.pointer_bit_lock(address, lock_bit)
    _v1 = address
    _v2 = lock_bit
    GLib::Lib.g_pointer_bit_lock(_v1, _v2)
  end
  def self.pointer_bit_lock_and_get(address, lock_bit)
    _v1 = address
    _v2 = lock_bit
    _v3 = FFI::MemoryPointer.new(:uint64)
    GLib::Lib.g_pointer_bit_lock_and_get(_v1, _v2, _v3)
    _v4 = _v3.get_uint64(0)
    return _v4
  end
  def self.pointer_bit_lock_mask_ptr(ptr, lock_bit, set, preserve_mask, preserve_ptr = nil)
    _v1 = ptr
    _v2 = lock_bit
    _v3 = set
    _v4 = preserve_mask
    _v5 = preserve_ptr
    _v6 = GLib::Lib.g_pointer_bit_lock_mask_ptr(_v1, _v2, _v3, _v4, _v5)
    return _v6
  end
  def self.pointer_bit_trylock(address, lock_bit)
    _v1 = address
    _v2 = lock_bit
    _v3 = GLib::Lib.g_pointer_bit_trylock(_v1, _v2)
    return _v3
  end
  def self.pointer_bit_unlock(address, lock_bit)
    _v1 = address
    _v2 = lock_bit
    GLib::Lib.g_pointer_bit_unlock(_v1, _v2)
  end
  def self.pointer_bit_unlock_and_set(address, lock_bit, ptr, preserve_mask)
    _v1 = address
    _v2 = lock_bit
    _v3 = ptr
    _v4 = preserve_mask
    GLib::Lib.g_pointer_bit_unlock_and_set(_v1, _v2, _v3, _v4)
  end
  def self.poll(fds, nfds, timeout)
    _v1 = GLib::PollFD.from(fds)
    _v2 = nfds
    _v3 = timeout
    _v4 = GLib::Lib.g_poll(_v1, _v2, _v3)
    return _v4
  end
  def self.prefix_error_literal(err, prefix)
    _v1 = FFI::MemoryPointer.new(:pointer)
    _v1.put_pointer(0, GLib::Error.from(err))
    _v2 = GirFFI::InPointer.from_utf8(prefix)
    GLib::Lib.g_prefix_error_literal(_v1, _v2)
    _v3 = GLib::Error.wrap(_v1.get_pointer(0))
    return _v3
  end
  def self.propagate_error(src)
    _v1 = FFI::MemoryPointer.new(:pointer)
    _v2 = GLib::Error.from(src)
    GLib::Lib.g_propagate_error(_v1, _v2)
    _v3 = GLib::Error.wrap(_v1.get_pointer(0))
    return _v3
  end
  def self.qsort_with_data(pbase, total_elems, size, &compare_func)
    _v1 = pbase
    _v2 = total_elems
    _v3 = size
    _v4 = GLib::CompareDataFunc.from(compare_func)
    _v5 = GirFFI::ArgHelper.store(_v4)
    GLib::Lib.g_qsort_with_data(_v1, _v2, _v3, _v4, _v5)
  end
  def self.quark_from_static_string(string = nil)
    _v1 = GirFFI::InPointer.from_utf8(string)
    _v2 = GLib::Lib.g_quark_from_static_string(_v1)
    return _v2
  end
  def self.quark_from_string(string = nil)
    _v1 = GirFFI::InPointer.from_utf8(string)
    _v2 = GLib::Lib.g_quark_from_string(_v1)
    return _v2
  end
  def self.quark_to_string(quark)
    _v1 = quark
    _v2 = GLib::Lib.g_quark_to_string(_v1)
    _v3 = _v2.to_utf8
    return _v3
  end
  def self.quark_try_string(string = nil)
    _v1 = GirFFI::InPointer.from_utf8(string)
    _v2 = GLib::Lib.g_quark_try_string(_v1)
    return _v2
  end
  def self.random_double
    _v1 = GLib::Lib.g_random_double
    return _v1
  end
  def self.random_double_range(begin_, end_)
    _v1 = begin_
    _v2 = end_
    _v3 = GLib::Lib.g_random_double_range(_v1, _v2)
    return _v3
  end
  def self.random_int
    _v1 = GLib::Lib.g_random_int
    return _v1
  end
  def self.random_int_range(begin_, end_)
    _v1 = begin_
    _v2 = end_
    _v3 = GLib::Lib.g_random_int_range(_v1, _v2)
    return _v3
  end
  def self.random_set_seed(seed)
    _v1 = seed
    GLib::Lib.g_random_set_seed(_v1)
  end
  def self.rc_box_acquire(mem_block)
    _v1 = mem_block
    _v2 = GLib::Lib.g_rc_box_acquire(_v1)
    return _v2
  end
  def self.rc_box_alloc(block_size)
    _v1 = block_size
    _v2 = GLib::Lib.g_rc_box_alloc(_v1)
    return _v2
  end
  def self.rc_box_alloc0(block_size)
    _v1 = block_size
    _v2 = GLib::Lib.g_rc_box_alloc0(_v1)
    return _v2
  end
  def self.rc_box_dup(block_size, mem_block)
    _v1 = block_size
    _v2 = mem_block
    _v3 = GLib::Lib.g_rc_box_dup(_v1, _v2)
    return _v3
  end
  def self.rc_box_get_size(mem_block)
    _v1 = mem_block
    _v2 = GLib::Lib.g_rc_box_get_size(_v1)
    return _v2
  end
  def self.rc_box_release(mem_block)
    _v1 = mem_block
    GLib::Lib.g_rc_box_release(_v1)
  end
  def self.rc_box_release_full(mem_block, &clear_func)
    _v1 = mem_block
    _v2 = GLib::DestroyNotify.from(clear_func)
    GLib::Lib.g_rc_box_release_full(_v1, _v2)
  end
  def self.realloc(mem, n_bytes)
    _v1 = mem
    _v2 = n_bytes
    _v3 = GLib::Lib.g_realloc(_v1, _v2)
    return _v3
  end
  def self.realloc_n(mem, n_blocks, n_block_bytes)
    _v1 = mem
    _v2 = n_blocks
    _v3 = n_block_bytes
    _v4 = GLib::Lib.g_realloc_n(_v1, _v2, _v3)
    return _v4
  end
  def self.ref_count_compare(rc, val)
    _v1 = rc
    _v2 = val
    _v3 = GLib::Lib.g_ref_count_compare(_v1, _v2)
    return _v3
  end
  def self.ref_count_dec(rc)
    _v1 = rc
    _v2 = GLib::Lib.g_ref_count_dec(_v1)
    return _v2
  end
  def self.ref_count_inc(rc)
    _v1 = rc
    GLib::Lib.g_ref_count_inc(_v1)
  end
  def self.ref_count_init(rc)
    _v1 = rc
    GLib::Lib.g_ref_count_init(_v1)
  end
  def self.ref_string_acquire(str)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = GLib::Lib.g_ref_string_acquire(_v1)
    _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
    return _v3
  end
  def self.ref_string_equal(str1, str2)
    _v1 = GirFFI::InPointer.from_utf8(str1)
    _v2 = GirFFI::InPointer.from_utf8(str2)
    _v3 = GLib::Lib.g_ref_string_equal(_v1, _v2)
    return _v3
  end
  def self.ref_string_length(str)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = GLib::Lib.g_ref_string_length(_v1)
    return _v2
  end
  def self.ref_string_new(str)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = GLib::Lib.g_ref_string_new(_v1)
    _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
    return _v3
  end
  def self.ref_string_new_intern(str)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = GLib::Lib.g_ref_string_new_intern(_v1)
    _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
    return _v3
  end
  def self.ref_string_new_len(str, len)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = len
    _v3 = GLib::Lib.g_ref_string_new_len(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.ref_string_release(str)
    _v1 = GirFFI::InPointer.from_utf8(str)
    GLib::Lib.g_ref_string_release(_v1)
  end
  def self.regex_check_replacement(replacement)
    _v1 = GirFFI::InPointer.from_utf8(replacement)
    _v2 = FFI::MemoryPointer.new(GirFFI::Boolean)
    _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v4 = GLib::Lib.g_regex_check_replacement(_v1, _v2, _v3)
    GirFFI::ArgHelper.check_error(_v3)
    _v5 = GirFFI::Boolean.get_value_from_pointer(_v2, 0)
    return [_v4, _v5]
  end
  def self.regex_error_quark
    _v1 = GLib::Lib.g_regex_error_quark
    return _v1
  end
  def self.regex_escape_nul(string, length)
    _v1 = GirFFI::InPointer.from_utf8(string)
    _v2 = length
    _v3 = GLib::Lib.g_regex_escape_nul(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.regex_escape_string(string, length)
    _v1 = GirFFI::InPointer.from_utf8(string)
    _v2 = length
    _v3 = GLib::Lib.g_regex_escape_string(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.regex_match_simple(pattern, string, compile_options, match_options)
    _v1 = GirFFI::InPointer.from_utf8(pattern)
    _v2 = GirFFI::InPointer.from_utf8(string)
    _v3 = compile_options
    _v4 = match_options
    _v5 = GLib::Lib.g_regex_match_simple(_v1, _v2, _v3, _v4)
    return _v5
  end
  def self.regex_split_simple(pattern, string, compile_options, match_options)
    _v1 = GirFFI::InPointer.from_utf8(pattern)
    _v2 = GirFFI::InPointer.from_utf8(string)
    _v3 = compile_options
    _v4 = match_options
    _v5 = GLib::Lib.g_regex_split_simple(_v1, _v2, _v3, _v4)
    _v6 = GLib::Strv.wrap(_v5)
    return _v6
  end
  def self.reload_user_special_dirs_cache
    GLib::Lib.g_reload_user_special_dirs_cache
  end
  def self.remove(filename)
    _v1 = filename
    _v2 = GLib::Lib.g_remove(_v1)
    return _v2
  end
  def self.rename(oldfilename, newfilename)
    _v1 = oldfilename
    _v2 = newfilename
    _v3 = GLib::Lib.g_rename(_v1, _v2)
    return _v3
  end
  def self.rmdir(filename)
    _v1 = filename
    _v2 = GLib::Lib.g_rmdir(_v1)
    return _v2
  end
  def self.sequence_foreach_range(begin_, end_, &func)
    _v1 = GLib::SequenceIter.from(begin_)
    _v2 = GLib::SequenceIter.from(end_)
    _v3 = GLib::Func.from(func)
    _v4 = GirFFI::ArgHelper.store(_v3)
    GLib::Lib.g_sequence_foreach_range(_v1, _v2, _v3, _v4)
  end
  def self.sequence_get(iter)
    _v1 = GLib::SequenceIter.from(iter)
    _v2 = GLib::Lib.g_sequence_get(_v1)
    return _v2
  end
  def self.sequence_insert_before(iter, data = nil)
    _v1 = GLib::SequenceIter.from(iter)
    _v2 = data
    _v3 = GLib::Lib.g_sequence_insert_before(_v1, _v2)
    _v4 = GLib::SequenceIter.wrap_copy(_v3)
    return _v4
  end
  def self.sequence_move(src, dest)
    _v1 = GLib::SequenceIter.from(src)
    _v2 = GLib::SequenceIter.from(dest)
    GLib::Lib.g_sequence_move(_v1, _v2)
  end
  def self.sequence_move_range(dest, begin_, end_)
    _v1 = GLib::SequenceIter.from(dest)
    _v2 = GLib::SequenceIter.from(begin_)
    _v3 = GLib::SequenceIter.from(end_)
    GLib::Lib.g_sequence_move_range(_v1, _v2, _v3)
  end
  def self.sequence_range_get_midpoint(begin_, end_)
    _v1 = GLib::SequenceIter.from(begin_)
    _v2 = GLib::SequenceIter.from(end_)
    _v3 = GLib::Lib.g_sequence_range_get_midpoint(_v1, _v2)
    _v4 = GLib::SequenceIter.wrap_copy(_v3)
    return _v4
  end
  def self.sequence_remove(iter)
    _v1 = GLib::SequenceIter.from(iter)
    GLib::Lib.g_sequence_remove(_v1)
  end
  def self.sequence_remove_range(begin_, end_)
    _v1 = GLib::SequenceIter.from(begin_)
    _v2 = GLib::SequenceIter.from(end_)
    GLib::Lib.g_sequence_remove_range(_v1, _v2)
  end
  def self.sequence_set(iter, data = nil)
    _v1 = GLib::SequenceIter.from(iter)
    _v2 = data
    GLib::Lib.g_sequence_set(_v1, _v2)
  end
  def self.sequence_sort_changed(iter, &cmp_func)
    _v1 = GLib::SequenceIter.from(iter)
    _v2 = GLib::CompareDataFunc.from(cmp_func)
    _v3 = GirFFI::ArgHelper.store(_v2)
    GLib::Lib.g_sequence_sort_changed(_v1, _v2, _v3)
  end
  def self.sequence_sort_changed_iter(iter, &iter_cmp)
    _v1 = GLib::SequenceIter.from(iter)
    _v2 = GLib::SequenceIterCompareFunc.from(iter_cmp)
    _v3 = GirFFI::ArgHelper.store(_v2)
    GLib::Lib.g_sequence_sort_changed_iter(_v1, _v2, _v3)
  end
  def self.sequence_swap(a, b)
    _v1 = GLib::SequenceIter.from(a)
    _v2 = GLib::SequenceIter.from(b)
    GLib::Lib.g_sequence_swap(_v1, _v2)
  end
  def self.set_application_name(application_name)
    _v1 = GirFFI::InPointer.from_utf8(application_name)
    GLib::Lib.g_set_application_name(_v1)
  end
  def self.set_error_literal(domain, code, message)
    _v1 = FFI::MemoryPointer.new(:pointer)
    _v2 = domain
    _v3 = code
    _v4 = GirFFI::InPointer.from_utf8(message)
    GLib::Lib.g_set_error_literal(_v1, _v2, _v3, _v4)
    _v5 = GLib::Error.wrap(_v1.get_pointer(0))
    return _v5
  end
  def self.set_prgname(prgname)
    _v1 = GirFFI::InPointer.from_utf8(prgname)
    GLib::Lib.g_set_prgname(_v1)
  end
  def self.setenv(variable, value, overwrite)
    _v1 = variable
    _v2 = value
    _v3 = overwrite
    _v4 = GLib::Lib.g_setenv(_v1, _v2, _v3)
    return _v4
  end
  def self.shell_error_quark
    _v1 = GLib::Lib.g_shell_error_quark
    return _v1
  end
  def self.shell_parse_argv(command_line)
    _v1 = command_line
    _v2 = FFI::MemoryPointer.new(:int32)
    _v3 = FFI::MemoryPointer.new(:pointer)
    _v4 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v5 = GLib::Lib.g_shell_parse_argv(_v1, _v2, _v3, _v4)
    GirFFI::ArgHelper.check_error(_v4)
    _v6 = GLib::Strv.wrap(_v3.get_pointer(0))
    return [_v5, _v6]
  end
  def self.shell_quote(unquoted_string)
    _v1 = unquoted_string
    _v2 = GLib::Lib.g_shell_quote(_v1)
    _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
    return _v3
  end
  def self.shell_unquote(quoted_string)
    _v1 = quoted_string
    _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v3 = GLib::Lib.g_shell_unquote(_v1, _v2)
    GirFFI::ArgHelper.check_error(_v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.slice_alloc(block_size)
    _v1 = block_size
    _v2 = GLib::Lib.g_slice_alloc(_v1)
    return _v2
  end
  def self.slice_alloc0(block_size)
    _v1 = block_size
    _v2 = GLib::Lib.g_slice_alloc0(_v1)
    return _v2
  end
  def self.slice_copy(block_size, mem_block = nil)
    _v1 = block_size
    _v2 = mem_block
    _v3 = GLib::Lib.g_slice_copy(_v1, _v2)
    return _v3
  end
  def self.slice_free1(block_size, mem_block = nil)
    _v1 = block_size
    _v2 = mem_block
    GLib::Lib.g_slice_free1(_v1, _v2)
  end
  def self.slice_free_chain_with_offset(block_size, mem_chain, next_offset)
    _v1 = block_size
    _v2 = mem_chain
    _v3 = next_offset
    GLib::Lib.g_slice_free_chain_with_offset(_v1, _v2, _v3)
  end
  def self.slice_get_config(ckey)
    _v1 = ckey
    _v2 = GLib::Lib.g_slice_get_config(_v1)
    return _v2
  end
  def self.slice_get_config_state(ckey, address, n_values)
    _v1 = ckey
    _v2 = address
    _v3 = n_values
    _v4 = GLib::Lib.g_slice_get_config_state(_v1, _v2, _v3)
    return _v4
  end
  def self.slice_set_config(ckey, value)
    _v1 = ckey
    _v2 = value
    GLib::Lib.g_slice_set_config(_v1, _v2)
  end
  def self.slist_pop_allocator
    GLib::Lib.g_slist_pop_allocator
  end
  def self.slist_push_allocator(allocator)
    _v1 = GLib::Allocator.from(allocator)
    GLib::Lib.g_slist_push_allocator(_v1)
  end
  def self.source_remove(tag)
    _v1 = tag
    _v2 = GLib::Lib.g_source_remove(_v1)
    return _v2
  end
  def self.source_remove_by_funcs_user_data(funcs, user_data = nil)
    _v1 = GLib::SourceFuncs.from(funcs)
    _v2 = user_data
    _v3 = GLib::Lib.g_source_remove_by_funcs_user_data(_v1, _v2)
    return _v3
  end
  def self.source_remove_by_user_data(user_data = nil)
    _v1 = user_data
    _v2 = GLib::Lib.g_source_remove_by_user_data(_v1)
    return _v2
  end
  def self.source_set_name_by_id(tag, name)
    _v1 = tag
    _v2 = GirFFI::InPointer.from_utf8(name)
    GLib::Lib.g_source_set_name_by_id(_v1, _v2)
  end
  def self.spaced_primes_closest(num)
    _v1 = num
    _v2 = GLib::Lib.g_spaced_primes_closest(_v1)
    return _v2
  end
  def self.spawn_async(working_directory, argv, envp, flags, &child_setup)
    _v1 = working_directory
    _v2 = GLib::Strv.from(argv)
    _v3 = GLib::Strv.from(envp)
    _v4 = flags
    _v5 = GLib::SpawnChildSetupFunc.from(child_setup)
    _v6 = GirFFI::ArgHelper.store(_v5)
    _v7 = FFI::MemoryPointer.new(:int32)
    _v8 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v9 = GLib::Lib.g_spawn_async(_v1, _v2, _v3, _v4, _v5, _v6, _v7, _v8)
    GirFFI::ArgHelper.check_error(_v8)
    _v10 = _v7.get_int32(0)
    return [_v9, _v10]
  end
  def self.spawn_async_with_fds(working_directory, argv, envp, flags, stdin_fd, stdout_fd, stderr_fd, &child_setup)
    _v1 = working_directory
    _v2 = GLib::Strv.from(argv)
    _v3 = GLib::Strv.from(envp)
    _v4 = flags
    _v5 = GLib::SpawnChildSetupFunc.from(child_setup)
    _v6 = GirFFI::ArgHelper.store(_v5)
    _v7 = FFI::MemoryPointer.new(:int32)
    _v8 = stdin_fd
    _v9 = stdout_fd
    _v10 = stderr_fd
    _v11 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v12 = GLib::Lib.g_spawn_async_with_fds(_v1, _v2, _v3, _v4, _v5, _v6, _v7, _v8, _v9, _v10, _v11)
    GirFFI::ArgHelper.check_error(_v11)
    _v13 = _v7.get_int32(0)
    return [_v12, _v13]
  end
  def self.spawn_async_with_pipes(working_directory, argv, envp, flags, &child_setup)
    _v1 = working_directory
    _v2 = GLib::Strv.from(argv)
    _v3 = GLib::Strv.from(envp)
    _v4 = flags
    _v5 = GLib::SpawnChildSetupFunc.from(child_setup)
    _v6 = GirFFI::ArgHelper.store(_v5)
    _v7 = FFI::MemoryPointer.new(:int32)
    _v8 = FFI::MemoryPointer.new(:int32)
    _v9 = FFI::MemoryPointer.new(:int32)
    _v10 = FFI::MemoryPointer.new(:int32)
    _v11 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v12 = GLib::Lib.g_spawn_async_with_pipes(_v1, _v2, _v3, _v4, _v5, _v6, _v7, _v8, _v9, _v10, _v11)
    GirFFI::ArgHelper.check_error(_v11)
    _v13 = _v7.get_int32(0)
    _v14 = _v8.get_int32(0)
    _v15 = _v9.get_int32(0)
    _v16 = _v10.get_int32(0)
    return [_v12, _v13, _v14, _v15, _v16]
  end
  def self.spawn_async_with_pipes_and_fds(working_directory, argv, envp, flags, stdin_fd, stdout_fd, stderr_fd, source_fds = nil, target_fds = nil, &child_setup)
    _v1 = working_directory
    _v2 = GLib::Strv.from(argv)
    _v3 = GLib::Strv.from(envp)
    _v4 = flags
    _v5 = GLib::SpawnChildSetupFunc.from(child_setup)
    _v6 = GirFFI::ArgHelper.store(_v5)
    _v7 = stdin_fd
    _v8 = stdout_fd
    _v9 = stderr_fd
    n_fds = target_fds.nil? ? (0) : (target_fds.length)
    _v10 = n_fds
    _v11 = FFI::MemoryPointer.new(:int32)
    _v12 = FFI::MemoryPointer.new(:int32)
    _v13 = FFI::MemoryPointer.new(:int32)
    _v14 = FFI::MemoryPointer.new(:int32)
    _v15 = GirFFI::SizedArray.from(:gint32, -1, source_fds)
    _v16 = GirFFI::SizedArray.from(:gint32, -1, target_fds)
    _v17 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v18 = GLib::Lib.g_spawn_async_with_pipes_and_fds(_v1, _v2, _v3, _v4, _v5, _v6, _v7, _v8, _v9, _v15, _v16, _v10, _v11, _v12, _v13, _v14, _v17)
    GirFFI::ArgHelper.check_error(_v17)
    _v19 = _v11.get_int32(0)
    _v20 = _v12.get_int32(0)
    _v21 = _v13.get_int32(0)
    _v22 = _v14.get_int32(0)
    return [_v18, _v19, _v20, _v21, _v22]
  end
  def self.spawn_check_exit_status(wait_status)
    _v1 = wait_status
    _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v3 = GLib::Lib.g_spawn_check_exit_status(_v1, _v2)
    GirFFI::ArgHelper.check_error(_v2)
    return _v3
  end
  def self.spawn_check_wait_status(wait_status)
    _v1 = wait_status
    _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v3 = GLib::Lib.g_spawn_check_wait_status(_v1, _v2)
    GirFFI::ArgHelper.check_error(_v2)
    return _v3
  end
  def self.spawn_close_pid(pid)
    _v1 = pid
    GLib::Lib.g_spawn_close_pid(_v1)
  end
  def self.spawn_command_line_async(command_line)
    _v1 = command_line
    _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v3 = GLib::Lib.g_spawn_command_line_async(_v1, _v2)
    GirFFI::ArgHelper.check_error(_v2)
    return _v3
  end
  def self.spawn_command_line_sync(command_line)
    _v1 = command_line
    _v2 = FFI::MemoryPointer.new(:pointer)
    _v3 = FFI::MemoryPointer.new(:pointer)
    _v4 = FFI::MemoryPointer.new(:int32)
    _v5 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v6 = GLib::Lib.g_spawn_command_line_sync(_v1, _v2, _v3, _v4, _v5)
    GirFFI::ArgHelper.check_error(_v5)
    _v7 = GirFFI::ZeroTerminated.wrap(:guint8, _v2.get_pointer(0))
    _v8 = GirFFI::ZeroTerminated.wrap(:guint8, _v3.get_pointer(0))
    _v9 = _v4.get_int32(0)
    return [_v6, _v7, _v8, _v9]
  end
  def self.spawn_error_quark
    _v1 = GLib::Lib.g_spawn_error_quark
    return _v1
  end
  def self.spawn_exit_error_quark
    _v1 = GLib::Lib.g_spawn_exit_error_quark
    return _v1
  end
  def self.spawn_sync(working_directory, argv, envp, flags, &child_setup)
    _v1 = working_directory
    _v2 = GLib::Strv.from(argv)
    _v3 = GLib::Strv.from(envp)
    _v4 = flags
    _v5 = GLib::SpawnChildSetupFunc.from(child_setup)
    _v6 = GirFFI::ArgHelper.store(_v5)
    _v7 = FFI::MemoryPointer.new(:pointer)
    _v8 = FFI::MemoryPointer.new(:pointer)
    _v9 = FFI::MemoryPointer.new(:int32)
    _v10 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v11 = GLib::Lib.g_spawn_sync(_v1, _v2, _v3, _v4, _v5, _v6, _v7, _v8, _v9, _v10)
    GirFFI::ArgHelper.check_error(_v10)
    _v12 = GirFFI::ZeroTerminated.wrap(:guint8, _v7.get_pointer(0))
    _v13 = GirFFI::ZeroTerminated.wrap(:guint8, _v8.get_pointer(0))
    _v14 = _v9.get_int32(0)
    return [_v11, _v12, _v13, _v14]
  end
  def self.stat(filename, buf)
    _v1 = filename
    _v2 = GLib::StatBuf.from(buf)
    _v3 = GLib::Lib.g_stat(_v1, _v2)
    return _v3
  end
  def self.stpcpy(dest, src)
    _v1 = GirFFI::InPointer.from_utf8(dest)
    _v2 = GirFFI::InPointer.from_utf8(src)
    _v3 = GLib::Lib.g_stpcpy(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.str_equal(v1, v2)
    _v1 = v1
    _v2 = v2
    _v3 = GLib::Lib.g_str_equal(_v1, _v2)
    return _v3
  end
  def self.str_has_prefix(str, prefix)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = GirFFI::InPointer.from_utf8(prefix)
    _v3 = GLib::Lib.g_str_has_prefix(_v1, _v2)
    return _v3
  end
  def self.str_has_suffix(str, suffix)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = GirFFI::InPointer.from_utf8(suffix)
    _v3 = GLib::Lib.g_str_has_suffix(_v1, _v2)
    return _v3
  end
  def self.str_hash(v)
    _v1 = v
    _v2 = GLib::Lib.g_str_hash(_v1)
    return _v2
  end
  def self.str_is_ascii(str)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = GLib::Lib.g_str_is_ascii(_v1)
    return _v2
  end
  def self.str_match_string(search_term, potential_hit, accept_alternates)
    _v1 = GirFFI::InPointer.from_utf8(search_term)
    _v2 = GirFFI::InPointer.from_utf8(potential_hit)
    _v3 = accept_alternates
    _v4 = GLib::Lib.g_str_match_string(_v1, _v2, _v3)
    return _v4
  end
  def self.str_to_ascii(str, from_locale = nil)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = GirFFI::InPointer.from_utf8(from_locale)
    _v3 = GLib::Lib.g_str_to_ascii(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.str_tokenize_and_fold(string, translit_locale = nil)
    _v1 = GirFFI::InPointer.from_utf8(string)
    _v2 = GirFFI::InPointer.from_utf8(translit_locale)
    _v3 = FFI::MemoryPointer.new(:pointer)
    _v4 = GLib::Lib.g_str_tokenize_and_fold(_v1, _v2, _v3)
    _v5 = GLib::Strv.wrap(_v3.get_pointer(0))
    _v6 = GLib::Strv.wrap(_v4)
    return [_v6, _v5]
  end
  def self.strcanon(string, valid_chars, substitutor)
    _v1 = GirFFI::InPointer.from_utf8(string)
    _v2 = GirFFI::InPointer.from_utf8(valid_chars)
    _v3 = substitutor
    _v4 = GLib::Lib.g_strcanon(_v1, _v2, _v3)
    _v5 = GirFFI::AllocationHelper.free_after(_v4, &:to_utf8)
    return _v5
  end
  def self.strcasecmp(s1, s2)
    _v1 = GirFFI::InPointer.from_utf8(s1)
    _v2 = GirFFI::InPointer.from_utf8(s2)
    _v3 = GLib::Lib.g_strcasecmp(_v1, _v2)
    return _v3
  end
  def self.strchomp(string)
    _v1 = GirFFI::InPointer.from_utf8(string)
    _v2 = GLib::Lib.g_strchomp(_v1)
    _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
    return _v3
  end
  def self.strchug(string)
    _v1 = GirFFI::InPointer.from_utf8(string)
    _v2 = GLib::Lib.g_strchug(_v1)
    _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
    return _v3
  end
  def self.strcmp0(str1 = nil, str2 = nil)
    _v1 = GirFFI::InPointer.from_utf8(str1)
    _v2 = GirFFI::InPointer.from_utf8(str2)
    _v3 = GLib::Lib.g_strcmp0(_v1, _v2)
    return _v3
  end
  def self.strcompress(source)
    _v1 = GirFFI::InPointer.from_utf8(source)
    _v2 = GLib::Lib.g_strcompress(_v1)
    _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
    return _v3
  end
  def self.strdelimit(string, delimiters, new_delimiter)
    _v1 = GirFFI::InPointer.from_utf8(string)
    _v2 = GirFFI::InPointer.from_utf8(delimiters)
    _v3 = new_delimiter
    _v4 = GLib::Lib.g_strdelimit(_v1, _v2, _v3)
    _v5 = GirFFI::AllocationHelper.free_after(_v4, &:to_utf8)
    return _v5
  end
  def self.strdown(string)
    _v1 = GirFFI::InPointer.from_utf8(string)
    _v2 = GLib::Lib.g_strdown(_v1)
    _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
    return _v3
  end
  def self.strdup(str = nil)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = GLib::Lib.g_strdup(_v1)
    _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
    return _v3
  end
  def self.strdupv(str_array = nil)
    _v1 = GLib::Strv.from(str_array)
    _v2 = GLib::Lib.g_strdupv(_v1)
    _v3 = GLib::Strv.wrap(_v2)
    return _v3
  end
  def self.strerror(errnum)
    _v1 = errnum
    _v2 = GLib::Lib.g_strerror(_v1)
    _v3 = _v2.to_utf8
    return _v3
  end
  def self.strescape(source, exceptions = nil)
    _v1 = GirFFI::InPointer.from_utf8(source)
    _v2 = GirFFI::InPointer.from_utf8(exceptions)
    _v3 = GLib::Lib.g_strescape(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.strfreev(str_array = nil)
    _v1 = GLib::Strv.from(str_array)
    GLib::Lib.g_strfreev(_v1)
  end
  def self.strip_context(msgid, msgval)
    _v1 = GirFFI::InPointer.from_utf8(msgid)
    _v2 = GirFFI::InPointer.from_utf8(msgval)
    _v3 = GLib::Lib.g_strip_context(_v1, _v2)
    _v4 = _v3.to_utf8
    return _v4
  end
  def self.strjoinv(separator, str_array)
    _v1 = GirFFI::InPointer.from_utf8(separator)
    _v2 = GLib::Strv.from(str_array)
    _v3 = GLib::Lib.g_strjoinv(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.strlcat(dest, src, dest_size)
    _v1 = GirFFI::InPointer.from_utf8(dest)
    _v2 = GirFFI::InPointer.from_utf8(src)
    _v3 = dest_size
    _v4 = GLib::Lib.g_strlcat(_v1, _v2, _v3)
    return _v4
  end
  def self.strlcpy(dest, src, dest_size)
    _v1 = GirFFI::InPointer.from_utf8(dest)
    _v2 = GirFFI::InPointer.from_utf8(src)
    _v3 = dest_size
    _v4 = GLib::Lib.g_strlcpy(_v1, _v2, _v3)
    return _v4
  end
  def self.strncasecmp(s1, s2, n)
    _v1 = GirFFI::InPointer.from_utf8(s1)
    _v2 = GirFFI::InPointer.from_utf8(s2)
    _v3 = n
    _v4 = GLib::Lib.g_strncasecmp(_v1, _v2, _v3)
    return _v4
  end
  def self.strndup(str, n)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = n
    _v3 = GLib::Lib.g_strndup(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.strnfill(length, fill_char)
    _v1 = length
    _v2 = fill_char
    _v3 = GLib::Lib.g_strnfill(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.strreverse(string)
    _v1 = GirFFI::InPointer.from_utf8(string)
    _v2 = GLib::Lib.g_strreverse(_v1)
    _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
    return _v3
  end
  def self.strrstr(haystack, needle)
    _v1 = GirFFI::InPointer.from_utf8(haystack)
    _v2 = GirFFI::InPointer.from_utf8(needle)
    _v3 = GLib::Lib.g_strrstr(_v1, _v2)
    _v4 = _v3.to_utf8
    return _v4
  end
  def self.strrstr_len(haystack, haystack_len, needle)
    _v1 = GirFFI::InPointer.from_utf8(haystack)
    _v2 = haystack_len
    _v3 = GirFFI::InPointer.from_utf8(needle)
    _v4 = GLib::Lib.g_strrstr_len(_v1, _v2, _v3)
    _v5 = _v4.to_utf8
    return _v5
  end
  def self.strsignal(signum)
    _v1 = signum
    _v2 = GLib::Lib.g_strsignal(_v1)
    _v3 = _v2.to_utf8
    return _v3
  end
  def self.strsplit(string, delimiter, max_tokens)
    _v1 = GirFFI::InPointer.from_utf8(string)
    _v2 = GirFFI::InPointer.from_utf8(delimiter)
    _v3 = max_tokens
    _v4 = GLib::Lib.g_strsplit(_v1, _v2, _v3)
    _v5 = GLib::Strv.wrap(_v4)
    return _v5
  end
  def self.strsplit_set(string, delimiters, max_tokens)
    _v1 = GirFFI::InPointer.from_utf8(string)
    _v2 = GirFFI::InPointer.from_utf8(delimiters)
    _v3 = max_tokens
    _v4 = GLib::Lib.g_strsplit_set(_v1, _v2, _v3)
    _v5 = GLib::Strv.wrap(_v4)
    return _v5
  end
  def self.strstr_len(haystack, haystack_len, needle)
    _v1 = GirFFI::InPointer.from_utf8(haystack)
    _v2 = haystack_len
    _v3 = GirFFI::InPointer.from_utf8(needle)
    _v4 = GLib::Lib.g_strstr_len(_v1, _v2, _v3)
    _v5 = _v4.to_utf8
    return _v5
  end
  def self.strtod(nptr)
    _v1 = GirFFI::InPointer.from_utf8(nptr)
    _v2 = FFI::MemoryPointer.new(:pointer)
    _v3 = GLib::Lib.g_strtod(_v1, _v2)
    _v4 = _v2.get_pointer(0).to_utf8
    return [_v3, _v4]
  end
  def self.strup(string)
    _v1 = GirFFI::InPointer.from_utf8(string)
    _v2 = GLib::Lib.g_strup(_v1)
    _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
    return _v3
  end
  def self.strv_contains(strv, str)
    _v1 = GLib::Strv.from(strv)
    _v2 = GirFFI::InPointer.from_utf8(str)
    _v3 = GLib::Lib.g_strv_contains(_v1, _v2)
    return _v3
  end
  def self.strv_equal(strv1, strv2)
    _v1 = GLib::Strv.from(strv1)
    _v2 = GLib::Strv.from(strv2)
    _v3 = GLib::Lib.g_strv_equal(_v1, _v2)
    return _v3
  end
  def self.strv_get_type
    _v1 = GLib::Lib.g_strv_get_type
    return _v1
  end
  def self.strv_length(str_array)
    _v1 = GLib::Strv.from(str_array)
    _v2 = GLib::Lib.g_strv_length(_v1)
    return _v2
  end
  def self.test_add_data_func(testpath, test_data = nil, &test_func)
    _v1 = GirFFI::InPointer.from_utf8(testpath)
    _v2 = test_data
    _v3 = GLib::TestDataFunc.from(test_func)
    GLib::Lib.g_test_add_data_func(_v1, _v2, _v3)
  end
  def self.test_add_data_func_full(testpath, test_data = nil, &test_func)
    _v1 = GirFFI::InPointer.from_utf8(testpath)
    _v2 = test_data
    _v3 = GLib::TestDataFunc.from(test_func)
    _v4 = GLib::DestroyNotify.default
    GLib::Lib.g_test_add_data_func_full(_v1, _v2, _v3, _v4)
  end
  def self.test_add_func(testpath, &test_func)
    _v1 = GirFFI::InPointer.from_utf8(testpath)
    _v2 = GLib::TestFunc.from(test_func)
    GLib::Lib.g_test_add_func(_v1, _v2)
  end
  def self.test_assert_expected_messages_internal(domain, file, line, func)
    _v1 = GirFFI::InPointer.from_utf8(domain)
    _v2 = GirFFI::InPointer.from_utf8(file)
    _v3 = line
    _v4 = GirFFI::InPointer.from_utf8(func)
    GLib::Lib.g_test_assert_expected_messages_internal(_v1, _v2, _v3, _v4)
  end
  def self.test_bug(bug_uri_snippet)
    _v1 = GirFFI::InPointer.from_utf8(bug_uri_snippet)
    GLib::Lib.g_test_bug(_v1)
  end
  def self.test_bug_base(uri_pattern)
    _v1 = GirFFI::InPointer.from_utf8(uri_pattern)
    GLib::Lib.g_test_bug_base(_v1)
  end
  def self.test_disable_crash_reporting
    GLib::Lib.g_test_disable_crash_reporting
  end
  def self.test_expect_message(log_domain, log_level, pattern)
    _v1 = GirFFI::InPointer.from_utf8(log_domain)
    _v2 = log_level
    _v3 = GirFFI::InPointer.from_utf8(pattern)
    GLib::Lib.g_test_expect_message(_v1, _v2, _v3)
  end
  def self.test_fail
    GLib::Lib.g_test_fail
  end
  def self.test_failed
    _v1 = GLib::Lib.g_test_failed
    return _v1
  end
  def self.test_get_dir(file_type)
    _v1 = file_type
    _v2 = GLib::Lib.g_test_get_dir(_v1)
    _v3 = _v2.to_utf8
    return _v3
  end
  def self.test_get_path
    _v1 = GLib::Lib.g_test_get_path
    _v2 = _v1.to_utf8
    return _v2
  end
  def self.test_incomplete(msg = nil)
    _v1 = GirFFI::InPointer.from_utf8(msg)
    GLib::Lib.g_test_incomplete(_v1)
  end
  def self.test_log_type_name(log_type)
    _v1 = log_type
    _v2 = GLib::Lib.g_test_log_type_name(_v1)
    _v3 = _v2.to_utf8
    return _v3
  end
  def self.test_queue_destroy(destroy_data = nil, &destroy_func)
    _v1 = GLib::DestroyNotify.from(destroy_func)
    _v2 = destroy_data
    GLib::Lib.g_test_queue_destroy(_v1, _v2)
  end
  def self.test_queue_free(gfree_pointer = nil)
    _v1 = gfree_pointer
    GLib::Lib.g_test_queue_free(_v1)
  end
  def self.test_rand_double
    _v1 = GLib::Lib.g_test_rand_double
    return _v1
  end
  def self.test_rand_double_range(range_start, range_end)
    _v1 = range_start
    _v2 = range_end
    _v3 = GLib::Lib.g_test_rand_double_range(_v1, _v2)
    return _v3
  end
  def self.test_rand_int
    _v1 = GLib::Lib.g_test_rand_int
    return _v1
  end
  def self.test_rand_int_range(begin_, end_)
    _v1 = begin_
    _v2 = end_
    _v3 = GLib::Lib.g_test_rand_int_range(_v1, _v2)
    return _v3
  end
  def self.test_run
    _v1 = GLib::Lib.g_test_run
    return _v1
  end
  def self.test_run_suite(suite)
    _v1 = GLib::TestSuite.from(suite)
    _v2 = GLib::Lib.g_test_run_suite(_v1)
    return _v2
  end
  def self.test_set_nonfatal_assertions
    GLib::Lib.g_test_set_nonfatal_assertions
  end
  def self.test_skip(msg = nil)
    _v1 = GirFFI::InPointer.from_utf8(msg)
    GLib::Lib.g_test_skip(_v1)
  end
  def self.test_subprocess
    _v1 = GLib::Lib.g_test_subprocess
    return _v1
  end
  def self.test_summary(summary)
    _v1 = GirFFI::InPointer.from_utf8(summary)
    GLib::Lib.g_test_summary(_v1)
  end
  def self.test_timer_elapsed
    _v1 = GLib::Lib.g_test_timer_elapsed
    return _v1
  end
  def self.test_timer_last
    _v1 = GLib::Lib.g_test_timer_last
    return _v1
  end
  def self.test_timer_start
    GLib::Lib.g_test_timer_start
  end
  def self.test_trap_assertions(domain, file, line, func, assertion_flags, pattern)
    _v1 = GirFFI::InPointer.from_utf8(domain)
    _v2 = GirFFI::InPointer.from_utf8(file)
    _v3 = line
    _v4 = GirFFI::InPointer.from_utf8(func)
    _v5 = assertion_flags
    _v6 = GirFFI::InPointer.from_utf8(pattern)
    GLib::Lib.g_test_trap_assertions(_v1, _v2, _v3, _v4, _v5, _v6)
  end
  def self.test_trap_fork(usec_timeout, test_trap_flags)
    _v1 = usec_timeout
    _v2 = test_trap_flags
    _v3 = GLib::Lib.g_test_trap_fork(_v1, _v2)
    return _v3
  end
  def self.test_trap_has_passed
    _v1 = GLib::Lib.g_test_trap_has_passed
    return _v1
  end
  def self.test_trap_reached_timeout
    _v1 = GLib::Lib.g_test_trap_reached_timeout
    return _v1
  end
  def self.test_trap_subprocess(test_path, usec_timeout, test_flags)
    _v1 = GirFFI::InPointer.from_utf8(test_path)
    _v2 = usec_timeout
    _v3 = test_flags
    GLib::Lib.g_test_trap_subprocess(_v1, _v2, _v3)
  end
  def self.test_trap_subprocess_with_envp(test_path, envp, usec_timeout, test_flags)
    _v1 = GirFFI::InPointer.from_utf8(test_path)
    _v2 = GLib::Strv.from(envp)
    _v3 = usec_timeout
    _v4 = test_flags
    GLib::Lib.g_test_trap_subprocess_with_envp(_v1, _v2, _v3, _v4)
  end
  def self.thread_error_quark
    _v1 = GLib::Lib.g_thread_error_quark
    return _v1
  end
  def self.thread_exit(retval = nil)
    _v1 = retval
    GLib::Lib.g_thread_exit(_v1)
  end
  def self.thread_pool_get_max_idle_time
    _v1 = GLib::Lib.g_thread_pool_get_max_idle_time
    return _v1
  end
  def self.thread_pool_get_max_unused_threads
    _v1 = GLib::Lib.g_thread_pool_get_max_unused_threads
    return _v1
  end
  def self.thread_pool_get_num_unused_threads
    _v1 = GLib::Lib.g_thread_pool_get_num_unused_threads
    return _v1
  end
  def self.thread_pool_set_max_idle_time(interval)
    _v1 = interval
    GLib::Lib.g_thread_pool_set_max_idle_time(_v1)
  end
  def self.thread_pool_set_max_unused_threads(max_threads)
    _v1 = max_threads
    GLib::Lib.g_thread_pool_set_max_unused_threads(_v1)
  end
  def self.thread_pool_stop_unused_threads
    GLib::Lib.g_thread_pool_stop_unused_threads
  end
  def self.thread_self
    _v1 = GLib::Lib.g_thread_self
    _v2 = GLib::Thread.wrap_copy(_v1)
    return _v2
  end
  def self.thread_yield
    GLib::Lib.g_thread_yield
  end
  def self.time_val_from_iso8601(iso_date)
    _v1 = GirFFI::InPointer.from_utf8(iso_date)
    _v2 = GLib::TimeVal.new
    _v3 = GLib::Lib.g_time_val_from_iso8601(_v1, _v2)
    return [_v3, _v2]
  end
  def self.timeout_add(priority, interval, &function)
    _v1 = priority
    _v2 = interval
    _v3 = GLib::SourceFunc.from(function)
    _v4 = GirFFI::ArgHelper.store(_v3)
    _v5 = GLib::DestroyNotify.default
    _v6 = GLib::Lib.g_timeout_add_full(_v1, _v2, _v3, _v4, _v5)
    return _v6
  end
  def self.timeout_add_seconds(priority, interval, &function)
    _v1 = priority
    _v2 = interval
    _v3 = GLib::SourceFunc.from(function)
    _v4 = GirFFI::ArgHelper.store(_v3)
    _v5 = GLib::DestroyNotify.default
    _v6 = GLib::Lib.g_timeout_add_seconds_full(_v1, _v2, _v3, _v4, _v5)
    return _v6
  end
  def self.timeout_source_new(interval)
    _v1 = interval
    _v2 = GLib::Lib.g_timeout_source_new(_v1)
    _v3 = GLib::Source.wrap_own(_v2)
    return _v3
  end
  def self.timeout_source_new_seconds(interval)
    _v1 = interval
    _v2 = GLib::Lib.g_timeout_source_new_seconds(_v1)
    _v3 = GLib::Source.wrap_own(_v2)
    return _v3
  end
  def self.trash_stack_height(stack_p)
    _v1 = GLib::TrashStack.from(stack_p)
    _v2 = GLib::Lib.g_trash_stack_height(_v1)
    return _v2
  end
  def self.trash_stack_peek(stack_p)
    _v1 = GLib::TrashStack.from(stack_p)
    _v2 = GLib::Lib.g_trash_stack_peek(_v1)
    return _v2
  end
  def self.trash_stack_pop(stack_p)
    _v1 = GLib::TrashStack.from(stack_p)
    _v2 = GLib::Lib.g_trash_stack_pop(_v1)
    return _v2
  end
  def self.trash_stack_push(stack_p, data_p)
    _v1 = GLib::TrashStack.from(stack_p)
    _v2 = data_p
    GLib::Lib.g_trash_stack_push(_v1, _v2)
  end
  def self.try_malloc(n_bytes)
    _v1 = n_bytes
    _v2 = GLib::Lib.g_try_malloc(_v1)
    return _v2
  end
  def self.try_malloc0(n_bytes)
    _v1 = n_bytes
    _v2 = GLib::Lib.g_try_malloc0(_v1)
    return _v2
  end
  def self.try_malloc0_n(n_blocks, n_block_bytes)
    _v1 = n_blocks
    _v2 = n_block_bytes
    _v3 = GLib::Lib.g_try_malloc0_n(_v1, _v2)
    return _v3
  end
  def self.try_malloc_n(n_blocks, n_block_bytes)
    _v1 = n_blocks
    _v2 = n_block_bytes
    _v3 = GLib::Lib.g_try_malloc_n(_v1, _v2)
    return _v3
  end
  def self.try_realloc(mem, n_bytes)
    _v1 = mem
    _v2 = n_bytes
    _v3 = GLib::Lib.g_try_realloc(_v1, _v2)
    return _v3
  end
  def self.try_realloc_n(mem, n_blocks, n_block_bytes)
    _v1 = mem
    _v2 = n_blocks
    _v3 = n_block_bytes
    _v4 = GLib::Lib.g_try_realloc_n(_v1, _v2, _v3)
    return _v4
  end
  def self.ucs4_to_utf16(str)
    len = str.nil? ? (0) : (str.length)
    _v1 = len
    _v2 = FFI::MemoryPointer.new(:int64)
    _v3 = FFI::MemoryPointer.new(:int64)
    _v4 = GirFFI::SizedArray.from(:gunichar, -1, str)
    _v5 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v6 = GLib::Lib.g_ucs4_to_utf16(_v4, _v1, _v2, _v3, _v5)
    GirFFI::ArgHelper.check_error(_v5)
    _v7 = _v2.get_int64(0)
    _v8 = _v3.get_int64(0)
    return [_v6, _v7, _v8]
  end
  def self.ucs4_to_utf8(str)
    len = str.nil? ? (0) : (str.length)
    _v1 = len
    _v2 = FFI::MemoryPointer.new(:int64)
    _v3 = FFI::MemoryPointer.new(:int64)
    _v4 = GirFFI::SizedArray.from(:gunichar, -1, str)
    _v5 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v6 = GLib::Lib.g_ucs4_to_utf8(_v4, _v1, _v2, _v3, _v5)
    GirFFI::ArgHelper.check_error(_v5)
    _v7 = _v2.get_int64(0)
    _v8 = _v3.get_int64(0)
    _v9 = GirFFI::AllocationHelper.free_after(_v6, &:to_utf8)
    return [_v9, _v7, _v8]
  end
  def self.unichar_break_type(c)
    _v1 = c
    _v2 = GLib::Lib.g_unichar_break_type(_v1)
    return _v2
  end
  def self.unichar_combining_class(uc)
    _v1 = uc
    _v2 = GLib::Lib.g_unichar_combining_class(_v1)
    return _v2
  end
  def self.unichar_compose(a, b)
    _v1 = a
    _v2 = b
    _v3 = FFI::MemoryPointer.new(:uint32)
    _v4 = GLib::Lib.g_unichar_compose(_v1, _v2, _v3)
    _v5 = _v3.get_uint32(0)
    return [_v4, _v5]
  end
  def self.unichar_decompose(ch)
    _v1 = ch
    _v2 = FFI::MemoryPointer.new(:uint32)
    _v3 = FFI::MemoryPointer.new(:uint32)
    _v4 = GLib::Lib.g_unichar_decompose(_v1, _v2, _v3)
    _v5 = _v2.get_uint32(0)
    _v6 = _v3.get_uint32(0)
    return [_v4, _v5, _v6]
  end
  def self.unichar_digit_value(c)
    _v1 = c
    _v2 = GLib::Lib.g_unichar_digit_value(_v1)
    return _v2
  end
  def self.unichar_fully_decompose(ch, compat, result_len)
    _v1 = ch
    _v2 = compat
    _v3 = FFI::MemoryPointer.new(:uint32)
    _v4 = result_len
    _v5 = GLib::Lib.g_unichar_fully_decompose(_v1, _v2, _v3, _v4)
    _v6 = _v3.get_uint32(0)
    return [_v5, _v6]
  end
  def self.unichar_get_mirror_char(ch)
    _v1 = ch
    _v2 = FFI::MemoryPointer.new(:uint32)
    _v3 = GLib::Lib.g_unichar_get_mirror_char(_v1, _v2)
    _v4 = _v2.get_uint32(0)
    return [_v3, _v4]
  end
  def self.unichar_get_script(ch)
    _v1 = ch
    _v2 = GLib::Lib.g_unichar_get_script(_v1)
    return _v2
  end
  def self.unichar_isalnum(c)
    _v1 = c
    _v2 = GLib::Lib.g_unichar_isalnum(_v1)
    return _v2
  end
  def self.unichar_isalpha(c)
    _v1 = c
    _v2 = GLib::Lib.g_unichar_isalpha(_v1)
    return _v2
  end
  def self.unichar_iscntrl(c)
    _v1 = c
    _v2 = GLib::Lib.g_unichar_iscntrl(_v1)
    return _v2
  end
  def self.unichar_isdefined(c)
    _v1 = c
    _v2 = GLib::Lib.g_unichar_isdefined(_v1)
    return _v2
  end
  def self.unichar_isdigit(c)
    _v1 = c
    _v2 = GLib::Lib.g_unichar_isdigit(_v1)
    return _v2
  end
  def self.unichar_isgraph(c)
    _v1 = c
    _v2 = GLib::Lib.g_unichar_isgraph(_v1)
    return _v2
  end
  def self.unichar_islower(c)
    _v1 = c
    _v2 = GLib::Lib.g_unichar_islower(_v1)
    return _v2
  end
  def self.unichar_ismark(c)
    _v1 = c
    _v2 = GLib::Lib.g_unichar_ismark(_v1)
    return _v2
  end
  def self.unichar_isprint(c)
    _v1 = c
    _v2 = GLib::Lib.g_unichar_isprint(_v1)
    return _v2
  end
  def self.unichar_ispunct(c)
    _v1 = c
    _v2 = GLib::Lib.g_unichar_ispunct(_v1)
    return _v2
  end
  def self.unichar_isspace(c)
    _v1 = c
    _v2 = GLib::Lib.g_unichar_isspace(_v1)
    return _v2
  end
  def self.unichar_istitle(c)
    _v1 = c
    _v2 = GLib::Lib.g_unichar_istitle(_v1)
    return _v2
  end
  def self.unichar_isupper(c)
    _v1 = c
    _v2 = GLib::Lib.g_unichar_isupper(_v1)
    return _v2
  end
  def self.unichar_iswide(c)
    _v1 = c
    _v2 = GLib::Lib.g_unichar_iswide(_v1)
    return _v2
  end
  def self.unichar_iswide_cjk(c)
    _v1 = c
    _v2 = GLib::Lib.g_unichar_iswide_cjk(_v1)
    return _v2
  end
  def self.unichar_isxdigit(c)
    _v1 = c
    _v2 = GLib::Lib.g_unichar_isxdigit(_v1)
    return _v2
  end
  def self.unichar_iszerowidth(c)
    _v1 = c
    _v2 = GLib::Lib.g_unichar_iszerowidth(_v1)
    return _v2
  end
  def self.unichar_to_utf8(c)
    _v1 = c
    _v2 = FFI::MemoryPointer.new(:pointer)
    _v3 = GLib::Lib.g_unichar_to_utf8(_v1, _v2)
    _v4 = _v2.get_pointer(0).to_utf8
    return [_v3, _v4]
  end
  def self.unichar_tolower(c)
    _v1 = c
    _v2 = GLib::Lib.g_unichar_tolower(_v1)
    return _v2
  end
  def self.unichar_totitle(c)
    _v1 = c
    _v2 = GLib::Lib.g_unichar_totitle(_v1)
    return _v2
  end
  def self.unichar_toupper(c)
    _v1 = c
    _v2 = GLib::Lib.g_unichar_toupper(_v1)
    return _v2
  end
  def self.unichar_type(c)
    _v1 = c
    _v2 = GLib::Lib.g_unichar_type(_v1)
    return _v2
  end
  def self.unichar_validate(ch)
    _v1 = ch
    _v2 = GLib::Lib.g_unichar_validate(_v1)
    return _v2
  end
  def self.unichar_xdigit_value(c)
    _v1 = c
    _v2 = GLib::Lib.g_unichar_xdigit_value(_v1)
    return _v2
  end
  def self.unicode_canonical_decomposition(ch, result_len)
    _v1 = ch
    _v2 = result_len
    _v3 = GLib::Lib.g_unicode_canonical_decomposition(_v1, _v2)
    return _v3
  end
  def self.unicode_canonical_ordering(string)
    len = string.nil? ? (0) : (string.length)
    _v1 = len
    _v2 = GirFFI::SizedArray.from(:gunichar, -1, string)
    GLib::Lib.g_unicode_canonical_ordering(_v2, _v1)
  end
  def self.unicode_script_from_iso15924(iso15924)
    _v1 = iso15924
    _v2 = GLib::Lib.g_unicode_script_from_iso15924(_v1)
    return _v2
  end
  def self.unicode_script_to_iso15924(script)
    _v1 = script
    _v2 = GLib::Lib.g_unicode_script_to_iso15924(_v1)
    return _v2
  end
  def self.unix_error_quark
    _v1 = GLib::Lib.g_unix_error_quark
    return _v1
  end
  def self.unix_fd_add_full(priority, fd, condition, &function)
    _v1 = priority
    _v2 = fd
    _v3 = condition
    _v4 = GLib::UnixFDSourceFunc.from(function)
    _v5 = GirFFI::ArgHelper.store(_v4)
    _v6 = GLib::DestroyNotify.default
    _v7 = GLib::Lib.g_unix_fd_add_full(_v1, _v2, _v3, _v4, _v5, _v6)
    return _v7
  end
  def self.unix_fd_source_new(fd, condition)
    _v1 = fd
    _v2 = condition
    _v3 = GLib::Lib.g_unix_fd_source_new(_v1, _v2)
    _v4 = GLib::Source.wrap_own(_v3)
    return _v4
  end
  def self.unix_get_passwd_entry(user_name)
    _v1 = GirFFI::InPointer.from_utf8(user_name)
    _v2 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v3 = GLib::Lib.g_unix_get_passwd_entry(_v1, _v2)
    GirFFI::ArgHelper.check_error(_v2)
    return _v3
  end
  def self.unix_open_pipe(fds, flags)
    GirFFI::ArgHelper.check_fixed_array_size(2, fds, "fds")
    _v1 = GirFFI::SizedArray.from(:gint32, 2, fds)
    _v2 = flags
    _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v4 = GLib::Lib.g_unix_open_pipe(_v1, _v2, _v3)
    GirFFI::ArgHelper.check_error(_v3)
    return _v4
  end
  def self.unix_set_fd_nonblocking(fd, nonblock)
    _v1 = fd
    _v2 = nonblock
    _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v4 = GLib::Lib.g_unix_set_fd_nonblocking(_v1, _v2, _v3)
    GirFFI::ArgHelper.check_error(_v3)
    return _v4
  end
  def self.unix_signal_add(priority, signum, &handler)
    _v1 = priority
    _v2 = signum
    _v3 = GLib::SourceFunc.from(handler)
    _v4 = GirFFI::ArgHelper.store(_v3)
    _v5 = GLib::DestroyNotify.default
    _v6 = GLib::Lib.g_unix_signal_add_full(_v1, _v2, _v3, _v4, _v5)
    return _v6
  end
  def self.unix_signal_source_new(signum)
    _v1 = signum
    _v2 = GLib::Lib.g_unix_signal_source_new(_v1)
    _v3 = GLib::Source.wrap_own(_v2)
    return _v3
  end
  def self.unlink(filename)
    _v1 = filename
    _v2 = GLib::Lib.g_unlink(_v1)
    return _v2
  end
  def self.unsetenv(variable)
    _v1 = variable
    GLib::Lib.g_unsetenv(_v1)
  end
  def self.uri_build(flags, scheme, userinfo, host, port, path, query = nil, fragment = nil)
    _v1 = flags
    _v2 = GirFFI::InPointer.from_utf8(scheme)
    _v3 = GirFFI::InPointer.from_utf8(userinfo)
    _v4 = GirFFI::InPointer.from_utf8(host)
    _v5 = port
    _v6 = GirFFI::InPointer.from_utf8(path)
    _v7 = GirFFI::InPointer.from_utf8(query)
    _v8 = GirFFI::InPointer.from_utf8(fragment)
    _v9 = GLib::Lib.g_uri_build(_v1, _v2, _v3, _v4, _v5, _v6, _v7, _v8)
    _v10 = GLib::Uri.wrap_own(_v9)
    return _v10
  end
  def self.uri_build_with_user(flags, scheme, user, password, auth_params, host, port, path, query = nil, fragment = nil)
    _v1 = flags
    _v2 = GirFFI::InPointer.from_utf8(scheme)
    _v3 = GirFFI::InPointer.from_utf8(user)
    _v4 = GirFFI::InPointer.from_utf8(password)
    _v5 = GirFFI::InPointer.from_utf8(auth_params)
    _v6 = GirFFI::InPointer.from_utf8(host)
    _v7 = port
    _v8 = GirFFI::InPointer.from_utf8(path)
    _v9 = GirFFI::InPointer.from_utf8(query)
    _v10 = GirFFI::InPointer.from_utf8(fragment)
    _v11 = GLib::Lib.g_uri_build_with_user(_v1, _v2, _v3, _v4, _v5, _v6, _v7, _v8, _v9, _v10)
    _v12 = GLib::Uri.wrap_own(_v11)
    return _v12
  end
  def self.uri_error_quark
    _v1 = GLib::Lib.g_uri_error_quark
    return _v1
  end
  def self.uri_escape_bytes(unescaped, reserved_chars_allowed = nil)
    length = unescaped.nil? ? (0) : (unescaped.length)
    _v1 = length
    _v2 = GirFFI::InPointer.from_utf8(reserved_chars_allowed)
    _v3 = GirFFI::SizedArray.from(:guint8, -1, unescaped)
    _v4 = GLib::Lib.g_uri_escape_bytes(_v3, _v1, _v2)
    _v5 = GirFFI::AllocationHelper.free_after(_v4, &:to_utf8)
    return _v5
  end
  def self.uri_escape_string(unescaped, reserved_chars_allowed, allow_utf8)
    _v1 = GirFFI::InPointer.from_utf8(unescaped)
    _v2 = GirFFI::InPointer.from_utf8(reserved_chars_allowed)
    _v3 = allow_utf8
    _v4 = GLib::Lib.g_uri_escape_string(_v1, _v2, _v3)
    _v5 = GirFFI::AllocationHelper.free_after(_v4, &:to_utf8)
    return _v5
  end
  def self.uri_is_valid(uri_string, flags)
    _v1 = GirFFI::InPointer.from_utf8(uri_string)
    _v2 = flags
    _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v4 = GLib::Lib.g_uri_is_valid(_v1, _v2, _v3)
    GirFFI::ArgHelper.check_error(_v3)
    return _v4
  end
  def self.uri_join(flags, scheme, userinfo, host, port, path, query = nil, fragment = nil)
    _v1 = flags
    _v2 = GirFFI::InPointer.from_utf8(scheme)
    _v3 = GirFFI::InPointer.from_utf8(userinfo)
    _v4 = GirFFI::InPointer.from_utf8(host)
    _v5 = port
    _v6 = GirFFI::InPointer.from_utf8(path)
    _v7 = GirFFI::InPointer.from_utf8(query)
    _v8 = GirFFI::InPointer.from_utf8(fragment)
    _v9 = GLib::Lib.g_uri_join(_v1, _v2, _v3, _v4, _v5, _v6, _v7, _v8)
    _v10 = GirFFI::AllocationHelper.free_after(_v9, &:to_utf8)
    return _v10
  end
  def self.uri_join_with_user(flags, scheme, user, password, auth_params, host, port, path, query = nil, fragment = nil)
    _v1 = flags
    _v2 = GirFFI::InPointer.from_utf8(scheme)
    _v3 = GirFFI::InPointer.from_utf8(user)
    _v4 = GirFFI::InPointer.from_utf8(password)
    _v5 = GirFFI::InPointer.from_utf8(auth_params)
    _v6 = GirFFI::InPointer.from_utf8(host)
    _v7 = port
    _v8 = GirFFI::InPointer.from_utf8(path)
    _v9 = GirFFI::InPointer.from_utf8(query)
    _v10 = GirFFI::InPointer.from_utf8(fragment)
    _v11 = GLib::Lib.g_uri_join_with_user(_v1, _v2, _v3, _v4, _v5, _v6, _v7, _v8, _v9, _v10)
    _v12 = GirFFI::AllocationHelper.free_after(_v11, &:to_utf8)
    return _v12
  end
  def self.uri_list_extract_uris(uri_list)
    _v1 = GirFFI::InPointer.from_utf8(uri_list)
    _v2 = GLib::Lib.g_uri_list_extract_uris(_v1)
    _v3 = GLib::Strv.wrap(_v2)
    return _v3
  end
  def self.uri_parse(uri_string, flags)
    _v1 = GirFFI::InPointer.from_utf8(uri_string)
    _v2 = flags
    _v3 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v4 = GLib::Lib.g_uri_parse(_v1, _v2, _v3)
    GirFFI::ArgHelper.check_error(_v3)
    _v5 = GLib::Uri.wrap_own(_v4)
    return _v5
  end
  def self.uri_parse_params(params, length, separators, flags)
    _v1 = GirFFI::InPointer.from_utf8(params)
    _v2 = length
    _v3 = GirFFI::InPointer.from_utf8(separators)
    _v4 = flags
    _v5 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v6 = GLib::Lib.g_uri_parse_params(_v1, _v2, _v3, _v4, _v5)
    GirFFI::ArgHelper.check_error(_v5)
    _v7 = GLib::HashTable.wrap([:utf8, :utf8], _v6)
    return _v7
  end
  def self.uri_parse_scheme(uri)
    _v1 = GirFFI::InPointer.from_utf8(uri)
    _v2 = GLib::Lib.g_uri_parse_scheme(_v1)
    _v3 = GirFFI::AllocationHelper.free_after(_v2, &:to_utf8)
    return _v3
  end
  def self.uri_peek_scheme(uri)
    _v1 = GirFFI::InPointer.from_utf8(uri)
    _v2 = GLib::Lib.g_uri_peek_scheme(_v1)
    _v3 = _v2.to_utf8
    return _v3
  end
  def self.uri_resolve_relative(base_uri_string, uri_ref, flags)
    _v1 = GirFFI::InPointer.from_utf8(base_uri_string)
    _v2 = GirFFI::InPointer.from_utf8(uri_ref)
    _v3 = flags
    _v4 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v5 = GLib::Lib.g_uri_resolve_relative(_v1, _v2, _v3, _v4)
    GirFFI::ArgHelper.check_error(_v4)
    _v6 = GirFFI::AllocationHelper.free_after(_v5, &:to_utf8)
    return _v6
  end
  def self.uri_split(uri_ref, flags)
    _v1 = GirFFI::InPointer.from_utf8(uri_ref)
    _v2 = flags
    _v3 = FFI::MemoryPointer.new(:pointer)
    _v4 = FFI::MemoryPointer.new(:pointer)
    _v5 = FFI::MemoryPointer.new(:pointer)
    _v6 = FFI::MemoryPointer.new(:int32)
    _v7 = FFI::MemoryPointer.new(:pointer)
    _v8 = FFI::MemoryPointer.new(:pointer)
    _v9 = FFI::MemoryPointer.new(:pointer)
    _v10 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    GLib::Lib.g_uri_split(_v1, _v2, _v3, _v4, _v5, _v6, _v7, _v8, _v9, _v10)
    GirFFI::ArgHelper.check_error(_v10)
    _v11 = GirFFI::AllocationHelper.free_after(_v3.get_pointer(0), &:to_utf8)
    _v12 = GirFFI::AllocationHelper.free_after(_v4.get_pointer(0), &:to_utf8)
    _v13 = GirFFI::AllocationHelper.free_after(_v5.get_pointer(0), &:to_utf8)
    _v14 = _v6.get_int32(0)
    _v15 = GirFFI::AllocationHelper.free_after(_v7.get_pointer(0), &:to_utf8)
    _v16 = GirFFI::AllocationHelper.free_after(_v8.get_pointer(0), &:to_utf8)
    _v17 = GirFFI::AllocationHelper.free_after(_v9.get_pointer(0), &:to_utf8)
    return [_v11, _v12, _v13, _v14, _v15, _v16, _v17]
  end
  def self.uri_split_network(uri_string, flags)
    _v1 = GirFFI::InPointer.from_utf8(uri_string)
    _v2 = flags
    _v3 = FFI::MemoryPointer.new(:pointer)
    _v4 = FFI::MemoryPointer.new(:pointer)
    _v5 = FFI::MemoryPointer.new(:int32)
    _v6 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    GLib::Lib.g_uri_split_network(_v1, _v2, _v3, _v4, _v5, _v6)
    GirFFI::ArgHelper.check_error(_v6)
    _v7 = GirFFI::AllocationHelper.free_after(_v3.get_pointer(0), &:to_utf8)
    _v8 = GirFFI::AllocationHelper.free_after(_v4.get_pointer(0), &:to_utf8)
    _v9 = _v5.get_int32(0)
    return [_v7, _v8, _v9]
  end
  def self.uri_split_with_user(uri_ref, flags)
    _v1 = GirFFI::InPointer.from_utf8(uri_ref)
    _v2 = flags
    _v3 = FFI::MemoryPointer.new(:pointer)
    _v4 = FFI::MemoryPointer.new(:pointer)
    _v5 = FFI::MemoryPointer.new(:pointer)
    _v6 = FFI::MemoryPointer.new(:pointer)
    _v7 = FFI::MemoryPointer.new(:pointer)
    _v8 = FFI::MemoryPointer.new(:int32)
    _v9 = FFI::MemoryPointer.new(:pointer)
    _v10 = FFI::MemoryPointer.new(:pointer)
    _v11 = FFI::MemoryPointer.new(:pointer)
    _v12 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    GLib::Lib.g_uri_split_with_user(_v1, _v2, _v3, _v4, _v5, _v6, _v7, _v8, _v9, _v10, _v11, _v12)
    GirFFI::ArgHelper.check_error(_v12)
    _v13 = GirFFI::AllocationHelper.free_after(_v3.get_pointer(0), &:to_utf8)
    _v14 = GirFFI::AllocationHelper.free_after(_v4.get_pointer(0), &:to_utf8)
    _v15 = GirFFI::AllocationHelper.free_after(_v5.get_pointer(0), &:to_utf8)
    _v16 = GirFFI::AllocationHelper.free_after(_v6.get_pointer(0), &:to_utf8)
    _v17 = GirFFI::AllocationHelper.free_after(_v7.get_pointer(0), &:to_utf8)
    _v18 = _v8.get_int32(0)
    _v19 = GirFFI::AllocationHelper.free_after(_v9.get_pointer(0), &:to_utf8)
    _v20 = GirFFI::AllocationHelper.free_after(_v10.get_pointer(0), &:to_utf8)
    _v21 = GirFFI::AllocationHelper.free_after(_v11.get_pointer(0), &:to_utf8)
    return [_v13, _v14, _v15, _v16, _v17, _v18, _v19, _v20, _v21]
  end
  def self.uri_unescape_bytes(escaped_string, length, illegal_characters = nil)
    _v1 = GirFFI::InPointer.from_utf8(escaped_string)
    _v2 = length
    _v3 = GirFFI::InPointer.from_utf8(illegal_characters)
    _v4 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v5 = GLib::Lib.g_uri_unescape_bytes(_v1, _v2, _v3, _v4)
    GirFFI::ArgHelper.check_error(_v4)
    _v6 = GLib::Bytes.wrap_own(_v5)
    return _v6
  end
  def self.uri_unescape_segment(escaped_string = nil, escaped_string_end = nil, illegal_characters = nil)
    _v1 = GirFFI::InPointer.from_utf8(escaped_string)
    _v2 = GirFFI::InPointer.from_utf8(escaped_string_end)
    _v3 = GirFFI::InPointer.from_utf8(illegal_characters)
    _v4 = GLib::Lib.g_uri_unescape_segment(_v1, _v2, _v3)
    _v5 = GirFFI::AllocationHelper.free_after(_v4, &:to_utf8)
    return _v5
  end
  def self.uri_unescape_string(escaped_string, illegal_characters = nil)
    _v1 = GirFFI::InPointer.from_utf8(escaped_string)
    _v2 = GirFFI::InPointer.from_utf8(illegal_characters)
    _v3 = GLib::Lib.g_uri_unescape_string(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.usleep(microseconds)
    _v1 = microseconds
    GLib::Lib.g_usleep(_v1)
  end
  def self.utf16_to_ucs4(str)
    len = str.nil? ? (0) : (str.length)
    _v1 = len
    _v2 = FFI::MemoryPointer.new(:int64)
    _v3 = FFI::MemoryPointer.new(:int64)
    _v4 = GirFFI::SizedArray.from(:guint16, -1, str)
    _v5 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v6 = GLib::Lib.g_utf16_to_ucs4(_v4, _v1, _v2, _v3, _v5)
    GirFFI::ArgHelper.check_error(_v5)
    _v7 = _v2.get_int64(0)
    _v8 = _v3.get_int64(0)
    return [_v6, _v7, _v8]
  end
  def self.utf16_to_utf8(str)
    len = str.nil? ? (0) : (str.length)
    _v1 = len
    _v2 = FFI::MemoryPointer.new(:int64)
    _v3 = FFI::MemoryPointer.new(:int64)
    _v4 = GirFFI::SizedArray.from(:guint16, -1, str)
    _v5 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v6 = GLib::Lib.g_utf16_to_utf8(_v4, _v1, _v2, _v3, _v5)
    GirFFI::ArgHelper.check_error(_v5)
    _v7 = _v2.get_int64(0)
    _v8 = _v3.get_int64(0)
    _v9 = GirFFI::AllocationHelper.free_after(_v6, &:to_utf8)
    return [_v9, _v7, _v8]
  end
  def self.utf8_casefold(str, len)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = len
    _v3 = GLib::Lib.g_utf8_casefold(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.utf8_collate(str1, str2)
    _v1 = GirFFI::InPointer.from_utf8(str1)
    _v2 = GirFFI::InPointer.from_utf8(str2)
    _v3 = GLib::Lib.g_utf8_collate(_v1, _v2)
    return _v3
  end
  def self.utf8_collate_key(str, len)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = len
    _v3 = GLib::Lib.g_utf8_collate_key(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.utf8_collate_key_for_filename(str, len)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = len
    _v3 = GLib::Lib.g_utf8_collate_key_for_filename(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.utf8_find_next_char(p, end_ = nil)
    _v1 = GirFFI::InPointer.from_utf8(p)
    _v2 = GirFFI::InPointer.from_utf8(end_)
    _v3 = GLib::Lib.g_utf8_find_next_char(_v1, _v2)
    _v4 = _v3.to_utf8
    return _v4
  end
  def self.utf8_find_prev_char(str, p)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = GirFFI::InPointer.from_utf8(p)
    _v3 = GLib::Lib.g_utf8_find_prev_char(_v1, _v2)
    _v4 = _v3.to_utf8
    return _v4
  end
  def self.utf8_get_char(p)
    _v1 = GirFFI::InPointer.from_utf8(p)
    _v2 = GLib::Lib.g_utf8_get_char(_v1)
    return _v2
  end
  def self.utf8_get_char_validated(p, max_len)
    _v1 = GirFFI::InPointer.from_utf8(p)
    _v2 = max_len
    _v3 = GLib::Lib.g_utf8_get_char_validated(_v1, _v2)
    return _v3
  end
  def self.utf8_make_valid(str, len)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = len
    _v3 = GLib::Lib.g_utf8_make_valid(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.utf8_normalize(str, len, mode)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = len
    _v3 = mode
    _v4 = GLib::Lib.g_utf8_normalize(_v1, _v2, _v3)
    _v5 = GirFFI::AllocationHelper.free_after(_v4, &:to_utf8)
    return _v5
  end
  def self.utf8_offset_to_pointer(str, offset)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = offset
    _v3 = GLib::Lib.g_utf8_offset_to_pointer(_v1, _v2)
    _v4 = _v3.to_utf8
    return _v4
  end
  def self.utf8_pointer_to_offset(str, pos)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = GirFFI::InPointer.from_utf8(pos)
    _v3 = GLib::Lib.g_utf8_pointer_to_offset(_v1, _v2)
    return _v3
  end
  def self.utf8_prev_char(p)
    _v1 = GirFFI::InPointer.from_utf8(p)
    _v2 = GLib::Lib.g_utf8_prev_char(_v1)
    _v3 = _v2.to_utf8
    return _v3
  end
  def self.utf8_strchr(p, len, c)
    _v1 = GirFFI::InPointer.from_utf8(p)
    _v2 = len
    _v3 = c
    _v4 = GLib::Lib.g_utf8_strchr(_v1, _v2, _v3)
    _v5 = _v4.to_utf8
    return _v5
  end
  def self.utf8_strdown(str, len)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = len
    _v3 = GLib::Lib.g_utf8_strdown(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.utf8_strlen(p, max)
    _v1 = GirFFI::InPointer.from_utf8(p)
    _v2 = max
    _v3 = GLib::Lib.g_utf8_strlen(_v1, _v2)
    return _v3
  end
  def self.utf8_strncpy(dest, src, n)
    _v1 = GirFFI::InPointer.from_utf8(dest)
    _v2 = GirFFI::InPointer.from_utf8(src)
    _v3 = n
    _v4 = GLib::Lib.g_utf8_strncpy(_v1, _v2, _v3)
    _v5 = _v4.to_utf8
    return _v5
  end
  def self.utf8_strrchr(p, len, c)
    _v1 = GirFFI::InPointer.from_utf8(p)
    _v2 = len
    _v3 = c
    _v4 = GLib::Lib.g_utf8_strrchr(_v1, _v2, _v3)
    _v5 = _v4.to_utf8
    return _v5
  end
  def self.utf8_strreverse(str, len)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = len
    _v3 = GLib::Lib.g_utf8_strreverse(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.utf8_strup(str, len)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = len
    _v3 = GLib::Lib.g_utf8_strup(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.utf8_substring(str, start_pos, end_pos)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = start_pos
    _v3 = end_pos
    _v4 = GLib::Lib.g_utf8_substring(_v1, _v2, _v3)
    _v5 = GirFFI::AllocationHelper.free_after(_v4, &:to_utf8)
    return _v5
  end
  def self.utf8_to_ucs4(str, len)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = len
    _v3 = FFI::MemoryPointer.new(:int64)
    _v4 = FFI::MemoryPointer.new(:int64)
    _v5 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v6 = GLib::Lib.g_utf8_to_ucs4(_v1, _v2, _v3, _v4, _v5)
    GirFFI::ArgHelper.check_error(_v5)
    _v7 = _v3.get_int64(0)
    _v8 = _v4.get_int64(0)
    return [_v6, _v7, _v8]
  end
  def self.utf8_to_ucs4_fast(str, len)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = len
    _v3 = FFI::MemoryPointer.new(:int64)
    _v4 = GLib::Lib.g_utf8_to_ucs4_fast(_v1, _v2, _v3)
    _v5 = _v3.get_int64(0)
    return [_v4, _v5]
  end
  def self.utf8_to_utf16(str, len)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = len
    _v3 = FFI::MemoryPointer.new(:int64)
    _v4 = FFI::MemoryPointer.new(:int64)
    _v5 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v6 = GLib::Lib.g_utf8_to_utf16(_v1, _v2, _v3, _v4, _v5)
    GirFFI::ArgHelper.check_error(_v5)
    _v7 = _v3.get_int64(0)
    _v8 = _v4.get_int64(0)
    return [_v6, _v7, _v8]
  end
  def self.utf8_truncate_middle(string, truncate_length)
    _v1 = GirFFI::InPointer.from_utf8(string)
    _v2 = truncate_length
    _v3 = GLib::Lib.g_utf8_truncate_middle(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.utf8_validate(str)
    max_len = str.nil? ? (0) : (str.length)
    _v1 = max_len
    _v2 = FFI::MemoryPointer.new(:pointer)
    _v3 = GirFFI::SizedArray.from(:guint8, -1, str)
    _v4 = GLib::Lib.g_utf8_validate(_v3, _v1, _v2)
    _v5 = _v2.get_pointer(0).to_utf8
    return [_v4, _v5]
  end
  def self.utf8_validate_len(str)
    max_len = str.nil? ? (0) : (str.length)
    _v1 = max_len
    _v2 = FFI::MemoryPointer.new(:pointer)
    _v3 = GirFFI::SizedArray.from(:guint8, -1, str)
    _v4 = GLib::Lib.g_utf8_validate_len(_v3, _v1, _v2)
    _v5 = _v2.get_pointer(0).to_utf8
    return [_v4, _v5]
  end
  def self.utime(filename, utb = nil)
    _v1 = filename
    _v2 = utb
    _v3 = GLib::Lib.g_utime(_v1, _v2)
    return _v3
  end
  def self.uuid_string_is_valid(str)
    _v1 = GirFFI::InPointer.from_utf8(str)
    _v2 = GLib::Lib.g_uuid_string_is_valid(_v1)
    return _v2
  end
  def self.uuid_string_random
    _v1 = GLib::Lib.g_uuid_string_random
    _v2 = GirFFI::AllocationHelper.free_after(_v1, &:to_utf8)
    return _v2
  end
  def self.variant_get_gtype
    _v1 = GLib::Lib.g_variant_get_gtype
    return _v1
  end
  def self.variant_is_object_path(string)
    _v1 = GirFFI::InPointer.from_utf8(string)
    _v2 = GLib::Lib.g_variant_is_object_path(_v1)
    return _v2
  end
  def self.variant_is_signature(string)
    _v1 = GirFFI::InPointer.from_utf8(string)
    _v2 = GLib::Lib.g_variant_is_signature(_v1)
    return _v2
  end
  def self.variant_parse(type, text, limit = nil, endptr = nil)
    _v1 = GLib::VariantType.from(type)
    _v2 = GirFFI::InPointer.from_utf8(text)
    _v3 = GirFFI::InPointer.from_utf8(limit)
    _v4 = GirFFI::InPointer.from_utf8(endptr)
    _v5 = FFI::MemoryPointer.new(:pointer).write_pointer(nil)
    _v6 = GLib::Lib.g_variant_parse(_v1, _v2, _v3, _v4, _v5)
    GirFFI::ArgHelper.check_error(_v5)
    _v7 = GLib::Variant.wrap_own(_v6)
    return _v7
  end
  def self.variant_parse_error_print_context(error, source_str)
    _v1 = GLib::Error.from(error)
    _v2 = GirFFI::InPointer.from_utf8(source_str)
    _v3 = GLib::Lib.g_variant_parse_error_print_context(_v1, _v2)
    _v4 = GirFFI::AllocationHelper.free_after(_v3, &:to_utf8)
    return _v4
  end
  def self.variant_parse_error_quark
    _v1 = GLib::Lib.g_variant_parse_error_quark
    return _v1
  end
  def self.variant_parser_get_error_quark
    _v1 = GLib::Lib.g_variant_parser_get_error_quark
    return _v1
  end
  def self.variant_type_checked_(type_string)
    _v1 = GirFFI::InPointer.from_utf8(type_string)
    _v2 = GLib::Lib.g_variant_type_checked_(_v1)
    _v3 = GLib::VariantType.wrap_copy(_v2)
    return _v3
  end
  def self.variant_type_string_get_depth_(type_string)
    _v1 = GirFFI::InPointer.from_utf8(type_string)
    _v2 = GLib::Lib.g_variant_type_string_get_depth_(_v1)
    return _v2
  end
  def self.variant_type_string_is_valid(type_string)
    _v1 = GirFFI::InPointer.from_utf8(type_string)
    _v2 = GLib::Lib.g_variant_type_string_is_valid(_v1)
    return _v2
  end
  def self.variant_type_string_scan(string, limit = nil)
    _v1 = GirFFI::InPointer.from_utf8(string)
    _v2 = GirFFI::InPointer.from_utf8(limit)
    _v3 = FFI::MemoryPointer.new(:pointer)
    _v4 = GLib::Lib.g_variant_type_string_scan(_v1, _v2, _v3)
    _v5 = GirFFI::AllocationHelper.free_after(_v3.get_pointer(0), &:to_utf8)
    return [_v4, _v5]
  end
end
