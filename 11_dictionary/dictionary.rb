class Dictionary
  def entries
    @entries ||= {}
  end

  def add(hash)
    if hash.is_a? Hash
      entries.merge!(hash)
    else # input is a String
      entries[hash] = nil
    end 
  end

  def keywords
    entries.keys.sort
  end

  def include?(keyword)
    entries.has_key?(keyword)
  end

  def find(word)
    return {} if entries.empty?
    entries.select { |key, value| key.start_with?(word) }
  end

  def printable
    keywords.map { |key| %{[#{key}] "#{entries[key]}"} }.join("\n")
  end
end
