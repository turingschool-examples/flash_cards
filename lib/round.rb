class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turn = Turn.new(guess, current_card)
    @turns << @turn
    @turn
  end

  def number_correct
    @number_correct = 0
    if @turn.correct? == true
      @number_correct += 1
    end
    @number_correct
  end
end
