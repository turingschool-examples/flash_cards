class Round
  attr_reader :deck, :turns
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
    turns << deck.current_card(turns.length)
    return turn
    #if turn.correct? == true
    #  number_correct += 1
    #end
  end

end
