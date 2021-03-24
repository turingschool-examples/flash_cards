class Round

  attr_reader :deck, :turns, :current_card
  def initialize(deck)
    @deck = deck
    @turns = []
      # require "pry"; binding.pry
    @current_turn = 0
    @current_card = @deck.cards[@current_turn]
    @number_correct = 0
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @current_card)
    turns << new_turn
    @current_turn += 1
    if new_turn.correct? == true
      @number_correct += 1
      new_turn
    else
      new_turn
    end
  end


end
