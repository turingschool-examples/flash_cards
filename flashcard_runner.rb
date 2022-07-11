require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

def start  
  filename = "cards.txt"
  cards = CardGenerator.new(filename).cards
  @deck = Deck.new(cards)
  @round = Round.new(@deck)

  puts "\n"
  puts "Welcome! You're playing with #{@deck.count} cards."
  puts "-------------------------------------------------"

  card_categories = []

  @deck.cards.each do |card|
    unless card_categories.include?(card.category) 
      card_categories << card.category
    end 
  end 

  @deck.count.times do 
    puts "\n"
    puts "This is card number #{@round.turn_count + 1 } out of #{@deck.count}"
    puts "Question: #{@round.current_card.question}"
    puts "\n"
    user_guess = gets.chomp
    turn = @round.take_turn(user_guess)   
    puts "\n"
    puts turn.feedback
  end 
  
  puts "\n" 
  puts "****** Game over! ******"
  puts "\n"
  puts "You had #{@round.number_correct} correct guesses out of #{@deck.count} for a total score of #{@round.percent_correct}"
  puts "\n"
  
  card_categories.each do |category|
    puts "#{category} - #{@round.percent_correct_by_category(category)}% correct"
    puts "\n" 
  end  
end 

start 
