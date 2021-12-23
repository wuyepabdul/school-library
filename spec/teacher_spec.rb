require_relative '../teacher'
require_relative '../person'

describe Teacher do
  it 'should initialize it\'s parameters correctly' do
    teacher = Teacher.new(specialization: 'history', age: 49)
    expect(teacher.age).to eql 49
    expect(teacher).to be_kind_of Person
  end
end
