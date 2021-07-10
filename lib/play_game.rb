require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

class PlayGame
  def initialize
    @cards = CardGenerator.new('cards.txt').cards
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def start_game
    @cards
    begin_game
    game_flow
    end_game
  end

  def begin_game
    puts "Welcome! You're playing with #{@deck.count} cards."
  end

  def game_flow
    until @round.turn_count == (@deck.cards.count + 1)
      puts "This is card number #{@round.turn_count} out of #{@deck.cards.count}."

      puts "Question: #{@round.current_card.question}"
      @round.take_turn(user_guess)
      puts @round.turns.last.feedback.to_s
    end
  end

  def user_guess
    gets.chomp
  end

  def end_game
    puts '****** Game over! ******'
    # iterate over @deck.cards to get catergories
    # then iterate over above and within iteration
    # p #{@round.percent_correct_by_category(:Geography).round(0)}% correct
    puts "You had #{@round.number_correct} correct guesses out of #{@deck.count} for a total score of #{@round.percent_correct}%.
    Geography - #{@round.percent_correct_by_category(:Geography).round(0)}% correct
    Turing - #{@round.percent_correct_by_category(:Turing).round(0)}% correct
    Pesto - #{@round.percent_correct_by_category(:Pesto).round(0)}% correct"
  end
end
