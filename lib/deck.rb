require './lib/card'
require './lib/turn'
class Deck
  attr_reader :cards, :correct

  def initialize(cards)
    @cards = cards

  end

  def count
    cards.count
  end

  def cards_in_category(category)
    @cards.find_all do |card|
      card.category == category
    end
  end

  def correct?
    @guess == card.answer
  end

end
