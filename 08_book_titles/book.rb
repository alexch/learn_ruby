class Book
  attr_writer :title

  def title
    @title = @title.split.map do |word|
      unless %w(and in the of a an).include?(word)
        word.capitalize 
      else
        word
      end
    end
    @title.first.capitalize!
    @title.join(' ')
  end  
end
