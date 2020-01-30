class Round
  attr_reader :deck, :turns, :current_card
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards.first
    @turns_correct = []
  end

  def take_turn(guess)
    turn = Turn.new(guess, @current_card)
    @turns << turn
    if turn.guess == @current_card.answer
      @turns_correct << turn
    end
    old_card = @deck.cards.shift
    @deck.cards.push(old_card)
    turn
  end

  def number_correct
    @turns_correct.length
  end
end
