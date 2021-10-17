require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck              = deck
    @turns             = []
    @correct_responses = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards.shift
    turn
  end

  def number_correct
    @turns.select do |turn|
      if turn.correct? == true
        @correct_responses << turn
      end
    end
    @correct_responses.uniq.length
  end

  def number_correct_by_category(category)
    number_correct
    @correct_responses.uniq.select do |response|
      response.card.category == category
    end.length
  end

  def percent_correct
    number_correct
    numerator   = @correct_responses.uniq.length
    denominator = @turns.length.to_f
    (numerator / denominator).round(4) * 100
  end

  def turns_per_category(category)
    counter = 0
    @turns.select do |turn|
      if turn.card.category == category
        counter += 1
      end
    end
    counter
  end

  def percent_correct_by_category(category)
    number_correct
    numerator   = number_correct_by_category(category).to_f
    denominator = turns_per_category(category)
    (numerator / denominator).round(4) * 100
  end

  def start
    puts "Welcome! You are playing with #{deck.count} cards"
    until @turns.length == deck.count do
      puts "-" * 15
      puts "This is card number #{(turns.length.to_i) + 1} of #{@deck.count}"
      puts "#{current_card.question}"
      guess = gets.chomp
      puts (take_turn(guess)).feedback
    end

    puts """
    -------GAME OVER-------
    You had #{number_correct} guesses out of 5 for a total score of #{percent_correct}%
    Geography -- #{percent_correct_by_category(:Geography)}% correct
    STEM      -- #{percent_correct_by_category(:Stem)}% correct
    """
  end
end
