class Round

  attr_reader :deck, :turns, :new_turn

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
      @turns << new_turn
      @deck.cards.shift
      new_turn

  end

  def correct?
    #new_turn.guess == @current_card.answer ? true : false
    if new_turn.guess == @current_card.answer
      true
    else
      false
    end
  end
end
