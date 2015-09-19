class SynonymsController < ApplicationController
  before_action :set_word, only: %i[show create]

  def show
    @synonym = Synonym.find(params[:id])
  end

  def create
    @synonym = @word.build_synonym(synonym_params)
    if @synonym.save
      redirect_to word_synonym_path(@word, @word.synonym)
    else
      redirect_to root_path, error: 'NG'
    end
  end

  private

    def set_word
      @word = Word.find(params[:word_id])
    end

    def synonym_params
      params.require(:synonym).permit(:syn1, :syn2, :syn3, :syn4, :syn5)
    end
end
