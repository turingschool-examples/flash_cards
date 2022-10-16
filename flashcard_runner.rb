require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

# file = File.read("cards.txt")
# raw_cards = file.split(/\n+/)
# raw_cards_count = raw_cards.reject{ |raw_card| raw_card.start_with?("#") }.count
raw_cards_count = File.read("cards.txt").split(/\n+/).reject{ |raw_card| raw_card.start_with?("#") }.count
require 'pry'; binding.pry
puts "Welcome! There are #{raw_cards_count} cards available."
puts "How many cards would you like to play with?"
@amount = 0

loop do
  input = gets.chomp.to_i
  if input > 0 && input < raw_cards_count
    @amount = input
    break
  else
    puts "Invalid input. Please enter a number from 1 - #{raw_cards_count}"
  end
end

def start
  def new_round
    Round.new(Deck.new(CardGenerator.new("cards.txt", @amount).cards))
  end

  @round = new_round
  @categories_played = []

  @round.deck.count.times do
    def play_turn
      puts "-------------------------------------------------"
      puts "This is card number #{1 + @round.turns.count} out of #{@round.deck.count}"
      puts "Question: #{@round.current_card.question}"
      
      unless @categories_played.include?(@round.current_card.category)
        @categories_played << @round.current_card.category
      end

      @round.take_turn(gets.chomp)
      puts @round.turns.last.feedback
    end
    play_turn
  end
  
  def results
    puts "-------------------------------------------------"
    puts "****** Game over! ******"
    puts "You had #{@round.number_correct} correct guesses out of #{@round.deck.count} for a total score of #{@round.percent_correct.to_i}%"

    @categories_played.each do |category_played|
      puts "#{category_played} - #{@round.percent_correct_by_category(category_played).to_i}%"
    end
  end

  results
end

loop do
  start # starts the round using the start method defined above
  puts "-------------------------------------------------"
  puts "Would you like to play again?"
  puts "(Y/N)" 
  answer = nil
  loop do
    input = gets.chomp.downcase
    if input == "y" or input == "yes" or input == "n" or input == "no"
      answer = input
      break
    else
      puts "Invalid input. Please type \"Y\" or \"N\""
    end
  end
  
  if answer == "n" or answer == "no"
    puts "-------------------------------------------------"
    puts "Thank you for playing!"
    puts "-------------------------------------------------"
    break
  end
end