#!/usr/bin/env ruby

#### List Maker ####
#
# Launch this Ruby file from the command line
# to get started
# 

APP_ROOT = File.expand_path(File.dirname(__FILE__))

require_relative 'lib/controller'

controller = ListMaker::Controller.new
controller.launch!