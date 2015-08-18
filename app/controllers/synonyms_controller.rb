class SynonymsController < ApplicationController
  before_action :save_word, only: :create

  def show
    @synonym = Synonym.find(params[:id])
  end

  def create
    word = Word.find_by(search: params[:search_word])
    @synonyms = params[:synonyms].split('/')
    word.synonym = Synonym.create(syn1: @synonyms[0],
                                  syn2: @synonyms[1],
                                  syn3: @synonyms[2],
                                  syn4: @synonyms[3],
                                  syn5: @synonyms[4])
    redirect_to synonym_path(word.synonym)
  end

  private

    def save_word
      Word.create(search: params[:search_word])
    end
end
