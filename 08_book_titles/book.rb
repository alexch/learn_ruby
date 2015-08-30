class Book
  def initialize(title = nil)
    @title = title
  end

  def title
    @title
  end

  def title=(title)
    words = title.split(" ")
    words = words.each { |word| word.capitalize! if !["and","the", "a", "an", "in", "of"].include?(word) }
    words[0].capitalize!
    @title = words.join(" ")
  end
end