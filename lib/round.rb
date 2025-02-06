require './lib/turn'

class Round
  attr_reader :deck, :turns, :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards.first # using the first card in the deck as the current card to start off with, this will be updated as the game goes on by +1
    @number_correct = 0
  end

  def take_turn(guess)
    turn = Turn.new(guess, @current_card)
    @turns << turn
    @number_correct += 1 if turn.correct? # increment the number correct if the turn is correct
    @current_card = @deck.cards[@turns.count] # update the current card to the next card in the deck
    turn
  end

  def number_correct # returns the value of the @number_correct instance variable
    @number_correct 
  end # used this way due to simplicity and readability, cons are I could have messed something up easier (messing up the incrementation etc)

  def number_correct_by_category(category)
    @turns.count { |turn| turn.correct? && turn.card.category == category }
  end

  def percent_correct
    (@number_correct.to_f / @turns.count) * 100 # just convert to a %
  end

  def percent_correct_by_category(category) # will be calculating the percentage instead of storing it and doing calculation later (just to make my runner.rb less cluttered and speeding up calculations by having it in the instance)
    total_in_category = @turns.count { |turn| turn.card.category == category } # total number of turns in the category
    correct_in_category = number_correct_by_category(category) # number of correct turns in the category
    (correct_in_category.to_f / total_in_category) * 100 # return the percentage
  end
end