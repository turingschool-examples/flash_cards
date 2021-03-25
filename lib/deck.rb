class Deck
  attr_accessor :cards
  attr_reader :card

  def initialize(cards)
  @cards = cards

  end

  def count
   cards.length
  end

  # I'll be back for this. 
  # def cards_in_category
  #   stem = []
  #   geography = []
  #
  #   cards.each do |card|
  #     if card.category == :STEM
  #       stem << card
  #     elsif card.category == :Geography
  #       geography << card
  #     else
  #       []
  #     end
  #   end
  # end
end



#
