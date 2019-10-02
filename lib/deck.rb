class Deck

  attr_reader :cards#, :category

  def initialize(cards)#, category)
    @cards = cards
    #@category = category
  end

  def count
    @cards.length
  end

  # def cards_in_category
  #   stem_array = []
  #   geography_array = []
  #   pop_culture_array = []
  #
  #   if card.category == :STEM
  #     stem_array << card
  #   elsif card.category == :Geography
  #     geography_array << card
  #   elsif card-category == :PopCulture
  #     pop_culture_array << card
  #   end
  # end

end
