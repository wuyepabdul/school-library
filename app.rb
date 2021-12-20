require './person'
require './student'
require './rentals'
require './teacher'
require './classroom'
require './bookStorage'

class App
    def initialize
      @bookStorage = BookStorage.new
      @rentals = []
      @people = []
    end
  
    def handle_action(option)
      case option
      when '1'
        @bookStorage.list_books
      when '2'
        list_people
      when '3'
        create_person
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
  
    def list_people
      @people.each { |person| puts person }
    end
  
    def create_person
      print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
      choice = gets.chomp
  
      case choice
      when '1'
        create_student
      when '2'
        create_teacher
      else
        puts 'That is not a valid input'
        nil
      end
    end
  
    def create_student
      print 'Age: '
      age = gets.chomp
  
      print 'Name: '
      name = gets.chomp
  
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.downcase == 'y'
  
      student = Student.new(age: age, name: name, parent_permission: parent_permission, classroom: @classroom)
      @people.push(student)
  
      puts 'Person created successfully'
    end
  
    def create_teacher
      print 'Age: '
      age = gets.chomp
  
      print 'Name: '
      name = gets.chomp
  
      print 'Specialization: '
      specialization = gets.chomp
  
      teacher = Teacher.new(age: age, name: name, specialization: specialization)
      @people.push(teacher)
  
      puts 'Person created successfully'
    end
  
    def create_rental
      puts 'Select a book from the following list by number'
      @bookStorage.each_with_index { |book, i| puts "#{i}) #{book}" }
  
      book_i = gets.chomp.to_i
  
      puts
      puts 'Select a person from the following list by number (not ID)'
      @people.each_with_index { |person, i| puts "#{i}) #{person}" }
  
      person_i = gets.chomp.to_i
  
      puts
      print 'Date: '
      date = gets.chomp
  
      rental = Rental.new(date, @people[person_i], @bookStorage.get_book_at_index(book_i))
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
  