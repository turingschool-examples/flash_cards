require 'pry'

class Deck 
  attr_reader :cards
  
  def initialize(cards)
    @cards = cards
  end

  def count
    count = cards.count
  end
  
  def cards_in_category(name)
    groups = cards.group_by do |card| 
      card.category 
    end
    groups[name]
  end
end 
