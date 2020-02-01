class Round

  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = 0
  end

  def current_card
    @deck.cards[@current_card]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
     #@turns << new_turn
  end

  def correct?
    if @turns.guess == @current_card.answer
      true
    else
      false
    end
  end
end
