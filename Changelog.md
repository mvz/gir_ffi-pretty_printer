# Changelog

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
