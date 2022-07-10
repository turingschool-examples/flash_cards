require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_reader :deck, :turns, :correct_turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_turns = []
    #@round = @card_1
  end

  def current_card
    #@round = Round.new(@deck)
    @deck.cards[@turns.count]
  end

  def take_turn(guess)

    turn_new = Turn.new(guess, current_card)
     if turn_new.correct?
       @correct_turns << turn_new
     end
    @turns << turn_new
    turn_new
  end

  def number_correct
    @correct_turns.count
  end

  def number_correct_by_category(category)
    amount = @correct_turns.select do |turn|
      turn.card.category == category
    end
    amount.count
  end

  def percent_correct
    num_1 = @correct_turns.count.to_f
    num_2 = @turns.count.to_f

    (num_1 / num_2) * 100
  end

  def percent_correct_by_category(category)
    num_1 = @correct_turns.select {|turn| turn.card.category == category}.count.to_f
    num_2 = @turns.select {|turn| turn.card.category == category}.count.to_f

    (num_1 / num_2) * 100
  end
end
