class Round
  attr_reader :turns,
              :deck
  
  def initialize(deck) 
    @deck   = deck
    @turns  = []
  end
  
  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    #should create a new instance of a turn with current card
    card = current_card
    turn = Turn.new(guess, card)
  end

  
end
 