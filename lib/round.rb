class Round
  attr_reader :the_deck, :turns

  def initialize(the_deck)
    @the_deck = the_deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    num = @turns.count
    @the_deck.cards[num]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @number_correct += 1 if new_turn.correct?
    return new_turn
  end

end
