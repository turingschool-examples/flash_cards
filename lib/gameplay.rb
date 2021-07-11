require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class Gameplay

  def initialize(round)
    @round = round
    @current_card = 1
  end

  def start_game
    puts "Welcome! You're playing with #{@round.deck.initial_card_count} cards."
    draw_card
  end

  def draw_card
    if @round.deck.cards.length > 0
      puts "This is card number #{@current_card} out of #{@round.deck.initial_card_count}."
      puts "Question: #{@round.current_card.question}"
      make_guess
    else
      game_over
    end
  end

  def make_guess
    @round.take_turn(gets.chomp.downcase)
    # puts "You guessed bob"
    puts "#{@round.turns.last.feedback}"
    # binding.pry
    # @round.turns.last.feedbacks
    @current_card += 1
    draw_card
  end

  def game_over
    puts "****** Game over! ******"
    puts "You had #{@round.number_correct} correct guesses out of #{@round.deck.initial_card_count} for a total score of #{@round.percent_correct}%."

    puts "Food - #{@round.percent_correct_by_category(:Food)}% correct"
    puts "Trivia - #{@round.percent_correct_by_category(:Trivia)}% correct"




    # array_of_categories.categories.find do |category|
    #   puts "#{category} - #{@round.percent_correct_by_category(category)} correct"
    # end
  end

  # def array_of_categories
  #   categories = []
  #   @round.deck.cards.each do |card|
  #     categories << card.category
  #   end
  #   categories
  #   # binding.pry
  # end
end
