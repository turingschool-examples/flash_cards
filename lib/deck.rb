class Deck
  attr_reader :cards
  def initialize
    @cards =["card_1", "card_2", "card_3", "card_4", "card_5", "card_6", "card_7", "card_8", "card_9"]
  end

  def draw
    @cards.pop
  end
  
  def shuffle
    @cards.shuffle
  end

  def sort
    @cards.sort
  end
end
