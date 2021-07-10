require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class Game 
  def initialize(round)
    @round = round
    @deck = @round.deck
    @card_number = 1
  end

  def start_game
    puts "Welcome! You're playing with #{@deck.cards.length} cards."
    draw_card
  end

  def draw_card
    if @deck.cards.length > 0
      puts "---------------------------------------"
      puts "This is card number #{@card_number} out of #{@deck.cards.length + @round.used_cards.length}."
      puts "Question: #{@round.current_card.question}"
      puts "What's your guess?"
      puts "---------------------------------------"
      user_guess
    else
      game_over
    end
  end
  
  def user_guess
    @round.take_turn(gets.chomp.downcase)
    puts "You guessed, #{@round.turns.last.guess}"
    puts "#{@round.turns.last.feedback}"
    puts "---------------------------------------"
    @card_number += 1
    draw_card 
  end

  def game_over
    puts "******* Game Over! *******"
    puts "You had #{@round.number_correct} correct guesses out of #{@round.used_cards.length} for a total score of #{@round.percent_correct}%."
    puts "Geography - #{@round.percent_correct_by_category(:Geography)}% correct"
    puts "TV - #{@round.percent_correct_by_category(:TV)}% correct"
    puts "Sports - #{@round.percent_correct_by_category(:Sports)}% correct"
  end
end