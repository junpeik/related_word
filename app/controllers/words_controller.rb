class WordsController < ApplicationController

  def index
    @words = Word.all
  end

  def create
    word = Word.new(word_params)
    if word.save
      redirect_to word
    else
      redirect_to :words, error: 'NG'
    end
  end

  def show
    @word = Word.find(params[:id])
    
    @synonyms = @word.get_synonyms
    @synonym = @word.build_synonym
  end

  private

    def word_params
      params.require(:word).permit(:search)
    end

end
