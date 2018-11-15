class Friend
  def greeting(person = nil)
    unless person.nil?
      "Hello, #{person}!"
    else
      "Hello!"
    end
  end
end
