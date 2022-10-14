require './lib/turn'
require './lib/card'
require './lib/deck'

class Round
  attr_reader :deck, :turns #:number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    # @number_correct = 0
  end

  def current_card
    current_card = @deck.cards # defines local variable to be an array of cards stored in the deck
    current_card[turns.count] # pulls current card from deck based on the number of turns completed
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn # puts new turn into the @turns array
    # if new_turn.correct?
    #   @number_correct += 1
    # end
    return new_turn
  end

  def number_correct # uses .count to return total of turns with correct guesses
    correct = turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(cat_id) # returns a new array of cards if the guess is correct and they're of a category defined by cat_id
    @turns.count do |turn|
      turn.correct? && turn.card.category == cat_id
    end
  end

  def percent_correct # converts number_correct into a percentage of total number of turns
    ((number_correct.to_f / turns.count).round(2)) * 100 
  end

  def percent_correct_by_category(cat_id)
    correct_in_category = @turns.count { |turn| turn.correct? && turn.card.category == cat_id }
    number_in_category = @turns.count { |turn| turn.card.category == cat_id }
    ((correct_in_category.to_f / number_in_category).round(2)) * 100 # converts correct_in_category into a percentage based on amount of cards with certain category
  end
end