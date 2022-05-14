# require './lib/card'

class Deck
  attr_reader :cards,
              :count

  def initialize(cards)
    @cards = cards
    @count = cards.count
  end

  def cards_in_category(topic)
    array = []
    @cards.each do |card|
      if card.category == topic
        array << card
      end
    end
    return array
  end
end
