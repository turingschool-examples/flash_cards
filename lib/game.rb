require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/flashcard_runner'
require 'CSV'

class Game 
  attr_reader :card_num, :cards
  def initialize
    @card_num = 1
    @cards = load_cards 
  end 

  def load_cards
    card_data = CSV.open("cards.txt")
    card_data.map do |row|
      row = Card.new(row[0], row[1].downcase, row[2])
    end 
  end 

  def start 
    deck = Deck.new(@cards)
    round = Round.new(deck)
    total_deck_num = deck.count 
    turns_array_counter = 0 
    
    puts "Welcome! You're playing with #{total_deck_num} cards."
    puts "           _                  "
    puts "       .__(.)< (Lets test your brain!)"
    puts "        \\___)                "
    puts "~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~"

    until deck.cards.empty? == true 
      puts "This is card number #{card_num} out of #{total_deck_num}."
      puts "Question: #{round.current_card.question}"
      guess = gets.chomp.downcase
      round.take_turn(guess)
      puts round.turns[turns_array_counter].feedback
      puts "-------------------------------------------------"
      @card_num += 1
      turns_array_counter += 1
    end 

    puts "****** Game over! ******"
    puts "           _                  "
    puts "       .__(.)< (Here's your score!)"
    puts "        \\___)                "
    puts "~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~"
    puts "You had #{round.number_correct} out of #{total_deck_num} for a total score of #{round.percent_correct}."
    
    categorys = round.turns.map do |turn|
      turn.card.category
    end.uniq

    categorys.each do |category|
      puts "#{category} - #{round.percent_correct_by_category(category)} correct"
    end
  end 
end 