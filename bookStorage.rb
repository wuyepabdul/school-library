require './book'

class BookStorage

  def initialize
    @books = []
  end

  def list_books
    @books.each { |book| puts book }
  end
  
  def create_book
    print 'Title: '
    title = gets.chomp
  
    print 'Author: '
    author = gets.chomp
  
    book = Book.new(title, author)
    @books.push(book)
  
    puts 'Book created successfully'
  end

  def each_with_index(&block)
    @books.each_with_index &block
  end

  def get_book_at_index(index)
    @books[index]
  end

end