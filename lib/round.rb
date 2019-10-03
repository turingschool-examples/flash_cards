# require './turn'
# require './deck'
# require './card'

class Round
  attr_reader :deck

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def turns
    @turns
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, @deck.cards[0])
    @deck.cards.slice!(0)

  end

  def number_correct
    used_cards = @turns.last
    used_cards.correct?
  end
end
