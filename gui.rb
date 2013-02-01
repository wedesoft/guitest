#!/usr/bin/env ruby
require 'rubygems'
require 'Qt4'
require 'gui_rc'
require 'window'
app = Qt::Application.new ARGV
win = Window.new
win.show
win.raise
app.exec

