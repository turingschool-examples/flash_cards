require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
def start 
  @card_1 = Card.new("Who played Mr. Spock on the 1960's television show Star Trek?", "Leonard Nimoy", :Televison)
  @card_2 = Card.new("Which James Bond film was released in 1962?", "Dr. No", :Film)
  @card_3 = Card.new("Which Romani guitarist is credited with creating the musical style known as Gypsy Jazz?", "Django Reinhardt", :Music)
  @card_4 = Card.new("Which character did Gillian Anderson play in the 1990's televsion show The X-Files?", "Dana Scully", :Television)
  
  @deck = Deck.new([@card_1, @card_2, @card_3, @card_4])
  
  @round = Round.new(@deck)

  puts "\n"
  puts "Welcome! You're playing with #{@deck.count} cards."
  puts "-------------------------------------------------"

  card_categories = []

  @deck.count.times do 
    puts "\n"
    puts "This is card number #{@round.turn_count + 1 } out of #{@deck.count}"
    puts "Question: #{@round.current_card.question}"
    card_categories << @round.current_card.category.
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

  require 'pry'; binding.pry
  
  card_categories.each do |card|
    puts "#{card} - #{@round.percent_correct_by_category(card)}% correct"
  end  
end 

start 
