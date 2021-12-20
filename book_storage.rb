require './book'

class BookStorage
  def initialize
    @books = []
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
end
