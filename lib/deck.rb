require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def cards_in_category(category)
    card_storage = []

    cards.each do |card|
      card_storage.push(card) if category == card.category
    end

    card_storage
  end
end
