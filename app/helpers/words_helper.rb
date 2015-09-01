require 'open-uri'
require 'uri'
require 'rexml/document'

module WordsHelper

  def five_synonyms(synonyms)
    synonyms = []
    @synonyms.elements.each('toplevel/CompleteSuggestion/suggestion') do |element|
      synonyms << element.attributes["data"]
      if synonyms.length == 5
        return synonyms
      end
    end
  end

  def create_synonyms(query)
    encoded_query = URI.encode(query)
    url = "http://www.google.com/complete/search?h1=ja&output=toolbar&q=#{encoded_query}"
    REXML::Document.new(open(url).read.encode('UTF-8'))
  end
end
