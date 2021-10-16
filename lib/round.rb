require './lib/deck'

class Round
  attr_accessor :deck, :turns, :count

  def initialize(deck)
    @deck = deck
    @turns = []
    @count = 0
  end

  def current_card
    @deck.cards[@count - @deck.cards.length]
  end


  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @count += 1
    @turns[-1]
  end

  def number_correct
    @turns.select do |turn|
      turn.correct?
    end.size
  end

  def number_correct_by_category(category)
    @deck.cards_in_category(category).each do
      # @turns.select do |turn|
        @turns.correct? do
      end
    end
  end

  # def percent_correct
  # end
  #
  # def percent_correct_by_category(@category)
  # end
end
