
class Deck

  attr_reader :card
  def initialize(card)
    @card = []
  end

  def cards(new_card)
    @card << new_card
  end



end
