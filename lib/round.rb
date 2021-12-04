class Round
  attr_reader :round, :turns, :current_card

  def initialize(round)
    @round = round
    @turns = []
    @current_card
  end


  def current_card
    deck.cards.first
  end

  def take_turns(guess)
   @Turns << turns.new(guess, current_card)
   @turns.last
  end
end
