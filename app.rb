require './person'
require './student'
require './rentals'
require './teacher'
require './classroom'
require './bookStorage'
require './personStorage.rb'

class App
    def initialize
      @bookStorage = BookStorage.new
      @rentals = []
      @personStorage = PersonStorage.new
    end
  
    def handle_action(option)
      case option
      when '1'
        @bookStorage.list_books
      when '2'
        @personStorage.list_people
      when '3'
        @personStorage.create_person
      when '4'
        @bookStorage.create_book
      when '5'
        create_rental
      when '6'
        list_rentals
      else
        puts 'That is not a valid option'
      end
    end
    
    private
    def create_rental
      puts 'Select a book from the following list by number'
      @bookStorage.each_with_index { |book, i| puts "#{i}) #{book}" }
  
      book_i = gets.chomp.to_i
  
      puts
      puts 'Select a person from the following list by number (not ID)'
      @personStorage.each_with_index { |person, i| puts "#{i}) #{person}" }
  
      person_i = gets.chomp.to_i
  
      puts
      print 'Date: '
      date = gets.chomp
  
      rental = Rental.new(date, @personStorage.get_person_at_index(person_i), @bookStorage.get_book_at_index(book_i))
      @rentals.push(rental)
  
      puts 'Rental created successfullyy'
    end
  
    def list_rentals
      print 'ID of person: '
      id = gets.chomp
  
      puts 'Rentals:'
      @rentals.each { |rental| puts rental if rental.person.id == id.to_i }
    end
  end
  