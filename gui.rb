#!/usr/bin/env ruby
require 'rubygems'
require 'Qt4'
require_relative 'gui_rc'
require_relative 'window'
app = Qt::Application.new ARGV
win = Window.new
win.show
win.raise
app.exec

