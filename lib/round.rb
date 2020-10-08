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
    #puts "How many turns u done got right ---> #{number_correct}"
    if @turns.count == 0
      0
    else
      (number_correct.to_f / @turns.count.to_f) * 100
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
      0
    else
      num_right.to_f / num_in_cat.to_f * 100
    end
  end

  def categories_in_deck
    categories = []
    @turns.each do |turn|
      categories << turn.card.category
    end
    categories.uniq
  end

end
