class Round
  require 'pry'
  require './lib/turn'
  require './lib/card'
  require './lib/deck'

  attr_accessor :deck, :turns, :guess
  def initialize(deck)
    @deck = deck
    @turns = []
    @guess
  end
  def current_card
    self.deck.cards.first
  end
  def take_turn(guess)
    self.guess = guess
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
