class Round
  attr_reader :deck, :turns, :number_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0

  end



  def current_card
    deck.current_card(turns.length)
  end

  def take_turn(guess)
    turn = Turn.new(guess, deck.current_card(turns.length))
    turns << turn

    if turn.correct?
      @number_correct += 1 #no clue why this needs @.... nothing else seems to.
    end
    return turn

  end

end
