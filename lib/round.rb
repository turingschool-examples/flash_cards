require './lib/card'
require './lib/turn'
require './lib/deck'
require 'pry'
class Round
  attr_reader :deck,:turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(guess) #takes the turn
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    new_turn
  end

  def amount_correct #aggregates the amount correct
    # number_correct = 0
    @turns.count do |turn|
      turn.correct?
      #   number_correct += 1
      # end
    end
    #number_correct
  end

  def number_correct_by_category(category)
    num_correct_cat = 0
    @turns.each do |turn|
      if turn.correct? && turn.card.category == category
        num_correct_cat += 1
      end
    end
    num_correct_cat
  end

  def percent_correct #overall
    (amount_correct.to_f  / @turns.count) * 100
  end

  def percent_correct_category(category) #**buggged come back to fix
    turn_cat = @turns.find_all do |turn| #find all turns in turn array
      turn.card.category == category #return the number correct in that cateogry * 100
    end.count #aggregate this amount from ^ line
    if turn_cat ==  0
      return 0
    end
    require 'pry';binding.pry
    number_correct_by_category(category) / (turn_cat.to_f) * 100
  end


end #end class
