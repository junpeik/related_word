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
end
