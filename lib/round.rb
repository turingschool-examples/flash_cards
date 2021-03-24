require './lib/card'
require "./lib/turn"
require "./lib/deck"

class Round
  attr_reader :turns,
              :deck,
              :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = 0
  end

  def take_turn(guess)
    @guess = guess
    if @current_card < @deck.count
      @new_turn = Turn.new(@guess, @deck[@current_card])
      @turns.push(@new_turn)
      @new_turn
    elsif @current_card >= @deck.count
      puts "****** Game Over!******"
      # puts "You had #{self.Round.number_correct} correct guesses out of #{@deck.count} for a total core of #{}"
    else
      "Error!!!"
    end
  end

  def current_card
    @deck[@current_card]
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def self.number_corret_by_category(category_correct)
    @category_correct = category_correct
    @turn_category_catch = @turns.select do |turn|
      @turns[turn].category == @category_correct
    end
    @turn_category_catch.count do |turn| do
      @turns[turn].correct?
    end
  end

  def number_corret_by_category

  def percent_correct


end
