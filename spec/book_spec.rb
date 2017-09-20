require('spec_helper')

describe(Book) do

  describe(".all") do
    it("returns an empty array at first") do
      expect(Book.all).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a book by its ID number") do
      test_book = Book.new({:title => "Grapes of Wrath", :id => 1, :status => nil, :due_date => "2017-09-30", :patron_id => nil})
      test_book.save()
      test_book2 = Book.new({:title => "Pride and Prejudice", :id => 2, :status => nil, :due_date => "2017-09-30", :patron_id => nil})
      test_book2.save()
      expect(Book.find(test_book2.id())).to(eq(test_book2))
    end
  end

  describe("#==") do
    it("compares identical book objects as equal") do
      book = Book.new({:title => "Grapes of Wrath", :id => 1, :due_date => "2017-09-30", :status => nil, :patron_id => nil})
      book2 = Book.new({:title => "Grapes of Wrath", :id => 1, :due_date => "2017-09-30", :status => nil, :patron_id => nil})
      expect(book).to(eq(book2))
    end
  end
end
