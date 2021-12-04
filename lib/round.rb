class Round
  attr_reader :round, :turns, :current_card, :deck

  def initialize(deck)
    @round = round
    @deck = []
    @turns = []
    @current_card = deck.cards[0]
    # @deck = deck
  end


  # def current_card
  #   @deck.cards.first
  # end

  def take_turns(guess)
   @Turns << turns.new(guess, current_card)
   @turns.last
  end
end
