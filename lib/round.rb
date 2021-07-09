require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_accessor :current_card, :num_turns_taken, :turns
  def initialize(deck)
    @deck = deck
    @num_turns_taken = 0
    @current_card = deck.cards[@num_turns_taken]
    @turns = []
  end

  def take_turn(string) #test file confirm every line of code
    turn = Turn.new(string, @current_card)
    @turns << turn
    @num_turns_taken += 1 #create if statement to reset this num
    @current_card = @deck.cards[@num_turns_taken]
    return turn
  end

  def number_correct
    @turns.find_all {|element| element.is_correct? == true}.length#Rename element into real variable
  end

  def number_correct_by_category(ctgry)
    @turns.find_all do |element|
      element.card.category == ctgry && element.is_correct?
    end
  end

  def percent_correct
    (@turns.find_all {|element| element.is_correct? == true}.length.to_f / @num_turns_taken.to_f) * 100
  end
  #find a way to refactor this with number_correct
end
