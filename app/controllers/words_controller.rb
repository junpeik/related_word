class WordsController < ApplicationController
  include WordsHelper

  def index
    @words = Word.all
  end

  def show
    @word = params[:search_word]
    @synonyms = create_synonyms(params[:search_word])
  end

end
