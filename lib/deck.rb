class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count #counts number of cards inside of deck.
    cards.count #counts elements inside of the cards array.
  end

  def cards_in_category(category)#returns card by it"s category.
    #iterate through cards array and return a new array of cards if the cards category is equal to the passed in argument.
    card_category = [ ]
    cards.each do |card|
      card_category << card if card.category == category
    end
    return card_category
  end
end
