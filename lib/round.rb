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
    shuffle_deck
    return turn
  end

  def shuffle_deck
    shuffled_deck = deck.cards.rotate
    deck.cards.replace(shuffled_deck)
  end

  def number_correct
    correct_turns = turns.find_all do |turn|
      turn.correct? 
    end
    correct_turns.length 
  end 
end
 