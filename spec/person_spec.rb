require_relative '../person'

describe Person do
  it 'should initialize it\'s parameters correctly' do
    person = Person.new(age:22, name: 'Duls', parent_permission: true)
    expect(person.age).to eql 22
    expect(person.name).to eql 'Duls'
    expect(person).to be_instance_of Person
  end
end