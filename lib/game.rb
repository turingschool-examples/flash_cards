require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

class Game
  def initialize
    @cards = CardGenerator.new('cards.txt').generate_cards
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def start
    welcome_msg
    turn_interaction
    end_game_total
    end_game_breakdown
  end

  def welcome_msg
    puts "Welcome! You're playing with #{@deck.count} cards."
    puts '-------------------------------------------------'
  end

  def turn_interaction
    @deck.count.times do
      puts "This is card number #{@round.current_card_index} out of #{@deck.count}."
      puts "Question: #{@round.current_card.question}"
      guess = gets.chomp
      most_recent_turn = @round.take_turn(guess)
      puts most_recent_turn.feedback
    end
  end

  def end_game_total
    puts '****** Game over! ******'
    puts "You had #{@round.number_correct} out of #{@deck.count} for a total score of #{@round.percent_correct}%."
  end

  def end_game_breakdown
    cat_access = @cards.map do |card|
      card.category
    end
    cat_access.uniq.each do |cat|
      puts "#{cat} - #{@round.percent_correct_by_category(cat)}% correct"
    end
  end
end
