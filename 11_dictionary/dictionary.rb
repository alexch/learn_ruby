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
    entries.keys
  end

  def include?(keyword)
    entries.has_key?(keyword)
  end

  def find(word)
    return {} if entries.empty?
    entries.select { |key, value| key.start_with?(word) }
  end
end
