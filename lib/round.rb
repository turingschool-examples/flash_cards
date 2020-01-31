class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    deck.cards[0]
  end
# add a function to remove a card (that has had a turn) from a deck
  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn

    if turn.correct?
      @number_correct += 1
    end


    turn
  end

end
