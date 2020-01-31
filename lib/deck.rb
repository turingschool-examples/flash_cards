class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = []
  end

  def add_card_to_deck(new_cards)
    @cards << new_card

  #def add_new_card(card_name)
  #  @cards << card_name
  #end

end
