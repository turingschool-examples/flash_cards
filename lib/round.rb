class Round
  attr_reader :deck, :turns, :current_card, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @flip = 0
    @current_card = @deck.cards[@flip]
    @number_correct = 0
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @current_card)
    @number_correct += 1 if new_turn.feedback == "Correct"
    @turns << new_turn
    @flip += 1
    new_turn
  require 'pry'; binding.pry
    
  end

end