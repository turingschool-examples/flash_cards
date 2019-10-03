class Round

  require './lib/turn'
  require './lib/card'
  require './lib/deck'

  attr_accessor :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end
  def current_card
    deck.cards.first
  end
  def take_turn(guesses)
    @turns << Turn.new(guesses, current_card)
    deck.shift
  end
  def number_correct
  end

end
