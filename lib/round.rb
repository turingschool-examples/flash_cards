class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck =  deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    turn_guess = Turn.new(guess, current_card)
    @turns << turn_guess
    turn_guess
  end
end
