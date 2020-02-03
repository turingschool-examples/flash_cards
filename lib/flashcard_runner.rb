require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'

class Game
  attr_reader :card_number, :round1, :deck1
  def initialize
    @card_number = 1
    filename = './lib/cards.txt'
    @cards = CardGenerator.new(filename).cards
    @deck1 = Deck.new(@cards)
    @round1 = Round.new(@deck1)
  end

  def welcome
    puts "Welcome! You're playing with #{@cards.count} cards."
    puts "--------------------------------------------------"
    puts "- - - - - - - -Hit any key to start- - - - - - - -"
    puts "--------------------------------------------------"
    puts ">"
    @start_key = $stdin.gets.chomp
  end
  
  def start
    @deck1.cards.each do |card|
    puts "This card number #{@card_number} out of #{@cards.count}"
    puts "Question: #{@round1.current_card.question}"
    puts ">"
    user_guess = $stdin.gets.chomp
    new_turn = Turn.new(user_guess, @round1.current_card)
    @round1.take_turn(user_guess)
    @card_number += 1
    puts new_turn.feedback
    end
  end

  def game_results
    puts "*-*-*-* GAME OVER *-*-*-*"
    puts "You had #{@round1.number_correct} correct guesses out of #{@cards.length}
     for a total score of #{round1.percent_correct}"

    puts "Math - #{@round1.percent_correct_by_category(:Math)}%"
    puts "Geography - #{@round1.percent_correct_by_category(:Geography)}%"
    puts "Culture - #{@round1.percent_correct_by_category(:Culture)}%"
  end
end

game1 = Game.new
game1.welcome
game1.start
game1.game_results
