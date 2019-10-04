
require_relative 'card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.length
  end

  def draw
    cards.sample
  end

  def remove_from_deck(card)
    cards.delete(card)
  end

  def random_cards(num)
    cards.sample(num)
  end

  def list_categories
    cards.uniq {|card| card.category}.map {|card| card.category.to_s}
  end

  def cards_in_category(cat)
    list = cards.select do |card|
      card.category == cat
    end
    if list == nil
      "Invalid input"
    else
      list
    end
  end

end

