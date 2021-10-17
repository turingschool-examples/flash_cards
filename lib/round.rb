require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_reader :deck, :turns, :percent, :correct_category
  def initialize(deck)
    @deck = deck
    @turns = []
    @percent = percent
    @correct_category = correct_category

  end

  # Returns the first element
  def current_card
    @deck.cards[0]
  end

  # Will create a new instance of Turn with the guess as an argument
  # It will then take the turn instance and place it in an array
  #
  def take_turn(guess)
    turn = Turn.new(guess, @deck.cards[0])
    @turns << turn
    @deck.cards.shift #deck
    @turns.last

  end

  def number_correct
    #This will grab all elements in array and see if they are correct
    #Any element that is correct, will be counted
    @turns.select { |c| c.correct? == true}.count
  end

  def percent_correct
    @percent = @turns.select { |c| c.correct? == true}.count.to_f / @turns.count
    @percent * 100
  end

  def number_correct_by_category(corr)
    @correct_category = @turns.select { |corr_turn| corr_turn.correct? == true}

    @correct_category.select {|correct| correct.card.category  == corr}.count
  end

  def turns_correct_by_category(cat)
    count = 0
    @turns.select do |turn|
      if turn.card.category == cat
        count += 1
      end
    end
    count
  end

  def percent_correct_by_category(percent_corr)
    number_correct
    num = number_correct_by_category(percent_corr).to_f
    den = turns_correct_by_category(percent_corr)
    result = (num / den) * 100
    result.round
  end
end
