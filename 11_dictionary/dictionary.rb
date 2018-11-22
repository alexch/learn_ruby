class Dictionary
  attr_reader :entries

  def initialize
    @entries = {}
  end

  def add(entry)
    entry.is_a?(Hash) ? entries.merge!(entry) : entries[entry] = nil  
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
