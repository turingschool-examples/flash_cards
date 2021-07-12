require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/card_generator'

class Round
  attr_accessor :current_card, :num_turns_taken, :turns , :number_correct_by_category
  def initialize(deck)
    @deck = deck
    @num_turns_taken = 0
    @current_card = deck.cards[@num_turns_taken]
    @turns = []
  end

  def take_turn(string) #test file confirm every line of code
    turn = Turn.new(string, @current_card)
    @turns << turn
    @num_turns_taken += 1
    @current_card = @deck.cards[@num_turns_taken]
    return turn
  end

  def number_correct
    correct = []
    @turns.each do |element|
      if element.is_correct? == true
         correct << element
      end
    end
    correct.length
  end

  def number_correct_by_category(input_category)
    x = []
    @turns.each do |turn|
      if turn.card.category == input_category
        if turn.is_correct?
          x << turn
        end
      end
    end
    x.length
  end

  def percent_correct
    ((number_correct.to_f / @deck.count.to_f) * 100).to_i
  end

  def percent_correct_by_category(input_category)
      (((number_correct_by_category(input_category).to_f) / (@deck.cards_in_category(input_category).length).to_f) * 100).to_i
  end

end
