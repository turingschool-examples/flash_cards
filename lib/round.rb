class Round
  attr_reader :deck, :turns, :number_correct, :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]
    @number_correct = 0
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @current_card)
    @turns << new_turn
    if new_turn.correct?
      @number_correct += 1
    end
    if @deck.cards != []
      @current_card = @deck.cards.shift
    end
    new_turn
  end

  def number_correct_by_category
  end
end
