require_relative './person.rb'

class Student < Person
  def initialize
    super()
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end