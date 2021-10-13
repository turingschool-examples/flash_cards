require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

@card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
@card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
@card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
@card_4 = Card.new("What is the atomic symbol for Gold?", "Au", :STEM)
@cards = [@card_1, @card_2, @card_3, @card_4]
@deck = Deck.new(@cards)
@round = Round.new(@deck)

def start
  puts "Welcome! You're playing with #{@cards.length} cards."
  puts "-----------------------"
  until @round.deck.count < @round.count do
    puts "This is card number #{@round.count} out of #{@cards.length}."
    puts "Question: #{@round.current_card.question}"
    guess = gets.chomp
    turn = @round.take_turn(guess)
    puts turn.feedback
  end
  puts "****** Game over! ******"
  puts "You had #{@round.number_correct} correct guesses out of #{@cards.length} for a total score of #{@round.percent_correct}%."
  @round.deck.categories.each do |category|
    puts "#{category} - #{@round.percent_correct_by_category(category)}% correct"
  end
end
start
