require_relative './person'
require 'json'

class Student < Person
  attr_reader :classroom

  def initialize(age:, classroom:, name: 'Unknown', parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def to_s
    "[Student] #{super}"
  end

  def to_json(*args)
    JSON.generate({"name"=>@name, "age"=>@age, "parent_permission"=>@parent_permission})
  end
end
