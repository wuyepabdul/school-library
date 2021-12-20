#!/usr/bin/env ruby
require './person'
require './student'
require './rentals'
require './book'
require './teacher'
require './classroom'
require './app.rb'

def main
  app = App.new
  app.start
end

main
