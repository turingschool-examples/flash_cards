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
    @turns.select do |turn|           #look at the array of turns and select these
      (turn.guess == turn.card.answer) && (turn.card.category == category)
    end.size                               #output array of turns that are correct

    # @deck.cards_in_category(category).each do #look at each card in the array
    #   @turns.something do |turn|              #
    #     turn.correct? == true
    # @turns.select do |turn|
    #   turn.correct?
    # end
    #returns an array of cards in given category
  end

  # def percent_correct
  # end
  #
  # def percent_correct_by_category(@category)
  # end
end
