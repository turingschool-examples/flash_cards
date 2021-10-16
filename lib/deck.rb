require_relative 'card'
require_relative 'turn'

class Deck

  attr_reader :cards, :categories_ary

  def initialize(cards)
    @cards = cards
    @categories_ary = []
    categories_in_deck
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    cards.select {|item| item.category == category}
  end

  def categories_in_deck
    cards.each do |card|
      @categories_ary << card.category
    end
    @categories_ary.uniq!
    @categories_ary
  end

end
