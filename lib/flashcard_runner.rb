require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class Runner
  def initialize
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    card_4 = Card.new("How many episodes does Friends sitcom have?", "236 eps", :Movies)
    card_5 = Card.new("Who is the first Asian actor/actress to win Oscar?", "Michelle Yeoh", :Movies)
    collection_card = [card_1, card_2, card_3, card_4, card_5]
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
