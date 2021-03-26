require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

@card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
@card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
@card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
@card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
@card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
@cards = [@card1, @card2, @card3, @card4, @card5]
@deck = Deck.new(@cards)
@round = Round.new(@deck)

def start
  puts "Welcome! You're playing with #{@round.deck.cards.count} cards."
  puts "--------------------------------------------------------------------"
  while @round.current_card_count < (@round.deck.cards.count) do
    puts "This is card #{@round.current_card_count + 1} of #{@round.deck.cards.count}"
    puts "Question: #{@round.deck.cards[@round.current_card_count].question}"
    @player_guess = gets.chomp
    @round.take_turn(@player_guess)
    # require "pry"; binding.pry
    puts (@round.turns[@round.current_card_count - 1].feedback)
  end
  puts "****** Game over! ******"
  puts "You had 3 correct guesses out of 4 for a total score of 75%."
end

start
