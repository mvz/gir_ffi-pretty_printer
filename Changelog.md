# Changelog

## 0.0.11 / 2026-01-18

* Support Ruby 3.2 through 4.0, dropping support for 3.0 and 3.1
  ([#76], [#84] and [#90] by [mvz])
* Bump `gir_ffi` dependency to `~> 0.18.0` ([#79] by [mvz])

[#76]: https://github.com/mvz/gir_ffi-pretty_printer/pull/76
[#79]: https://github.com/mvz/gir_ffi-pretty_printer/pull/79
[#84]: https://github.com/mvz/gir_ffi-pretty_printer/pull/84
[#90]: https://github.com/mvz/gir_ffi-pretty_printer/pull/90

## 0.0.10 / 2024-01-05

* Support Ruby 3.0 through 3.3, dropping support for 2.7 ([#55] and [#69] by [mvz])
* Update GirFFI dependency to version 0.17.0 ([#71] by [mvz])

[mvz]: https://github.com/mvz

[#55]: https://github.com/mvz/gir_ffi-pretty_printer/pull/55
[#69]: https://github.com/mvz/gir_ffi-pretty_printer/pull/69
[#71]: https://github.com/mvz/gir_ffi-pretty_printer/pull/71

## 0.0.9 / 2022-01-23

* Depend on GirFFI 0.16.0
* Drop support for Ruby 2.6

## 0.0.8 / 2022-01-23

* Depend on GirFFI 0.15.9
* Use safe names when printing functions and constants
* Target Ruby 2.6 through 3.1

## 0.0.7 / 2019-12-26

* Depend on GirFFI 0.15.0
* Support Ruby 2.4 and up
* More carefully check whether module functions and class methods have been set
  up yet.

## 0.0.6 / 2018-09-08

* Depend on GirFFI 0.13.0
* Test with GLib 2.58

## 0.0.5 / 2018-03-25

* Depend on GirFFI 0.12.0
* Support CRuby 2.3 and up

## 0.0.4 / 2017-09-19

* Depend on GirFFI 0.11.1
* Support CRuby 2.1 to 2.4

## 0.0.3 / 2016-01-21

* Depend on GirFFI 0.9.0
* Support CRuby 2.1 to 2.3
* Catch syntax errors when building classes
* Properly setup methods with unsafe names (like `GLib::IConv#_`)
* Gracefully handle failures pretty-printing constants
* Start supporting alias method chaining
* Sort printed results
* Various refactoring

## 0.0.2 / 2013-08-03

* Depend on GirFFI 0.7.0
* Use `mvz-live_ast` instead of `live_ast`

## 0.0.1 / 2013-07-04

* Initial release
