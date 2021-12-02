class Deck
  attr_reader :deck, :category
  def initialize(deck, category)
    @deck = []
    @category = category
  end

  def add_card(card)
    @deck << card
  end


end
