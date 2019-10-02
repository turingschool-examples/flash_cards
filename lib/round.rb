class Round
  
  require './lib/turn'
  require './lib/card'
  require './lib/deck'

  attr_accessor :deck, :turns, :guesses
  def initialize(deck)
    @deck = deck
    @guesses
    @turns = []
  end
  def current_card
    deck.cards.first
  end
  def take_turn(turn)
    self.turns << turn.guesses
    p turns
    deck.cards.shift
  end

  def correct?
  end
  def number_correct
  end
  def count
  end
  def last
    self
  end
  def feedback
  end
  def number_correct_by_category(category)
  end
  def percent_correct
  end
  def percent_correct_by_category(category)
  end

end
