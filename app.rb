require './person'
require './student'
require './rentals'
require './teacher'
require './classroom'
require './book_storage'
require './person_storage'

class App
  def initialize
    @book_storage = BookStorage.new
    @rentals = []
    @person_storage = PersonStorage.new
  end

  def handle_action(option)
    case option
    when '1'
      @book_storage.list_books
    when '2'
      @person_storage.list_people
    when '3'
      @person_storage.create_person
    when '4'
      @book_storage.create_book
    when '5'
      create_rental
    when '6'
      list_rentals
    else
      puts 'That is not a valid option'
    end
  end

  private

  def rental_input
    puts 'Select a book from the following list by number'
    @book_storage.each_with_index { |book, i| puts "#{i}) #{book}" }
    book_i = gets.chomp.to_i
    puts
    puts 'Select a person from the following list by number (not ID)'
    @person_storage.each_with_index { |person, i| puts "#{i}) #{person}" }
    person_i = gets.chomp.to_i
    puts
    print 'Date: '
    date = gets.chomp
    [date, person_i, book_i]
  end

  def add_rental(date, person_i, book_i)
    rental = Rental.new(date, @person_storage.get_person_at_index(person_i), @book_storage.get_book_at_index(book_i))
    @rentals.push(rental)
  end

  def create_rental()
    results = rental_input
    add_rental(results[0], results[1], results[2])
    puts 'Rental created successfullyy'
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp

    puts 'Rentals:'
    @rentals.each { |rental| puts rental if rental.person.id == id.to_i }
  end
end
