class Dictionary
  attr_accessor :entries, :keywords

  def initialize
    @entries = {}
    @keywords = []
    @definition = []
  end

  def add(input)
    if input.is_a?(String)
      @keywords.push(input)
      @entries[input] = nil
    elsif input.is_a?(Hash)
      input.each do |key, value|
        @keywords.push(key)
        @definition.push(value)
        @entries[key] = value
      end
    end
  end

  def include?(key)
    @keywords.include?(key)
  end

  def find(term)
    found = {}
    found = @entries.select{ |key, value| key.include?(term) }
  end

  def keywords
    @keywords.sort
  end

  def printable
    @entries = @entries.sort
    result = ""
    @entries.each do |key, value|
      result += "[#{key}] \"#{value}\"\n"
    end
    result.chomp
  end
end
