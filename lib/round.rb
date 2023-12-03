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

  def current_card
    deck.collection_card[@current_card_idx]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn

    if turn.correct?
      @correct_guess << turn
      if @correct_categories.key?(current_card.category)
        @correct_categories[current_card.category] += 1
      else
        @correct_categories[current_card.category] = 1
      end
    end
    @current_card_idx += 1
    turn
  end
end
