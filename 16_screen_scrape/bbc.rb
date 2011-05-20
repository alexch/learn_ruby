require "open-uri"

class BBC
  attr_accessor :uri

  def source_data
    @source_data = ""
    if uri
      open(uri) do |f|
        @source_data = f.read
      end
    end
    @source_data
  end

  def top_stories
    match = source_data.match(%r{fix me})
    {:url => match[1], :title => match[2].strip}
  end
end
