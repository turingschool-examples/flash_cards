require './lib/turn'

class Round
  attr_reader :deck,
              :turns,
              :current_card_idx
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card_idx = 0
    @correct_guess = []
    @correct_categories = {}
  end


end
