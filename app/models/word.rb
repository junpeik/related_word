require 'open-uri'
require 'uri'
require 'rexml/document'

class Word < ActiveRecord::Base
  has_one :synonym, dependent: :destroy

  validates :search, presence: true

  def get_synonyms
    encoded_query = URI.encode(self.search)
    url = "http://www.google.com/complete/search?h1=ja&output=toolbar&q=#{encoded_query}"
    REXML::Document.new(open(url).read.encode('UTF-8'))
  end

  def all_synonyms
    synonyms = []
    get_synonyms.elements.each('toplevel/CompleteSuggestion/suggestion') do |element|
      synonyms << element.attributes["data"]
    end
    synonyms
  end

  def top_5_synonyms
    all_synonyms[0..5]
  end
end
