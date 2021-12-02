require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

filename = "cards.txt"
cards = CardGenerator.new(filename).cards
deck = Deck.new(cards)
round = Round.new(deck)

def start(round)
  puts "Welcome! You're playing with #{round.deck.cards.length} cards." #inserts how many cards are in
  puts "-" * 50                                                         # the deck
  while round.turns.length < round.deck.cards.length #tracks when all cards have been attempted
    puts "This is card number #{round.turns.length + 1} out of #{round.deck.cards.length}." #turns starts with 0 turns so '+ 1 ' is added
    puts "Question: #{round.current_card.question}" #gets question of current_card
    guess = gets.chomp #gets users guess
    round.take_turn(guess) #provides user guess as argument
    p round.turns.last.feedback #returns feedback of most recent turn
  end
  gameover(round) #once all cards have been attempted - run gameover method
end

def gameover(round)
  puts "****** Game over! ******"
  puts "You had #{round.number_correct} correct guesses out of #{round.deck.cards.length} for a total score of #{round.percent_correct.to_i}%"
  categories = [] #empty container for upcoming iteration
  round.turns.each do |turn|
    categories << turn.card.category unless categories.include?(turn.card.category) #creates an array of categories preventing duplicates
  end
  categories.each do |category| #iterate through each category and provide % correct
    puts "#{category} - #{round.percent_correct_by_category(category).to_i}% correct"
  end
end

start(round) #start flashcard game 
