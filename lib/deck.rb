class Deck
  attr_reader :deck,
              :cards

  attr_accessor :cards_in_category

  def initialize(deck, cards)
    @deck = []
    @cards = [card_1, card_2, card_3]
  end

  def cards_in_category( :STEM, :Geography, "Pop Culture" )
    @cards_in_category = @cards_in_category
  end
end
  # def cards
  #   @cards = [card_1, card_2, card_3]
  # end
