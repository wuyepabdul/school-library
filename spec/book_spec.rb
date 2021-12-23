require_relative '../book'

describe Book do
  it 'should initialize it\'s parameters correctly' do
    book = Book.new('I Robot', 'Will Smith')
    expect(book.title).to eql 'I Robot'
    expect(book.author).to eql 'Will Smith'
    expect(book).to be_instance_of Book
  end
end
