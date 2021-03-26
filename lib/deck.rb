class Deck
  attr_reader :cards,
              :count

  #create a deck
  def initialize(cards)
    @cards = cards
    @count = cards.count
  end

  #return all cards in a given category
  def cards_in_category(category)
    @cards.find_all do |card|
      card.category == category
    end
  end

end
