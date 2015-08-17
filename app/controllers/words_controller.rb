require 'open-uri'
require 'uri'
require 'rexml/document'

class WordsController < ApplicationController

  def index
  end

  def show
    @word = params[:search_word]
    @synonyms = create_synonyms(params[:search_word])
  end

  private

    def create_synonyms(query)
      encoded_query = URI.encode(query)
      url = "http://www.google.com/complete/search?h1=ja&output=toolbar&q=#{encoded_query}"
      REXML::Document.new(open(url).read.encode('UTF-8'))
    end
end
