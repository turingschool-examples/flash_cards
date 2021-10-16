require './lib/card'

class Deck
  attr_accessor :cards
  def initialize(cards)
    @cards = cards
  end
  def count
    cards.count
  end
  def cards_in_category(topic)
    @correct = []
    cards.each do |card|
      if card.category == topic
        @correct << card
      end
    end
    @correct
  end
end
