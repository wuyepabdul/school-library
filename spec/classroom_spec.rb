require_relative '../classroom'
require_relative '../student'

describe Classroom do
  it 'should initialzie it\'s parameters correctly' do
    c = Classroom.new('class 1')
    expect(c.label).to eql 'class 1'
  end

  it 'should correctly add a student' do
    c = Classroom.new('class 1')
    s = Student.new(age: 6, classroom: c, name: 'Alfred')
    c.add_student(s)
    expect(c.students.length).to eql 1
    expect(s.classroom).to be c
  end
end
