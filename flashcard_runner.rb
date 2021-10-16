require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

# Creates setup for flash cards to play with
@card_1 = Card.new("What is 5 + 5?", "10" || "ten" || 10, :STEM)
@card_2 = Card.new("What is Rachel's favorite animal?", "Cat", "Pop Culture")
@card_3 = Card.new("What is Mike's middle name?", "Nobody knows", "Turing Staff")
@card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Turing Staff")
@deck = Deck.new([@card_1, @card_2, @card_3, @card_4])
@round = Round.new(@deck)
@num_stem =@round.deck.cards_in_category(:STEM).size
@num_turing = @round.deck.cards_in_category("Turing Staff").size
@num_pop = @round.deck.cards_in_category("Pop Culture").size

# Start method initiates play / iterates through deck / asks for user input
def start

puts "Welcome! You're playing with #{@round.deck.cards.count}
-------------------------------------------------"
puts "This is card number #{@round.turns.length + 1} out of #{@round.deck.cards.count} cards.
Question: #{@round.deck.cards.first.question}"
# require 'pry'; binding.pry
while @round.deck.cards != []
  guess = $stdin.gets.strip
  if guess.include?("")
    guess.capitalize
  end
  @round.take_turn(guess.capitalize)
  "#{@round.turns.last.feedback}"
   require "pry"; binding.pry
  puts "This is card number #{@round.turns.length + 1}" if @round.deck.cards != []
  puts "#{@round.deck.cards.first.question}" if @round.deck.cards != []
  end
  puts "****** Game over! ******"
  puts "You had #{@round.number_correct} correct guesses out of #{@round.turns.length} for a total score of #{@round.percent_correct}%"
  puts "STEM - #{@round.number_correct_by_category(:STEM).to_f / @num_stem * 100 }%"
  puts "Turing Staff - #{@round.number_correct_by_category("Turing Staff").to_f / @num_turing * 100 }%"
  puts "Pop Culture - #{@round.number_correct_by_category("Pop Culture").to_f / @num_pop * 100}%"



end



start
