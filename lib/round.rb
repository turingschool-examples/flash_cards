class Round
attr_reader :deck,
            :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
  #  @current_card = current_card
    deck.cards.first
  end

#  def take_turn(guess)
#    @take_turn(guess)
#  end
  def take_turn(guess)
    turn = Turn.new(guess, deck.cards.shift)
    @turns << turn
    return turn 
  #  made_guesses = []
  #  @guess = guess
  #  @round.each do |round|
  #    if guess == round.guess
  #    end
  #  end
  #  return made_guesses
  end
end
