require_relative './person'
require_relative './teacher'
require_relative './store_data'
require 'json'

class PersonStorage
  attr_reader :people

  def initialize
    @people = load_books
    @classroom = Classroom.new('all')
  end

  def load_books
    return [] unless File.exist?('./data/people.json')

    data = File.read('./data/people.json')
    JSON.parse(data).map do |person|
      result = if person['specialization']
                 Teacher.new(
                   age: person['age'],
                   specialization: person['specialization'],
                   name: person['name'],
                   parent_permission: person['parent_permission']
                 )
               else
                 Student.new(
                   classroom: @classroom,
                   age: person['age'],
                   name: person['name'],
                   parent_permission: person['parent_permission']
                 )
               end
      result
    end
  end

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

  def student_details
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    [age, name, parent_permission]
  end

  def add_student(age, name, parent_permission)
    student = Student.new(age: age, name: name, parent_permission: parent_permission, classroom: @classroom)
    @people.push(student)
  end

  def create_student
    student_info = student_details
    add_student(student_info[0], student_info[1], student_info[2])
    puts 'Person created successfully'
  end

  def teacher_details
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    [age, name, specialization]
  end

  def add_teacher(age, name, specialization)
    teacher = Teacher.new(age: age, name: name, specialization: specialization)
    @people.push(teacher)
  end

  def create_teacher
    teacher_info = teacher_details
    add_teacher(teacher_info[0], teacher_info[1], teacher_info[2])
    puts 'Person created successfully'
  end

  def each_with_index(&block)
    @people.each_with_index(&block)
  end

  def get_person_at_index(index)
    @people[index]
  end

  def save
    store = StoreData.new
    store.store_data_in_file('./data/people.json', @people)
  end
end
