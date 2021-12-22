require './book'

class BookStorage
  attr_reader :books

  def initialize
    @books = load_books
  end

  def load_books
    return [] unless File.exist?('./data/books.json')

    data = File.read('./data/books.json')
    JSON.parse(data).map do |book|
      Book.new(book['title'], book['author'])
    end
  end

  def list_books
    @books.each { |book| puts book }
  end

  def add_book(title, author)
    book = Book.new(title, author)
    @books.push(book)
  end

  def book_details
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    [title, author]
  end

  def create_book
    book_info = book_details
    add_book(book_info[0], book_info[1])
    puts 'Book created successfully'
  end

  def each_with_index(&block)
    @books.each_with_index(&block)
  end

  def get_book_at_index(index)
    @books[index]
  end

  def save
    File.write('data/books.json', JSON.generate(@books))
  end
end
