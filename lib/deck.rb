class Deck

attr_reader :deck

  def initialize(cards)
    @deck = cards
  end


  def count
    deck.length
  end

  def cards_in_category(category)
    deck.each do |category|
         
  end
end
