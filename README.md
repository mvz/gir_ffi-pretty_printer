# GirFFI-PrettyPrinter

Pretty-printer for modules generated by GirFFI.

## Features

* Prints generated, overridden and hand-added methods.
* Uses the `mvz-live_ast` gem to inspect runtime-generated methods.
* Needs MRI 2.1 or higher.

## Usage

    # The pretty-printer must be required first!
    require 'gir_ffi-pretty_printer'
    require 'gir_ffi'

    # Any version
    GirFFI::PrettyPrinter.new.pretty_print 'GObject'
    # A specific version
    GirFFI::PrettyPrinter.new.pretty_print 'Gtk', '3.0'

## Install

    gem install gir_ffi-pretty_printer

## License

Copyright &copy; 2012--2015, [Matijs van Zuijlen](http://www.matijs.net/)

GirFFI-PrettyPrinter is free software, distributed under the terms of
the GNU Lesser General Public License, version 2.1 or later. See the
file COPYING.LIB for more information.
