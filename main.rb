#!/usr/bin/env ruby
require './app'

def main
  app = App.new
  puts 'Welcome to School Library App!'
  loop do
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    option = gets.chomp

    exit_app = app.handle_action(option)
    break if exit_app == true
  end
  puts 'Thank you for using this app!'
end

main
