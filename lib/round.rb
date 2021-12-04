require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []

  end
  def current_card
    #current_card =
    @deck.cards[0]
    #return current_card
  end


  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    deck.cards.rotate!(1)
    @turns.last
  end
  def number_correct
    @turns.count do|turn|
      turn.correct?
    end
  end

  def number_correct_by_category(category)
    @turns.count do|turn|
      turn.card.category == category && turn.correct?
      #binding.pry
    end
  end

  def percent_correct
    ((number_correct.to_f / @turns.length.to_f) * 100).round(1)
  end

  def percent_correct_by_category(category)
    ((number_correct_by_category(category).to_f / deck.cards_in_category(category).length.to_f) * 100).round(1)
  end
end
