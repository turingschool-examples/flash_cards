require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def cards_in_category(subject)
    cards.find_all do |card|
      subject == card.category
    end
  end

end
