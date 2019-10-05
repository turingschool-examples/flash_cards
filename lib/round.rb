#round.rb
require_relative 'turn'


class Round
  attr_accessor :deck

  def initialize(deck)
    @deck = deck
    @turns = []
    #@x = 0 #place holder
  end

  def turns
    @turns
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess,@deck.cards[0])
    @deck.cards.slice!(0)
    @turns.last
  end

  def number_correct
    count = 0
    turns.each_index do |i|
      if turns[i].correct?
        count += 1
      end
    end
    count
  end

  def number_correct_by_category(subject)
    count = 0
    turns.each_index do |i|
      if turns[i].card.category == subject #check subject
        if turns[i].correct?               #check correct w/in subject
          count += 1
        end
      end
    end
    count
  end

  def percent_correct
    number_correct.to_f / @turns.size * 100
  end

  def percent_correct_by_category(subject)
    count = 0
    turns.each_index do |i|
      if turns[i].card.category == subject
        count += 1
      end
    end
    number_correct_by_category(subject) / count.to_f * 100
  end
end

#require 'pry'; binding.pry
