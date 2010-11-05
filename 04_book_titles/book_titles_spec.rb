require 'book'

describe Book do

  before do
    @book = Book.new
  end

  describe 'title' do
    it 'should capitalize the first letter' do
      @book.title = "inferno"
      @book.title.should == "Inferno"
    end

    it 'should capitalize every word' do
      @book.title = "stuart little"
      @book.title.should == "Stuart Little"
    end

    # let's pretend that the rule is for words of 3 characters or less
    it 'should capitalize every word except small words, like the' do
      @book.title = "alexander the great"
      @book.title.should == "Alexander the Great"
    end

    it 'should capitalize every word except small words, like a' do
      @book.title = "to kill a mockingbird"
      @book.title.should == "To Kill a Mockingbird"
    end

    it 'should always capitalize I' do
      @book.title = "what i wish"
      @book.title.should == "What I Wish"
    end

    it 'should always capitalize I' do
      @book.title = "what i wish i knew when i was 20"
      @book.title.should == "What I Wish I Knew When I was 20"
    end
  end
end
