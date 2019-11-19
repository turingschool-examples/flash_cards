require_relative 'card.rb'
require_relative 'turn.rb'
class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def cards
    @cards << Card.new(question, answer, category)
  end

  def count
    return @cards.length
  end

  def cards_in_category(category_name)
    array = []
    @cards.each do |card|
      if card.category == category_name
        array.append(card)
      end
    end
    return array
  end

end


first = Card.new("Yes?", "No", "Georgraphy")
second = Card.new("No?", "Yes", "Stem")
cards = [first, second]
deck = Deck.new(cards)
#x = deck.cards_in_category("Stem")
deck.cards_in_category("Stem")
#p first.category
