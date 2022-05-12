class Round
  attr_reader :deck, :turns, :index, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @index = 0
  end

  def current_card
    deck.cards[@index]
  end

  def take_turn(guess)
    @turns << current_card
    new_turn = Turn.new(guess, current_card)
    @index += 1
    if new_turn.correct? == true
      @number_correct += 1
    end
    new_turn
  end

end
