class Deck

  attr_reader :card_1, :card_2, :card_3, :cards
  # attr_reader :cards

  def initialize()
    @card_1 = card_1
    @card_2 = card_2
    @card_3 = card_3
    @cards = [card_1, card_2, card_3]

  end

  def cards
    @card_1 = "What is the capital of Alaska?", "Juneau", :Geography
    @card_2 = "The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM
    @card_3 = "Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM

  end

  def count
    cards.count
  end

  def cards_in_category

  end

end
