require_relative '../student'
require_relative '../person'
require_relative '../classroom'

describe Student do
  it 'should initialize it\'s parameters correctly' do
    c = Classroom.new('class 1')
    student = Student.new(age: 9, classroom: c, name: 'Brian', parent_permission: true)
    expect(student.age).to eql 9
    expect(student).to be_kind_of Person
  end
end
