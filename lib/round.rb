Class Round 
  attr_accessor :deck, :turn, :current_card_num

  def initialize(deck)
    @deck = deck
    @turn = []
    @current_card_num = 0
  end
  
  def current_card
    deck.cards[current_card_num]

  end
  
  def take_turn

  end

  def take_turn()
  
  end

  def number_correct
  
  end

  def percent_correct_by_category(cat)

  end
end