class Book
  attr_reader(:title, :id, :status, :due_date, :patron_id)

    def initialize(attributes)
      @title = attributes.fetch(:title)
      @id = attributes.fetch(:id)
      @status = attributes.fetch(:status)
      @due_date = attributes.fetch(:due_date)
      @patron_id = attributes.fetch(:patron_id)
   end

   def self.all
     returned_books = DB.exec('SELECT * FROM books;')
     books = []
     returned_books.each() do |book|
       title = book.fetch("title")
       id = book.fetch("id").to_i
       status = book.fetch("status")
       due_date = book.fetch("due_date")
       patron_id = book.fetch("patron_id")
       books.push(Book.new({:title => title, :id => id, :status => status, :due_date => due_date, :patron_id => patron_id}))
    end
    books
  end

  def self.find(id)
    result = DB.exec("SELECT * FROM books WHERE id = #{id};")
    title = result.first().fetch("title")
    id = result.fetch("id").to_i
    status = result.fetch("status")
    due_date = result.fetch("due_date").to_i
    patron_id = result.fetch("patron_id")
    Book.new({:title => title, :id => id, :status => status, :due_date => due_date, :patron_id => patron_id})
  end

  def save
    result = DB.exec("INSERT INTO books (title, id, status, due_date, patron_id) VALUE ('#{@title}', #{@id}, '#{@status}', '#{@due_date}'', #{@patron_id});")

  end

  def ==(another_book)
    self.title().==(another_book.title()).&(self.id().==(another_book.id())).&(self.due_date().==(another_book.due_date())).&(self.status().==(another_book.status())).&(self.patron_id().==(another_book.patron_id()))
  end

end
