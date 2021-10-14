class Round
  attr_reader :deck,
              :turns,
              :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 1
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turns <<  Turn.new(guess, current_card)
    @turns[0]
  end

#   def
# #once take trun is over we need to .each
# #to get the next card go from [0] to [1]
#   end


end
