class Round
  attr_accessor :turns, :deck
  def initialize (deck)
    @turns = []
    @deck = deck
    @correct_categories = []
    end
