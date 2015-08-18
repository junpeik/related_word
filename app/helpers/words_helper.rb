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
end
