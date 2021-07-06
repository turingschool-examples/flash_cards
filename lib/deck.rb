require './card'

class Deck < Card
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def cards_in_category(input_category)
    @cards.find_all do |card|
      input_category == card.category
    end
  end

end
