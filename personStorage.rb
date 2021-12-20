require_relative './person'
require_relative './teacher'

class PersonStorage
   def initialize
      @people = []
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

  def each_with_index(&block)
    @people.each_with_index(&block)
  end

  def get_person_at_index(index)
    @people[index]
  end

end