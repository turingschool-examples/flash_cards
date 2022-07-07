class Round
  attr_accessor :deck, :turns, :turn, :current_card, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    # returns the first element of the deck.cards array and removes it from the array
    @current_card = @deck.cards.shift
    @number_correct = 0
  end

  def take_turn(guess)
    @turn = Turn.new(guess, @current_card)
    @turns << @turn

    @number_correct += 1 if @turn.correct? == true

    @current_card = @deck.cards.shift

    @turn
  end
end
