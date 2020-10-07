require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'

class Round
  attr_reader :deck, :turn
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def number_correct
    num = 0
    @turns.each do |turn|
      if turn.correct?
        num += 1
      end
    end
    num
  end

  def number_correct_by_category(category)
    num = 0
    @turns.each do |turn|
      if turn.correct? && turn.card.category == category
        num += 1
      end
    end
    num
  end

  def take_turn(guess)
    turn = Turn.new(guess,@deck.cards.shift)
    @turns << turn
    turn
  end

  def percent_correct
    if @turns.count == 0
      0
    else
      number_correct / @turns.count * 100
    end
  end

  def percent_correct_by_category(category)
    num_in_cat = 0
    num_right = 0
    @turns.each do |turn|
      if turn.card.category == category
        num_in_cat += 1
        if turn.correct?
          num_right += 1
        end
      end

    end
    if num_in_cat == 0
      p "attempted divide by #{num_in_cat}"
      0
    else
      num_right / num_in_cat * 100
  end
  end

end
