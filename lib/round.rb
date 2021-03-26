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
    turn = Turn.new(guess, current_card)
    turns << turn
    return turn
  end

  def number_correct
    correct_turns = turns.find_all do |turn|
      turn.correct? 
    end
    correct_turns.length 
  end
end
 