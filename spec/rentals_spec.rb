require_relative '../rentals'
require_relative '../teacher'
require_relative '../book'

describe Rental do
  it 'should initialize it\'s  parameters correctly' do 
    teacher = Teacher.new(age: 32, specialization: 'technician', name: 'Mike')
    book = Book.new('The Hunger Games', 'Suzanne Collins')
    rental = Rental.new('2002/05/04', teacher, book)

    expect(rental).to be_instance_of Rental
    expect(rental.book.title).to eql 'The Hunger Games'
    expect(rental.book.author).to eql 'Suzanne Collins'
    expect(rental.person.age).to eql 32
    expect(rental.person.name).to eql 'Mike'
  end
end