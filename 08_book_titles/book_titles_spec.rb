# # Book Titles
#
# # Topics
#
# * classes and objects
# * instance variables
# * setter methods
# * strings
#
# # Notes
#
# Book Titles in English obey some strange capitalization rules. For example, "and" is lowercase in "War and Peace". This test attempts to make sense of some of those rules.
#

require 'book'

describe Book do

  before do
    @book = Book.new
  end

  describe 'title' do
    it 'should capitalize the first letter' do
      @book.title = "inferno"
      expect(@book.title).to eq("Inferno")
    end

    it 'should capitalize every word' do
      @book.title = "stuart little"
      expect(@book.title).to eq("Stuart Little")
    end

    describe 'should capitalize every word except...' do
      describe 'articles' do
        specify 'the' do
          @book.title = "alexander the great"
          expect(@book.title).to eq("Alexander the Great")
        end

        specify 'a' do
          @book.title = "to kill a mockingbird"
          expect(@book.title).to eq("To Kill a Mockingbird")
        end

        specify 'an' do
          @book.title = "to eat an apple a day"
          expect(@book.title).to eq("To Eat an Apple a Day")
        end
      end

      specify 'conjunctions' do
        @book.title = "war and peace"
        expect(@book.title).to eq("War and Peace")
      end

      specify 'prepositions' do
        @book.title = "love in the time of cholera"
        expect(@book.title).to eq("Love in the Time of Cholera")
      end
    end

    describe 'should always capitalize...' do
      specify 'I' do
        @book.title = "what i wish i knew when i was 20"
        expect(@book.title).to eq("What I Wish I Knew When I Was 20")
      end

      specify 'the first word' do
        @book.title = "the man in the iron mask"
        expect(@book.title).to eq("The Man in the Iron Mask")
      end
    end
  end
end
