require 'pry'
require './card.rb'
require './turn.rb'

class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def cards_in_category(cat)
    cards_in_cat = []

    cards.each do |card|
      if card.category == cat
        cards_in_cat << card
      end
    end
    cards_in_cat
  end

  def count_in_category(cat)
    @count = 0

    cards.each do |card|
      if card.category == cat
        @count += 1
      end
    end
    @count
  end
end
