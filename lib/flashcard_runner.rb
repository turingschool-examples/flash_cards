require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require "./lib/card_generator"

class Runner
  def initialize
    filename = 'cards.txt'
    card_generator = CardGenerator.new(filename)
    collection_card = card_generator.cards
    @deck = Deck.new(collection_card)
    @round = Round.new(@deck)
  end

  def start
    puts "Welcome! You are playing with #{@deck.collection_card.count} cards"
    puts "-------------------------------------"
    @deck.collection_card.count.times do
      current_card_number = @round.current_card_idx + 1
      puts "This is card number #{current_card_number} out of #{@deck.collection_card.count}"
      puts "Question: #{@round.current_card.question}"
      guess_feedback
    end
  end

  def user_guess
    puts "Enter your guess"
    guess = gets.chomp
  end

  def guess_feedback
    turn = @round.take_turn(user_guess)
    p turn.feedback
  end

  def final_score
    puts "****** Game over! ******"
    puts "You had #{@round.number_correct} correct guesses out of #{@deck.collection_card.count} for a total score of #{@round.percent_correct}."
    categories = @deck.collection_card.map {|card| card.category}.uniq
    categories.each do |category|
    puts "#{category} - #{@round.percent_correct_by_category(category)} % correct"
    end
  end
end

runner = Runner.new()
runner.start
runner.final_score
