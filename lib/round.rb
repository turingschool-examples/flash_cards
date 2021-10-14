require '/turn'

class Round
  attr_reader :deck, :turns, :round

  #need attributes for: deck, turns, number correct,
  def initialize(deck)
    @deck = deck
    @number_correct = 0
    @turns = []
    @round = 0
  end

  #need methods for: take_turn, current_card, correct?, number_correct
  def current_card
    @deck.cards[@round - 1]
  end

  def take_turn(response)
    #need to iterate through the cards/get the card to match current card
    turn = Turn.new(response, @deck.cards[@round])
    @round += 1
    @turns << turn
    turn
  end
end
