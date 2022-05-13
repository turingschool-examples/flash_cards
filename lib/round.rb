class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    card = current_card
    turn = Turn.new(guess, card)
      turns << turn
    return turn
  end

  def number_correct
    if @guess == @answer
      @number_correct + 1
    end
  end

  # def number_correct_by_category(category)
  #
  # end

end
