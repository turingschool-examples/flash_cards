require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

class Game
  attr_reader :round
  def initialize(round)
    @round = round
  end

  def start_message
    puts "Welcome! You're playing with #{@round.card_count} cards. \n
    ------------------------------------------------- \n"
  end

  def card_count_ratio
    puts "This is card number #{@round.turn_count} out of #{@round.card_count}. \n"
  end

  def get_user_input
    gets.chomp
  end

  def start_the_round

    while @round.deck.cards.count > 0 do
      card_count_ratio
      puts @round.current_question
      puts @round.take_turn(get_user_input).feedback
    end
    game_over
  end

  def start
    start_message
    start_the_round
  end

  def game_over
  puts "***** Game over! ***** \n You had #{@round.number_correct} correct guesses out of #{@round.card_count} for a total score of #{@round.percent_correct}% "
    game_over_categories
  end

  def game_over_categories
    categories = @round.turns.map do |turn|
      turn.card.category
    end

    categories.uniq.each do |category|
      percentage = @round.percent_correct_by_category(category)
      puts "#{category} - #{percentage.round}% correct"
    end
  end
end
