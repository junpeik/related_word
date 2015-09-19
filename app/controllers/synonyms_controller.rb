class SynonymsController < ApplicationController
  before_action :set_word, only: %i[show create]

  def show
    @synonym = Synonym.find(params[:id])
  end

  def create
    synonyms = params[:synonyms].split('/')
    @word.synonym = Synonym.create(syn1: synonyms[0],
                                   syn2: synonyms[1],
                                   syn3: synonyms[2],
                                   syn4: synonyms[3],
                                   syn5: synonyms[4])
    redirect_to word_synonym_path(@word, @word.synonym)
  end

  private

    def set_word
      @word = Word.find[params[:word_id])
    end
end
